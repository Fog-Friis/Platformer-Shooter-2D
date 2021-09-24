import processing.sound.*;
SoundFile death1,death2,death3,death4,death5,HipHopSound;

Player player;
ArrayList<Enemy> enemies;
ArrayList<ShooterEnemy> shooterEnemies;
ArrayList<Platform> platforms;
ArrayList<Particle> particles;
ArrayList<Blood> blood;
EnemyHandler enemyHandler;
PlatformHandler platformHandler;
LifeManager lifeManager;
GameStateManager gameStateManager;
int gameState = 0;
CheckPoint checkPoint;
HeartContainer heartContainer;
//BackgroundManager backgroundManager;


void setup() {
  size(1280, 720);
  background = loadImage("Background-OG2.png");
  backgroundControl = loadImage("BackgroundControl.png");
  gameStateManager = new GameStateManager();
  enemyHandler = new EnemyHandler();
  enemyHandler.setupEnemies();
  platformHandler = new PlatformHandler();
  platformHandler.setupPlatforms();
  player = new Player(new PVector(width/2, height/2), 10, 1, 100);
  //ps1 er til player 
  ps1 = new ParticleSystem(new PVector(player.position.x, player.position.y));
  //ps2 er til enemy
  ps2 = new ParticleSystem(new PVector(player.position.x, player.position.y));
  textSize(50);
  lifeManager = new LifeManager();
  gameStateManager.setManagerUp();
  death1 = new SoundFile(this, "Anakin.wav");// Virker ikke med længre lyd filer
  death2 = new SoundFile(this, "ImperialGuard.wav");
  death3 = new SoundFile(this, "Lando.wav");
  death4 = new SoundFile(this, "WilhelmScream.wav");
  death5 = new SoundFile(this, "YoungAnakin.wav");
  HipHopSound = new SoundFile(this, "Stud.wav");
  //heartContainer.setContainerUp();
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
 if (gameState == 0) { //Hvis knappen ikke kan ses eksistere den ikke
  But1.mainMenuB();
  }
  
  if (gameState == 1) {
  But4.gameOverB();
  }
  
  if (gameState == 2){
  But1.controlScreenB();
  }
 
} 
void mouseReleased() {
  player.mouseRelease();
}

void draw() {
  gameStateManager.manage();
  //println(heartContainer.show);
}
