# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"





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
# 7 "main.c" 2
# 1 "startscreen.h" 1
# 22 "startscreen.h"
extern const unsigned short startscreenTiles[1744];


extern const unsigned short startscreenMap[1024];


extern const unsigned short startscreenPal[256];
# 8 "main.c" 2
# 1 "mainscreen.h" 1
# 22 "mainscreen.h"
extern const unsigned short mainscreenTiles[3728];


extern const unsigned short mainscreenMap[1024];


extern const unsigned short mainscreenPal[256];
# 9 "main.c" 2
# 1 "losescreen.h" 1
# 22 "losescreen.h"
extern const unsigned short losescreenTiles[640];


extern const unsigned short losescreenMap[1024];


extern const unsigned short losescreenPal[256];
# 10 "main.c" 2
# 1 "winscreen.h" 1
# 22 "winscreen.h"
extern const unsigned short winscreenTiles[528];


extern const unsigned short winscreenMap[1024];


extern const unsigned short winscreenPal[256];
# 11 "main.c" 2
# 1 "instructionsscreen.h" 1
# 22 "instructionsscreen.h"
extern const unsigned short instructionsscreenTiles[4352];


extern const unsigned short instructionsscreenMap[1024];


extern const unsigned short instructionsscreenPal[256];
# 12 "main.c" 2
# 1 "pausescreen.h" 1
# 22 "pausescreen.h"
extern const unsigned short pausescreenTiles[864];


extern const unsigned short pausescreenMap[1024];


extern const unsigned short pausescreenPal[256];
# 13 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 14 "main.c" 2
# 1 "retrobackground.h" 1
# 22 "retrobackground.h"
extern const unsigned short retrobackgroundTiles[8128];


extern const unsigned short retrobackgroundMap[1024];


extern const unsigned short retrobackgroundPal[256];
# 15 "main.c" 2
# 1 "sound.h" 1
SOUND soundA;
SOUND soundB;



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 16 "main.c" 2
# 1 "backgroundmusic.h" 1




extern const signed char backgroundmusic[1772064];
# 17 "main.c" 2
# 1 "winsound.h" 1




extern const signed char winsound[23020];
# 18 "main.c" 2
# 1 "losesound.h" 1




extern const signed char losesound[34927];
# 19 "main.c" 2
# 1 "pingsound.h" 1




extern const signed char pingsound[2931];
# 20 "main.c" 2




void initialize();
void game();
void srand();
void initGame();
void updateGame();
void drawHearts();

void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void goToInstructions();
void instructions();


enum {START, INSTRUCTION, GAME, PAUSE, WIN, LOSE};
int state;
int startScreenIndex;
int cursorRow;
int cursorCol;


unsigned short buttons;
unsigned short oldButtons;


int hOff;
int vOff;
unsigned short hOffCounter;
unsigned short vOffCounter;

int seed;

SOUND soundA;
SOUND soundB;

int main() {
    initialize();
    while(1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        switch(state) {
            case START:
                start();
                break;
            case INSTRUCTION:
                instructions();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
 }
}

void initialize() {

    (*(unsigned short *)0x4000000) = 0;
    (*(volatile unsigned short*)0x4000008) = 0;
    (*(volatile unsigned short*)0x400000A) = 0;

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((16)<<8) | (0<<14) | (0<<7);

    setupSounds();
    setupInterrupts();

    buttons = (*(volatile unsigned short *)0x04000130);
    goToStart();
}

void goToStart() {

    hOff = 0;
    vOff = 0;
    waitForVBlank();
    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000014) = hOff;

    cursorRow = 102;
    cursorCol = 8;


    playSoundA(backgroundmusic, 1772064, 1);


    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512/2);

    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);

    hideSprites();

    startScreenIndex = 0;
    seed = 0;
    waitForVBlank();
    state = START;

    DMANow(3, startscreenPal, ((unsigned short *)0x5000000), 256);

    DMANow(3, startscreenTiles, &((charblock *)0x6000000)[0], 3488/2);

    DMANow(3, startscreenMap, &((screenblock *)0x6000000)[16], 2048/2);
}
void start() {

    shadowOAM[127].attr0 = cursorRow | (0<<13) | (0<<14);
    shadowOAM[127].attr1 = cursorCol | (0<<14);
    shadowOAM[127].attr2 = ((3 * 4)*32+(0));

    seed++;
    if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7)))) && startScreenIndex == 0) {
        playSoundB(pingsound, 2931, 0);
        startScreenIndex++;
        cursorRow += 20;
    }
    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && startScreenIndex == 1) {
        playSoundB(pingsound, 2931, 0);
        startScreenIndex--;
        cursorRow -= 20;
    }

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

        shadowOAM[127].attr0 = (2<<8);
        switch(startScreenIndex) {
            case 0:
                initGame();
                goToGame();
                break;
            case 1:
                goToInstructions();
                break;
        }
    }
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}

void goToInstructions() {
    state = INSTRUCTION;

    DMANow(3, instructionsscreenPal, ((unsigned short *)0x5000000), 256);

    DMANow(3, instructionsscreenTiles, &((charblock *)0x6000000)[0], 8704/2);

    DMANow(3, instructionsscreenMap, &((screenblock *)0x6000000)[16], 2048/2);
}
void instructions() {
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initialize();
        cursorRow += 20;
        startScreenIndex = 1;
    }
}

void goToGame() {
    srand(seed);
    state = GAME;
    waitForVBlank();

    DMANow(3, mainscreenPal, ((unsigned short *)0x5000000), 256);

    DMANow(3, mainscreenTiles, &((charblock *)0x6000000)[0], 7456/2);

    DMANow(3, mainscreenMap, &((screenblock *)0x6000000)[16], 2048/2);
}
void game() {
    updateGame();
    waitForVBlank();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToPause();
}

void goToPause() {
    pauseSound();
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    state = PAUSE;

    DMANow(3, pausescreenPal, ((unsigned short *)0x5000000), 256);

    DMANow(3, pausescreenTiles, &((charblock *)0x6000000)[0], 1728/2);

    DMANow(3, pausescreenMap, &((screenblock *)0x6000000)[16], 2048/2);
}
void pause() {
    waitForVBlank();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
        unpauseSound();
        drawHearts();
    }
    else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToStart();
        unpauseSound();
    }
}

void goToWin() {
    playSoundB(winsound, 23020, 0);
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    state = WIN;

    DMANow(3, winscreenPal, ((unsigned short *)0x5000000), 256);

    DMANow(3, winscreenTiles, &((charblock *)0x6000000)[0], 1056/2);

    DMANow(3, winscreenMap, &((screenblock *)0x6000000)[16], 2048/2);

    (*(unsigned short *)0x4000000) = (*(unsigned short *)0x4000000) | (1<<9);
    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((17)<<8) | (0<<14) | (0<<7);

    DMANow(3, retrobackgroundTiles, &((charblock *)0x6000000)[1], 16256/2);
    DMANow(3, retrobackgroundMap, &((screenblock *)0x6000000)[17], 2048/2);
    hOff = 0;
    vOff = 0;
    vOffCounter = 0;
    hOffCounter = 0;
}
void win() {
    vOffCounter++;
    hOffCounter++;
    if (vOffCounter % 10 == 0) {
        vOff--;
    }
    if (hOffCounter % 5 == 0) {
        hOff++;
    }
    waitForVBlank();
    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000014) = hOff;

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initialize();
    }
}

void goToLose() {
    playSoundB(losesound, 34927, 0);
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    state = LOSE;

    DMANow(3, losescreenPal, ((unsigned short *)0x5000000), 256);

    DMANow(3, losescreenTiles, &((charblock *)0x6000000)[0], 1280/2);

    DMANow(3, losescreenMap, &((screenblock *)0x6000000)[16], 2048/2);


    (*(unsigned short *)0x4000000) = (*(unsigned short *)0x4000000) | (1<<9);
    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((17)<<8) | (0<<14) | (0<<7);

    DMANow(3, retrobackgroundTiles, &((charblock *)0x6000000)[1], 16256/2);
    DMANow(3, retrobackgroundMap, &((screenblock *)0x6000000)[17], 2048/2);

    hOff = 0;
    vOff = 0;
    vOffCounter = 0;
    hOffCounter = 0;
}
void lose() {
    vOffCounter++;
    hOffCounter++;
    if (vOffCounter % 10 == 0) {
        vOff--;
    }
    if (hOffCounter % 5 == 0) {
        hOff++;
    }
    waitForVBlank();
    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000014) = hOff;

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initialize();
    }
}
