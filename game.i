# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 342 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "game.c" 2
# 1 "game.h" 1
# 20 "game.h"
int rand();
void goToLose();
void goToWin();
void initGame();
void initPlayer();
void initEnemies();
void initQuarantines();
void initSyringes();
void initRNAs();
void initHearts();
void updateGame();
void updatePlayer();
void updateEnemies();
void updateQuarantines();
void updateSyringes();
void updateRNAs();
void updateHearts();
void findSafeRowAndColForEnemy();
void findRowAndColForQuarantine();
void fireSyringe();

typedef struct {
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
    int damage;
    int health;
    int tookDamageFlag;
} PLAYER;

typedef struct {
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
    int health;
    int active;
    int erased;
    int spawnTimer;
    int RNATimer;
    int curFrame;
    int numFrames;
    int aniCounter;
} ENEMY;

typedef struct {
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
    int active;
    int erased;
    int spawnTimer;
    int curFrame;
    int numFrames;
    int aniCounter;
    int hitPlayer;
} QUARANTINE;

typedef struct {
    int row;
    int col;
    int cdel;
    int width;
    int height;
    int active;
    int erased;
} SYRINGE;

typedef struct {
    int row;
    int col;
    int cdel;
    int width;
    int height;
    int active;
    int erased;
} RNA;

typedef struct {
    int row;
    int col;
    int active;
    int erased;
} HEART;
# 3 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 4 "game.c" 2
# 1 "quarantinesound.h" 1




extern const signed char quarantinesound[26725];
# 5 "game.c" 2


OBJ_ATTR shadowOAM[128];
PLAYER player;
ENEMY enemies[8];
QUARANTINE quarantines[5];
SYRINGE syringes[10];
RNA rnas[16];
HEART hearts[5];
int enemiesOnScreen;
int enemySpawnRate;
int enemiesKilled;
int quarantinesOnScreen;
int quarantineSpawnRate;

void initGame() {

    initPlayer();
    initEnemies();
    enemiesOnScreen = 0;
    enemySpawnRate = 200 + (rand()%50);
    enemiesKilled = 0;
    initQuarantines();
    quarantinesOnScreen = 0;
    quarantineSpawnRate = 100 + (rand()%100);
    initSyringes();
    initRNAs();
    initHearts();


    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}

void initPlayer() {

    player.row = 4;
    player.col = 4;
    player.cdel = 40;
    player.rdel = 40;
    player.width = 32;
    player.height = 32;
    player.damage = 1;
    player.health = 5;
    player.tookDamageFlag = 0;

    shadowOAM[0].attr0 = player.row | (0<<13) | (0<<14);
    shadowOAM[0].attr1 = player.col | (2<<14);
    shadowOAM[0].attr2 = ((0)*32+(0));
}

void initEnemies() {

    for (int i = 0; i < 8; i++) {
        enemies[i].row = 2 * 40 + 4;
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
        enemies[i].curFrame = 1;
        enemies[i].numFrames = 4;
        enemies[i].aniCounter = 0;
    }
}

void initQuarantines() {
    for (int i = 0; i < 5; i++) {
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
        quarantines[i].numFrames = 4;
        quarantines[i].aniCounter = 0;
    }
}

void initSyringes() {
    for (int i = 0; i < 10; i++) {
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
    for (int i = 0; i < 16; i++) {
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
    for (int i = 0; i < 5; i++) {
        hearts[i].row = 2;
        hearts[i].col = 3 + (10 * i);
        hearts[i].active = 1;
        hearts[i].erased = 0;

        shadowOAM[i + 40].attr0 = hearts[i].row | (0<<13) | (0<<14);
        shadowOAM[i + 40].attr1 = hearts[i].col | (0<<14);
        shadowOAM[i + 40].attr2 = (((3 * 4)+2)*32+(0));
    }
}

void updateGame() {
    updatePlayer();
    updateEnemies();
    updateQuarantines();
    updateSyringes();
    updateRNAs();
    updateHearts();


    if (enemiesKilled >= 10) {
        goToWin();
    }

    if (player.health <= 0) {
        goToLose();
    }

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}

void updatePlayer() {

    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && player.row > 4) {
        player.row -= player.rdel;
    }
    if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7)))) && player.row < 124) {
        player.row += player.rdel;
    }
    if ((!(~(oldButtons)&((1<<5))) && (~buttons & ((1<<5)))) && player.col > 4) {
        player.col -= player.cdel;
    }
    if ((!(~(oldButtons)&((1<<4))) && (~buttons & ((1<<4)))) && player.col < 84) {
        player.col += player.cdel;
    }
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        fireSyringe();
    }
    if (player.health > 0) {

        shadowOAM[0].attr0 = player.row | (0<<13) | (0<<14);
        shadowOAM[0].attr1 = player.col | (2<<14);
        shadowOAM[0].attr2 = ((0)*32+(0));
    }
}

void updateEnemies() {

    if (enemiesOnScreen < 8) {
        for (int j = 0; j < 8; j++) {
            if (!enemies[j].active) {
                enemies[j].spawnTimer += 1;
                if (enemies[j].spawnTimer == enemySpawnRate) {
                    enemies[j].spawnTimer = 0;
                    enemies[j].active = 1;
                    enemies[j].erased = 0;
                    enemies[j].health = 10;
                    findSafeRowAndColForEnemy(&enemies[j]);
                    enemiesOnScreen++;
                }
                break;
            }
        }
    }
    for (int i = 0; i < 8; i++) {
        if (enemies[i].active) {


            enemies[i].RNATimer += 1;
            if (enemies[i].RNATimer == 200) {
                enemies[i].RNATimer = 0;

                for (int j = 0; j < 16; j++) {
                    if (!rnas[j].active) {
                        rnas[j].active = 1;
                        rnas[j].erased = 0;
                        rnas[j].row = enemies[i].row + enemies[i].height/2 - rnas[j].height/2;
                        rnas[j].col = enemies[i].col;
                        break;
                    }
                }
            }

            if (enemies[i].health <= 0) {
                enemies[i].active = 0;
                enemies[i].erased = 1;
                enemies[i].RNATimer = 0;
                enemiesOnScreen--;
                enemiesKilled++;
            }

            enemies[i].aniCounter++;
            if (enemies[i].aniCounter == 50) {
                enemies[i].aniCounter = 0;
                enemies[i].curFrame = enemies[i].curFrame==enemies[i].numFrames ? 1 : enemies[i].curFrame + 1;
            }
            if (enemies[i].erased) {
                shadowOAM[i + 1].attr0 = (2<<8);
            } else {

                if (player.health > 0) {
                    shadowOAM[i + 1].attr0 = enemies[i].row | (0<<13) | (0<<14);
                    shadowOAM[i + 1].attr1 = enemies[i].col | (2<<14);
                    shadowOAM[i + 1].attr2 = ((1 * 4)*32+(((enemies[i].curFrame - 1) * 4)));
                }
            }
        }
    }
}

void updateQuarantines() {

    if (quarantinesOnScreen < 5) {
        for (int i = 0; i < 5; i++) {
            if (!quarantines[i].active) {
                quarantines[i].spawnTimer++;
                if (quarantines[i].spawnTimer == quarantineSpawnRate) {
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

    for (int i = 0; i < 5; i++) {
        if (quarantines[i].active) {

            if ((quarantines[i].curFrame == quarantines[i].numFrames) && !quarantines[i].hitPlayer) {

                if (collision(player.col, player.row, player.width, player.height, quarantines[i].col, quarantines[i].row, quarantines[i].width, quarantines[i].height)) {
                    quarantines[i].hitPlayer = 1;
                    player.health--;
                    player.tookDamageFlag = 1;
                }
            }

            quarantines[i].aniCounter++;
            if (quarantines[i].aniCounter == 34 && quarantines[i].curFrame == 3) {
                playSoundB(quarantinesound, 26725, 0);
            }
            if (quarantines[i].aniCounter == 50) {
                quarantines[i].aniCounter = 0;

                quarantines[i].curFrame++;
            }

            if (quarantines[i].curFrame == 2 || quarantines[i].curFrame== 3) {
                if (quarantines[i].curFrame == 2) {
                    quarantines[i].curFrame = 3;
                } else {
                    quarantines[i].curFrame = 2;
                }
            }

            if (quarantines[i].curFrame > quarantines[i].numFrames) {

                quarantines[i].active = 0;

                shadowOAM[i + 9].attr0 = (2<<8);
                quarantinesOnScreen--;
            } else {
                shadowOAM[i + 9].attr0 = quarantines[i].row | (0<<13) | (0<<14);
                shadowOAM[i + 9].attr1 = quarantines[i].col | (2<<14);
                shadowOAM[i + 9].attr2 = ((2 * 4)*32+(((quarantines[i].curFrame - 1) * 4)));
            }
        }
    }
}

void updateSyringes() {
    for (int i = 0; i < 10; i++) {
        if (syringes[i].active) {

            syringes[i].col += syringes[i].cdel;
            if (syringes[i].col > 240) {
                syringes[i].active = 0;
            }

            for (int j = 0; j < 8; j++) {
                if (enemies[j].active) {
                    if (collision(syringes[i].col, syringes[i].row, syringes[i].width, syringes[i].height, enemies[j].col, enemies[j].row, enemies[j].width, enemies[j].height)) {


                        syringes[i].active = 0;
                        syringes[i].erased = 1;

                        enemies[j].health -= player.damage;

                    }
                }
            }
            if (syringes[i].erased) {
                shadowOAM[i + 14].attr0 = (2<<8);
            } else {

                if (player.health > 0) {
                    shadowOAM[i + 14].attr0 = syringes[i].row | (0<<13) | (0<<14);
                    shadowOAM[i + 14].attr1 = syringes[i].col | (0<<14);
                    shadowOAM[i + 14].attr2 = ((3 * 4)*32+(0));
                }
            }
        }
    }
}

void updateRNAs() {
    for (int i = 0; i < 16; i++) {
        if (rnas[i].active) {

            rnas[i].col -= rnas[i].cdel;
            if (rnas[i].col < 0) {
                rnas[i].active = 0;
                rnas[i].erased = 1;
            }

            if (collision(player.col, player.row, player.width, player.height, rnas[i].col, rnas[i].row, rnas[i].width, rnas[i].height)) {


                rnas[i].active = 0;
                rnas[i].erased = 1;

                player.health--;
                player.tookDamageFlag = 1;
            }
            if (rnas[i].erased) {
                shadowOAM[i + 24].attr0 = (2<<8);
            } else {

                if (player.health > 0) {
                    shadowOAM[i + 24].attr0 = rnas[i].row | (0<<13) | (0<<14);
                    shadowOAM[i + 24].attr1 = rnas[i].col | (0<<14);
                    shadowOAM[i + 24].attr2 = (((3 * 4)+1)*32+(0));
                }
            }
        }
    }
}

void updateHearts() {
    if (player.tookDamageFlag) {
        player.tookDamageFlag = 0;

        for (int i = 5 - 1; i >= 0; i--) {
            if (hearts[i].active) {
                hearts[i].active = 0;
                shadowOAM[i + 40].attr0 = (2<<8);
                break;
            }
        }
    }
}

void findSafeRowAndColForEnemy(ENEMY* e) {
    int found = 0;
    int col;
    int row;
    while (!found) {
        found = 1;
        col = ((rand()%2) * 40) + 164;
        row = ((rand()%5) * 40) + 4;
        for (int i = 0; i < 8; i++) {
            if (enemies[i].active) {

                if (enemies[i].col == col && enemies[i].row == row) {
                    found = 0;
                }
            }
        }
    }

    e -> row = row;
    e -> col = col;
}

void findRowAndColForQuarantine(QUARANTINE* q) {
    int spawnUnderPlayer = rand()%2;
    int col;
    int row;
    int found = 0;

    while (!found) {
        found = 1;
        col = ((rand()%3)*40) + 4;
        row = ((rand()%5)*40) + 4;
        if (spawnUnderPlayer) {
            for (int i = 0; i < 5; i++) {
                if (quarantines[i].active) {
                    if (quarantines[i].col == player.col && quarantines[i].row == player.row) {

                        found = 0;
                        spawnUnderPlayer = 0;
                    }
                }
            }
            col = player.col;
            row = player.row;
        } else {

            for (int i = 0; i < 5; i++) {
                if (quarantines[i].active) {
                    if (quarantines[i].col == col && quarantines[i].row == row) {
                        found = 0;
                    }
                }
            }
        }
    }
    q -> row = row;
    q -> col = col;
}
void fireSyringe() {
    for (int i = 0; i < 10; i++) {
        if (syringes[i].active == 0) {

            syringes[i].active = 1;
            syringes[i].erased = 0;

            syringes[i].row = player.row + player.height/2 - syringes[i].height/2;
            syringes[i].col = player.col + player.width;

            break;
        }
    }
}
