/*
CORONA KING
Control the player on the left side of the grid and press A to shoot. Kill 10 enemies to win!
*/
#include "myLib.h"
#include "startscreen.h"
#include "mainscreen.h"
#include "losescreen.h"
#include "winscreen.h"
#include "instructionsscreen.h"
#include "spritesheet.h"
#include "retrobackground.h"

#define CURSORROWSPACE 20

//prototypes
void initialize();
void game();
void srand();
void initGame();
void updateGame();

// State Prototypes
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

// States for state machine
enum {START, INSTRUCTION, GAME, PAUSE, WIN, LOSE};
int state;
int startScreenIndex;
int cursorRow;
int cursorCol;

// button Variables
unsigned short buttons;
unsigned short oldButtons;

//variables for background
unsigned short hOff;
unsigned short vOff;
unsigned short hOffCounter;
unsigned short vOffCounter;

int seed; //random seed

int main() {
    initialize();
    while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;
        // State Machine
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
    //set up display register
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    //set up bg register
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_SIZE_SMALL | BG_4BPP;
    buttons = BUTTONS;
    goToStart();
}

void goToStart() {
    cursorRow = 102;
    cursorCol = 8;

    //load sprite palette
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    //load sprite tiles
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    //hide sprites
    hideSprites();

    startScreenIndex = 0;
    seed = 0; //init seed
    waitForVBlank();
    state = START;
    //DMA palette
    DMANow(3, startscreenPal, PALETTE, 256);
    //load tiles
    DMANow(3, startscreenTiles, &CHARBLOCK[0], startscreenTilesLen/2);
    //load map
    DMANow(3, startscreenMap, &SCREENBLOCK[16], startscreenMapLen/2);
}
void start() {

    shadowOAM[127].attr0 = cursorRow | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[127].attr1 = cursorCol | ATTR1_TINY;
    shadowOAM[127].attr2 = ATTR2_TILEID(0, 3 * 4);

    seed++; //increment seed depending on how long user stays on start screen
    if (BUTTON_PRESSED(BUTTON_DOWN) && startScreenIndex == 0) {
        startScreenIndex++;
        cursorRow += CURSORROWSPACE;
    }
    if (BUTTON_PRESSED(BUTTON_UP) && startScreenIndex == 1) {
        startScreenIndex--;
        cursorRow -= CURSORROWSPACE;
    }
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        shadowOAM[127].attr0 = ATTR0_HIDE; //hide the cursor
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
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void goToInstructions() {
    state = INSTRUCTION;
    //DMA palette
    DMANow(3, instructionsscreenPal, PALETTE, 256);
    //load tiles
    DMANow(3, instructionsscreenTiles, &CHARBLOCK[0], instructionsscreenTilesLen/2);
    //load map
    DMANow(3, instructionsscreenMap, &SCREENBLOCK[16], instructionsscreenMapLen/2);
}
void instructions() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToGame() {
    srand(seed); //seed rand() once player hits start
    state = GAME;
    waitForVBlank();
    //DMA palette
    DMANow(3, mainscreenPal, PALETTE, 256);
    //load tiles
    DMANow(3, mainscreenTiles, &CHARBLOCK[0], mainscreenTilesLen/2);
    //load map
    DMANow(3, mainscreenMap, &SCREENBLOCK[16], mainscreenMapLen/2);
}
void game() {
    updateGame(); //go to game logic
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();
    //else if (BUTTON_PRESSED(BUTTON_A))
        //goToWin();
    else if (BUTTON_PRESSED(BUTTON_B))
        goToLose();
}

void goToPause() {

    waitForVBlank();
    state = PAUSE;
}
void pause() {
    waitForVBlank();
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

void goToWin() {
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = WIN;
    //DMA palette
    DMANow(3, winscreenPal, PALETTE, 256);
    //load tiles
    DMANow(3, winscreenTiles, &CHARBLOCK[0], winscreenTilesLen/2);
    //load map
    DMANow(3, winscreenMap, &SCREENBLOCK[16], winscreenMapLen/2);
}
void win() {
    waitForVBlank();
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

void goToLose() {
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = LOSE;
    //DMA palette
    DMANow(3, losescreenPal, PALETTE, 256);
    //load tiles
    DMANow(3, losescreenTiles, &CHARBLOCK[0], losescreenTilesLen/2);
    //load map
    DMANow(3, losescreenMap, &SCREENBLOCK[16], losescreenMapLen/2);

    //enable second background
    REG_DISPCTL = REG_DISPCTL | BG1_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(17) | BG_SIZE_SMALL | BG_4BPP;
    //DMANow(3, retrobackgroundPal, PALETTE, 256);
    DMANow(3, retrobackgroundTiles, &CHARBLOCK[1], retrobackgroundTilesLen/2);
    DMANow(3, retrobackgroundMap, &SCREENBLOCK[17], retrobackgroundMapLen/2);

    hOff = 0;
    vOff = 0;
    vOffCounter = 0;
    hOffCounter = 0;
}
void lose() {
    vOffCounter++;
    hOffCounter++;
    if (vOffCounter % 10 == 0) {
        vOff--; //this is to slow down vOff change
    }
    if (hOffCounter % 5 == 0) {
        hOff++;
    }
    waitForVBlank();
    REG_BG0VOFF = vOff;
    REG_BG1HOFF = hOff;
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}