Player player;
ArrayList<Enemy> enemies;
EnemyHandler enemyHandler;

void setup() {
  size(1280, 720);
  player = new Player(new PVector(width/2, height/2), 10, 1, 1);
  enemyHandler = new EnemyHandler();
  enemyHandler.setupEnemies();
    //ps1 er til player 
    ps1 = new ParticleSystem(new PVector(player.position.x,player.position.y));
    //ps2 er til enemy
    ps2 = new ParticleSystem(new PVector(player.position.x,player.position.y));
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
  background(255);
  player.run();
  enemyHandler.update();
}
