#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "quarantinesound.h"

//prototypes
OBJ_ATTR shadowOAM[128]; //shadowOAM to DMA into realOAM
PLAYER player; //OAM[0] 0-15
ENEMY enemies[MAXENEMIES]; //OAM[1] - OAM[8] 16-31
QUARANTINE quarantines[MAXQUARANTINES]; // OAM[9] - OAM[13]
SYRINGE syringes[MAXSYRINGES];// OAM[14] - OAM[23]
RNA rnas[MAXRNAS];// OAM[24] - OAM[39]
HEART hearts[MAXHEARTS];// OAM[40] - OAM[45]
int enemiesOnScreen;
int enemySpawnRate;
int enemiesKilled;
int quarantinesOnScreen;
int quarantineSpawnRate;

void initGame() {
    //sprite pal and stuff are loaded in goToStart()
    initPlayer();
    initEnemies();
    enemiesOnScreen = 0;
    enemySpawnRate = ENEMYSPAWNRATEBASE + (rand()%50);
    enemiesKilled = 0;
    initQuarantines();
    quarantinesOnScreen = 0;
    quarantineSpawnRate = QUARANTINESPAWNRATEBASE + (rand()%100);
    initSyringes();
    initRNAs();
    initHearts();

    //copy to real OAM
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void initPlayer() {
    //set player fields
    player.row = 4; //4 because each gridtile is 40x40px and the player sprite is 32x32
    player.col = 4;
    player.cdel = 40;
    player.rdel = 40;
    player.width = 32;
    player.height = 32;
    player.damage = 1;
    player.health = MAXHEARTS;
    player.tookDamageFlag = 0;
    player.aniCounter = 0;
    player.curFrame = 1;
    player.numFrames = 2;
    player.cheatFlag = 0;
    //shadowOAM player
    shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = player.col | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0);
}

void initEnemies() {
    //init all enemies inactive
    for (int i = 0; i < MAXENEMIES; i++) {
        enemies[i].row = 2 * 40 + 4; //+4 is because each gridtile is 40x40px and the player sprite is 32x3
        enemies[i].col = 4 * 40 + 4;
        enemies[i].cdel = 40;
        enemies[i].rdel = 40;
        enemies[i].width = 32;
        enemies[i].height = 32;
        enemies[i].health = ENEMYMAXHEALTH;
        enemies[i].active = 0;
        enemies[i].erased = 0;
        enemies[i].spawnTimer = 0;
        enemies[i].RNATimer = 0;
        enemies[i].curFrame = 1;
        enemies[i].numFrames = 4;
        enemies[i].aniCounter = 0;
    }
}

void initQuarantines() {
    for (int i = 0; i < MAXQUARANTINES; i++) {
        quarantines[i].row = 0;
        quarantines[i].col = 0;
        quarantines[i].cdel = 40;
        quarantines[i].rdel = 40;
        quarantines[i].width = 32;
        quarantines[i].height = 32;
        quarantines[i].active = 0;
        quarantines[i].erased = 0;
        quarantines[i].spawnTimer = 0;
        quarantines[i].curFrame = 1;
        quarantines[i].numFrames = 4; //goes 1-4
        quarantines[i].aniCounter = 0;
    }
}

void initSyringes() {
    for (int i = 0; i < MAXSYRINGES; i++) {
        syringes[i].row = player.row;
        syringes[i].col = player.col;
        syringes[i].cdel = 2;
        syringes[i].width = 8;
        syringes[i].height = 8;
        syringes[i].active = 0;
        syringes[i].erased = 0;
    }
}

void initRNAs() {
    for (int i = 0; i < MAXRNAS; i++) {
        rnas[i].row = 0;
        rnas[i].col = 0;
        rnas[i].cdel = 1;
        rnas[i].width = 8;
        rnas[i].height = 8;
        rnas[i].active = 0;
        rnas[i].erased = 0;
    }
}

void initHearts() {
    for (int i = 0; i < MAXHEARTS; i++) {
        hearts[i].row = 2;
        hearts[i].col = 3 + (10 * i);
        hearts[i].active = 1;
        hearts[i].erased = 0;
        //drawn them onto the screen
        shadowOAM[i + 40].attr0 = hearts[i].row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[i + 40].attr1 = hearts[i].col | ATTR1_TINY;
        shadowOAM[i + 40].attr2 = ATTR2_TILEID(0, (3 * 4)+2);
    }
}

void updateGame() {
    updatePlayer();
    updateEnemies();
    updateQuarantines();
    updateSyringes();
    updateRNAs();
    updateHearts();

    //check win condition
    if (enemiesKilled >= WINCONDITION) {
        goToWin();
    }
    //check lose condition
    if (player.health <= 0) {
        goToLose();
    }
    //copy to real OAM
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void updatePlayer() {
    //player movement logic
    if (BUTTON_PRESSED(BUTTON_UP) && player.row > GRIDTOPPIXEL) {
        player.row -= player.rdel;
    }
    if (BUTTON_PRESSED(BUTTON_DOWN) && player.row < GRIDBOTTOMPIXEL) {
        player.row += player.rdel;
    }
    if (BUTTON_PRESSED(BUTTON_LEFT) && player.col > GRIDLEFTPIXEL) {
        player.col -= player.cdel;
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT) && player.col < GRIDRIGHTPIXEL) {
        player.col += player.cdel;
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        fireSyringe();
    }
    //check cheatFlag
    if (BUTTON_PRESSED(BUTTON_B)) {
        player.cheatFlag = !player.cheatFlag; //switch cheatFlag
        if (player.cheatFlag) {
            player.damage = ENEMYMAXHEALTH + 1; //if toggle cheat, then one-hit kill the enemies
        } else {
            player.damage = 1;
        }
    }
    //player animation
    player.aniCounter++;
    if (player.aniCounter == PLAYERANIIMATIONRATE) {
        player.aniCounter = 0;
        player.curFrame = player.curFrame==player.numFrames ? 1 : player.curFrame + 1; //if on last frame, reset to 0, else add 1
    }
    if (player.health > 0) { //only draw if player is still alive
    //shadowOAM player
        shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[0].attr1 = player.col | ATTR1_MEDIUM;
        shadowOAM[0].attr2 = ATTR2_TILEID((player.curFrame - 1)*4, 0);
    }
}

void updateEnemies() {
    //enemy spawn logic
    if (enemiesOnScreen < MAXENEMIES) {
        for (int j = 0; j < MAXENEMIES; j++) {
            if (!enemies[j].active) { //find first inactive enemy
                enemies[j].spawnTimer += 1;
                if (enemies[j].spawnTimer == enemySpawnRate) {
                    enemies[j].spawnTimer = 0; //reset spawn timer
                    enemies[j].active = 1; //set as active
                    enemies[j].erased = 0;
                    enemies[j].health = 10;
                    findSafeRowAndColForEnemy(&enemies[j]);
                    enemiesOnScreen++;
                }
                break;//leave for-loop after finding inactive enemy
            }
        }
    }
    for (int i = 0; i < MAXENEMIES; i++) {
        if (enemies[i].active) {
            //enemy RNA logic
            //increment their timer
            enemies[i].RNATimer += 1;
            if (enemies[i].RNATimer == ENEMYFIRERATE) {
                enemies[i].RNATimer = 0; //reset fire timer
                //fire RNA
                for (int j = 0; j < MAXRNAS; j++) {
                    if (!rnas[j].active) {
                        rnas[j].active = 1;
                        rnas[j].erased = 0;
                        rnas[j].row = enemies[i].row + enemies[i].height/2 - rnas[j].height/2;
                        rnas[j].col = enemies[i].col;
                        break;
                    }
                }
            }
            //check if enemy has been killed
            if (enemies[i].health <= 0) {
                enemies[i].active = 0;
                enemies[i].erased = 1;
                enemies[i].RNATimer = 0;
                enemiesOnScreen--;
                enemiesKilled++;
            }
            //update animation
            enemies[i].aniCounter++;
            if (enemies[i].aniCounter == ENEMYANIMATIONRATE) {
                enemies[i].aniCounter = 0;
                enemies[i].curFrame = enemies[i].curFrame==enemies[i].numFrames ? 1 : enemies[i].curFrame + 1; //if on last frame, reset to 0, else add 1
            }
            if (enemies[i].erased) {
                shadowOAM[i + 1].attr0 = ATTR0_HIDE;
            } else {
                //not erased, continue to draw
                if (player.health > 0) {
                    shadowOAM[i + 1].attr0 = enemies[i].row | ATTR0_4BPP | ATTR0_SQUARE;
                    shadowOAM[i + 1].attr1 = enemies[i].col | ATTR1_MEDIUM;
                    shadowOAM[i + 1].attr2 = ATTR2_TILEID(((enemies[i].curFrame - 1) * 4), 1 * 4);
                }
            }
        }
    }
}

void updateQuarantines() {
    //quarantine spawn logic
    if (quarantinesOnScreen < MAXQUARANTINES) {
        for (int i = 0; i < MAXQUARANTINES; i++) {
            if (!quarantines[i].active) { //find first inactive one
                quarantines[i].spawnTimer++;
                if (quarantines[i].spawnTimer == quarantineSpawnRate) { //time to spawn this quarantine
                    quarantines[i].spawnTimer = 0;
                    quarantines[i].active = 1;
                    quarantines[i].erased = 0;
                    quarantines[i].aniCounter = 0;
                    quarantines[i].curFrame = 0;
                    quarantines[i].hitPlayer = 0;
                    findRowAndColForQuarantine(&quarantines[i]);
                    quarantinesOnScreen++;
                }
                break;
            }
        }
    }
    //draw quarantines
    for (int i = 0; i < MAXQUARANTINES; i++) {
        if (quarantines[i].active) {
            //check for damage, only do damage if quarantine is on last frame and hasn't already hit player
            if ((quarantines[i].curFrame == quarantines[i].numFrames) && !quarantines[i].hitPlayer) {
                //if hit player, deal damage, set hitPlayer to true
                if (collision(player.col, player.row, player.width, player.height, quarantines[i].col, quarantines[i].row, quarantines[i].width, quarantines[i].height)) {
                    quarantines[i].hitPlayer = 1;
                    player.health--;
                    player.tookDamageFlag = 1;
                }
            }
            //update aniCounter
            quarantines[i].aniCounter++;
            if (quarantines[i].aniCounter == 34 && quarantines[i].curFrame == 3) { //this if is to time it correctly
                playSoundB(quarantinesound, QUARANTINESOUNDLEN, 0);
            }
            if (quarantines[i].aniCounter == QUARANTINEANIMATIONRATE) {
                quarantines[i].aniCounter = 0; //reset aniCounter
                //go up a frame
                quarantines[i].curFrame++;
            }
            //if goes to frame 2, swap between frame 2 and 3 every tick
            if (quarantines[i].curFrame == 2 || quarantines[i].curFrame== 3) {
                if (quarantines[i].curFrame == 2) {
                    quarantines[i].curFrame = 3;
                } else {
                    quarantines[i].curFrame = 2;
                }
            }
            //check if exceed last frame
            if (quarantines[i].curFrame > quarantines[i].numFrames) {
                //set it as inactive
                quarantines[i].active = 0;
                //erase sprite
                shadowOAM[i + 9].attr0 = ATTR0_HIDE;
                quarantinesOnScreen--;
            } else {
                shadowOAM[i + 9].attr0 = quarantines[i].row | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[i + 9].attr1 = quarantines[i].col | ATTR1_MEDIUM;
                shadowOAM[i + 9].attr2 = ATTR2_TILEID(((quarantines[i].curFrame - 1) * 4), 2 * 4);
            }
        }
    }
}

void updateSyringes() {
    for (int i = 0; i < MAXSYRINGES; i++) {
        if (syringes[i].active) {
            //syringe movement
            syringes[i].col += syringes[i].cdel;
            if (syringes[i].col > 240) { //if goes off screen, set it as inactive
                syringes[i].active = 0;
            }
            //check if collision with enemy
            for (int j = 0; j < MAXENEMIES; j++) {
                if (enemies[j].active) {
                    if (collision(syringes[i].col, syringes[i].row, syringes[i].width, syringes[i].height, enemies[j].col, enemies[j].row, enemies[j].width, enemies[j].height)) {
                        //if collision
                        //hide syringe
                        syringes[i].active = 0;
                        syringes[i].erased = 1;
                        //damage enemy
                        enemies[j].health -= syringes[i].damage;
                        //check if kill enemy in updateEnemies();
                    }
                }
            }
            if (syringes[i].erased) { //if syringe erased
                shadowOAM[i + 14].attr0 = ATTR0_HIDE;
            } else { //if not erased, add to shadowOAM
                //shadowOAM
                if (player.health > 0) {
                    shadowOAM[i + 14].attr0 = syringes[i].row | ATTR0_4BPP | ATTR0_SQUARE;
                    shadowOAM[i + 14].attr1 = syringes[i].col | ATTR1_TINY;
                    shadowOAM[i + 14].attr2 = ATTR2_TILEID(syringes[i].damage==1?0:1, 3 * 4);
                }
            }
        }
    }
}

void updateRNAs() {
    for (int i = 0; i < MAXRNAS; i++) {
        if (rnas[i].active) {
            //rna movement
            rnas[i].col -= rnas[i].cdel;
            if (rnas[i].col < 0) { //if it goes off screen, set it as inactive
                rnas[i].active = 0;
                rnas[i].erased = 1;
            }
            //check for collision with player
            if (collision(player.col, player.row, player.width, player.height, rnas[i].col, rnas[i].row, rnas[i].width, rnas[i].height)) {
                //if collision
                //hide rna
                rnas[i].active = 0;
                rnas[i].erased = 1;
                //damage the player here
                player.health--;
                player.tookDamageFlag = 1;
            }
            if (rnas[i].erased) { //if syringe erased, hide the sprite
                shadowOAM[i + 24].attr0 = ATTR0_HIDE;
            } else {
                //shadowOAM
                if (player.health > 0) {
                    shadowOAM[i + 24].attr0 = rnas[i].row | ATTR0_4BPP | ATTR0_SQUARE;
                    shadowOAM[i + 24].attr1 = rnas[i].col | ATTR1_TINY;
                    shadowOAM[i + 24].attr2 = ATTR2_TILEID(0, (3 * 4)+1);
                }
            }
        }
    }
}

void updateHearts() {
    if (player.tookDamageFlag) {
        player.tookDamageFlag = 0; //reset flag
        //erase a heart
        for (int i = MAXHEARTS - 1; i >= 0; i--) {
            if (hearts[i].active) {
                hearts[i].active = 0;
                shadowOAM[i + 40].attr0 = ATTR0_HIDE;
                break;
            }
        }
    }
}

void findSafeRowAndColForEnemy(ENEMY* e) {
    int found = 0;
    int col;
    int row;
    while (!found) { //while has not been 
        found = 1; //set to 1 initially
        col = ((rand()%2) * 40) + 164; //124 bc have to offset the grids on the player side
        row = ((rand()%5) * 40) + 4; //4 bc is 32x32px but gridsquare is 40x40
        for (int i = 0; i < MAXENEMIES; i++) {
            if (enemies[i].active) {
                //check all active enemies
                if (enemies[i].col == col && enemies[i].row == row) {
                    found = 0; //if any have the same row and col, then found = 0 bc need to keep searching
                }
            }
        }
    }
    //after passing while loop, a row and col have been found, set to enemies
    e -> row = row;
    e -> col = col;
}

void findRowAndColForQuarantine(QUARANTINE* q) {
    int spawnUnderPlayer = rand()%2; // 50% chance to spawn directly under player
    int col;
    int row;
    int found = 0;
    
    while (!found) {
        found = 1;
        col = ((rand()%3)*40) + 4;
        row = ((rand()%5)*40) + 4;
        if (spawnUnderPlayer) {
            for (int i = 0; i < MAXQUARANTINES; i++) {
                if (quarantines[i].active) {
                    if (quarantines[i].col == player.col && quarantines[i].row == player.row) {
                        //means there is already a quarantine under the player, need to spawn a new one somewhere else
                        found = 0;
                        spawnUnderPlayer = 0;
                    }
                }
            }
            col = player.col;
            row = player.row;
        } else {
            //do not spawn it under the player, spawn it randomly somewhere
            for (int i = 0; i < MAXQUARANTINES; i++) {
                if (quarantines[i].active) {
                    if (quarantines[i].col == col && quarantines[i].row == row) {
                        found = 0; //another quarantine is already there, have to keep looking
                    }
                }
            }
        }
    }
    q -> row = row;
    q -> col = col;
}
void fireSyringe() {
    for (int i = 0; i < MAXSYRINGES; i++) {
        if (syringes[i].active == 0) { //first inactive syringe
            //activate it
            syringes[i].active = 1;
            syringes[i].erased = 0;
            //set its damage
            syringes[i].damage = player.damage;
            //fire from player's location
            syringes[i].row = player.row + player.height/2 - syringes[i].height/2;
            syringes[i].col = player.col + player.width;
            //leave for-loop
            break;
        }
    }
}

void drawHearts() {
    for (int i = 0; i < MAXHEARTS; i++) {
        if (hearts[i].active) {
            shadowOAM[i + 40].attr0 = hearts[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + 40].attr1 = hearts[i].col | ATTR1_TINY;
            shadowOAM[i + 40].attr2 = ATTR2_TILEID(0, (3 * 4)+2);
        }
    }
}