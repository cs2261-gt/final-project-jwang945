#define PLAYERROWS 4
#define PLAYERCOLS 3
#define PLAYERSPRITESCALE 4
#define MAXENEMIES 8
#define ENEMYSPAWNRATEBASE 100
#define ENEMYMOVEMENTTIME 500
#define MAXQUARANTINES 5
#define MAXSYRINGES 10
#define MAXRNAS 16
#define GRIDTOPPIXEL 4
#define GRIDBOTTOMPIXEL 124
#define GRIDLEFTPIXEL 4
#define GRIDRIGHTPIXEL 84
#define ENEMYFIRERATE 50

int rand();
void initGame();
void initPlayer();
void initEnemies();
void initQuarantines();
void initSyringes();
void initRNAs();
void updateGame();
void updatePlayer();
void updateEnemies();
void updateSyringes();
void updateRNAs();
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
    int spawnTimer;
    int RNATimer;
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

typedef struct {
    int row;
    int col;
    int cdel;
    int width;
    int height;
    int active;
    int erased;
} RNA;