#include "myLib.h"
#include "game.h"
#include "spritesheet.h"

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

void initGame() {
    //sprite pal and stuff are loaded in goToStart()

    initPlayer();
    initEnemies();
    enemiesOnScreen = 0;
    enemySpawnRate = ENEMYSPAWNRATEBASE + (rand()%50);
    enemiesKilled = 0;
    initQuarantines();
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
        enemies[i].health = 10;
        enemies[i].active = 0;
        enemies[i].erased = 0;
        enemies[i].spawnTimer = 0;
        enemies[i].RNATimer = 0;
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
    updateSyringes();
    updateRNAs();
    updateHearts();

    //check win condition
    if (enemiesKilled >= WINCONDITION) {
        goToWin();
    }
    //copy to real OAM
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void updatePlayer() {
    //check if player died
    if (player.health <= 0) {
        goToLose();
    }
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
    if (player.health > 0) { //only draw if player is still alive
    //shadowOAM player
        shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[0].attr1 = player.col | ATTR1_MEDIUM;
        shadowOAM[0].attr2 = ATTR2_TILEID(0, 0);
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
            if (enemies[i].erased) {
                shadowOAM[i + 1].attr0 = ATTR0_HIDE;
            } else {
                //not erased, continue to draw
                if (player.health > 0) {
                    shadowOAM[i + 1].attr0 = enemies[i].row | ATTR0_4BPP | ATTR0_SQUARE;
                    shadowOAM[i + 1].attr1 = enemies[i].col | ATTR1_MEDIUM;
                    shadowOAM[i + 1].attr2 = ATTR2_TILEID(0, 1 * 4);
                }
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
                        enemies[j].health -= player.damage;
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
                    shadowOAM[i + 14].attr2 = ATTR2_TILEID(0, 3 * 4);
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

void fireSyringe() {
    for (int i = 0; i < MAXSYRINGES; i++) {
        if (syringes[i].active == 0) { //first inactive syringe
            //activate it
            syringes[i].active = 1;
            syringes[i].erased = 0;
            //fire from player's location
            syringes[i].row = player.row + player.height/2 - syringes[i].height/2;
            syringes[i].col = player.col + player.width;
            //leave for-loop
            break;
        }
    }
}