import processing.sound.*;
SoundFile death1,death2,death3,death4,death5;

Player player;
ArrayList<Enemy> enemies;
ArrayList<ShooterEnemy> shooterEnemies;
ArrayList<Platform> platforms;
ArrayList<Particle> particles;
EnemyHandler enemyHandler;
PlatformHandler platformHandler;
LifeManager lifeManager;
GameStateManager gameStateManager;
int gameState = 0;
CheckPoint checkPoint;
//BackgroundManager backgroundManager;

void setup() {
  size(1280, 720);
  background = loadImage("Background-OG2.png");
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
  if (B1.visible) { //Hvis knappen ikke kan ses eksistere den ikke
    if  (mouseX>width/1.88-sizebutton/1.4 && mouseX<width/1.88+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.5-sizebutton/7 && mouseY<(height/1.5+sizebutton/3)-sizebutton/7) {   //Ændre hvad height er divideret for fremtide knapper
      link("https://github.com/Fog-Friis/Platformer-Shooter-2D/wiki/Lore"); //Funktion
    }
    if  (mouseX>width/1.88-sizebutton/1.4 && mouseX<width/1.88+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.25-sizebutton/7 && mouseY<(height/1.25+sizebutton/3)-sizebutton/7) {   
      link("https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley"); //Funktion
    }
  }
}

void mouseReleased() {
  player.mouseRelease();
}

void draw() {
  gameStateManager.manage();
}
