#define PLAYERROWS 4
#define PLAYERCOLS 3
#define PLAYERSPRITESCALE 4
#define MAXENEMIES 8
#define MAXQUARANTINES 5
#define MAXBULLETS 10

void initGame();
void initPlayer();
void initEnemies();
void initQuarantines();
void initBullets();
void updateGame();
void updatePlayer();
void updateBullets();
void fireBullet();

typedef struct {
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
} PLAYER;

typedef struct {
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
    int active;
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
} BULLET;