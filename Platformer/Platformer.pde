Player player;
ArrayList<Enemy> enemies;
ArrayList<Platform> platforms;
ArrayList<Particle> particles;
EnemyHandler enemyHandler;
PlatformHandler platformHandler;
LifeManager lifeManager;
GameStateManager gameStateManager;
int gameState = 0;

void setup() {
  size(1280, 720);
  background = loadImage("Background.png");
  gameStateManager = new GameStateManager();
  enemyHandler = new EnemyHandler();
  enemyHandler.setupEnemies();
  platformHandler = new PlatformHandler();
  platformHandler.setupPlatforms();
  player = new Player(new PVector(width/2, height/2), 10, 1, 100);
  //ps1 er til player 
  ps1 = new ParticleSystem(new PVector(player.position.x,player.position.y));
  //ps2 er til enemy
  ps2 = new ParticleSystem(new PVector(player.position.x,player.position.y));
  textSize(50);
  lifeManager = new LifeManager();
  gameStateManager.setManagerUp();
}

void keyPressed() {
  player.keyPress();
  enemyHandler.addEnemy();
}

void keyReleased() {
  player.keyRelease();
}

void mousePressed() {
  player.mousePress();
}

void mouseReleased() {
  player.mouseRelease();
}

void draw() {
  gameStateManager.manage();
  }
