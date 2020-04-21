#define PLAYERROWS 4
#define PLAYERCOLS 3
#define PLAYERSPRITESCALE 4
#define MAXENEMIES 8
#define ENEMYSPAWNRATEBASE 200
#define ENEMYANIMATIONRATE 50
#define MAXQUARANTINES 5
#define QUARANTINESPAWNRATEBASE 100
#define QUARANTINEANIMATIONRATE 50
#define MAXSYRINGES 10
#define MAXRNAS 16
#define MAXHEARTS 5
#define GRIDTOPPIXEL 4
#define GRIDBOTTOMPIXEL 124
#define GRIDLEFTPIXEL 4
#define GRIDRIGHTPIXEL 84
#define ENEMYFIRERATE 200
#define WINCONDITION 10

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