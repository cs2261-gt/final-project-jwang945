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
# 14 "game.h"
int rand();
void initGame();
void initPlayer();
void initEnemies();
void initQuarantines();
void initSyringes();
void updateGame();
void updatePlayer();
void updateEnemies();
void updateSyringes();
void findSafeRowAndColForEnemy();
void fireSyringe();

typedef struct {
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
    int damage;
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
    int movementTimer;
    int spawnTimer;
} ENEMY;

typedef struct {
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
    int active;
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
# 3 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 4 "game.c" 2


OBJ_ATTR shadowOAM[128];
PLAYER player;
ENEMY enemies[8];
QUARANTINE quarantines[5];
SYRINGE syringes[10];
int enemiesOnScreen;
int enemySpawnRate;

void initGame() {

    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512/2);

    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);

    hideSprites();

    initPlayer();
    initEnemies();
    enemiesOnScreen = 0;
    enemySpawnRate = 100 + (rand()%50);
    initQuarantines();
    initSyringes();


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
        enemies[i].movementTimer = 0;
        enemies[i].spawnTimer = 0;
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

void updateGame() {
    updatePlayer();
    updateEnemies();
    updateSyringes();


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


    shadowOAM[0].attr0 = player.row | (0<<13) | (0<<14);
    shadowOAM[0].attr1 = player.col | (2<<14);
    shadowOAM[0].attr2 = ((0)*32+(0));
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

            if (enemies[i].health <= 0) {
                enemies[i].active = 0;
                enemies[i].erased = 1;
                enemiesOnScreen--;
            }
            if (enemies[i].erased) {
                shadowOAM[i + 1].attr0 = (2<<8);
            } else {

                shadowOAM[i + 1].attr0 = enemies[i].row | (0<<13) | (0<<14);
                shadowOAM[i + 1].attr1 = enemies[i].col | (2<<14);
                shadowOAM[i + 1].attr2 = ((1 * 4)*32+(0));
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

                shadowOAM[i + 14].attr0 = syringes[i].row | (0<<13) | (0<<14);
                shadowOAM[i + 14].attr1 = syringes[i].col | (0<<14);
                shadowOAM[i + 14].attr2 = ((3 * 4)*32+(0));
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
