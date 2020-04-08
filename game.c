#include "myLib.h"
#include "game.h"
#include "spritesheet.h"

//prototypes
OBJ_ATTR shadowOAM[128]; //shadowOAM to DMA into realOAM
PLAYER player; //OAM[0] 0-15
ENEMY enemies[MAXENEMIES]; //OAM[1] - OAM[8] 16-31
QUARANTINE quarantines[MAXQUARANTINES]; // OAM[9] - OAM[13]
SYRINGE syringes[MAXSYRINGES];// OAM[14] - OAM[23]

void initGame() {
    //load sprite palette
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    //load sprite tiles
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    //hide sprites
    hideSprites();

    initPlayer();
    initEnemies();
    initQuarantines();
    initSyringes();

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
        enemies[i].active = 0;
    }
    //activate one
    enemies[0].active = 1;
    //shadowOAM that enemy
    shadowOAM[1].attr0 = enemies[0].row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[1].attr1 = enemies[0].col | ATTR1_MEDIUM;
    shadowOAM[1].attr2 = ATTR2_TILEID(0, 1 * 4);
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
void updateGame() {
    updatePlayer();
    updateSyringes();

    //copy to real OAM
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void updatePlayer() {
    //player movement logic
    if (BUTTON_PRESSED(BUTTON_UP) && player.row > 4) {
        player.row -= player.rdel;
    }
    if (BUTTON_PRESSED(BUTTON_DOWN) && player.row < 124) {
        player.row += player.rdel;
    }
    if (BUTTON_PRESSED(BUTTON_LEFT) && player.col > 4) {
        player.col -= player.cdel;
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT) && player.col < 84) {
        player.col += player.cdel;
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        fireSyringe();
    }

    //shadowOAM player
    shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = player.col | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0);
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
                    }
                }
            }
            if (syringes[i].erased) { //if syringe erased
                shadowOAM[i + 14].attr0 = ATTR0_HIDE;
            } else { //if not erased, add to shadowOAM
                //shadowOAM
                shadowOAM[i + 14].attr0 = syringes[i].row | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[i + 14].attr1 = syringes[i].col | ATTR1_TINY;
                shadowOAM[i + 14].attr2 = ATTR2_TILEID(0, 3 * 4);
            }
        }
    }
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