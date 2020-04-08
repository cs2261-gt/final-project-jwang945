#define PLAYERROWS 4
#define PLAYERCOLS 3
#define PLAYERSPRITESCALE 4
#define MAXENEMIES 8
#define ENEMYSPAWNRATEBASE 100
#define ENEMYMOVEMENTTIME 500
#define MAXQUARANTINES 5
#define MAXSYRINGES 10
#define GRIDTOPPIXEL 4
#define GRIDBOTTOMPIXEL 124
#define GRIDLEFTPIXEL 4
#define GRIDRIGHTPIXEL 84

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