int lastLevel;
int coinloss = 20;

class GameStateManager {

  int spawnRate = 300;
  int nextSpawnTime = spawnRate;

  void setManagerUp() {

    gameStateManager.setupLevel1();
    gameStateManager.setupLevel2();
    gameStateManager.setupLevel3();
  }

  void manage() {

    println(shooterEnemies.size());

    checkPlayerDeath();

    switch(gameState) {
    case 0:
      menuScreen();
      break;

    case 1:
      gameOverScreen();
      break;

    case 2:
      runLevel1();
      break;

    case 3:
      runLevel2();
      break;

    case 4:
      runLevel3();
      break;

    default:
      menuScreen();
      break;
    }
  }

  void levelPrefab() {
    background(background);
    lifeManager.run();
    player.run();
    platformHandler.update();
    enemyHandler.update();
    ps1.run();
    ps2.run();
    checkPoint.run();

    fill(255, 215, 0);
    text(totalcoins+" $", width-300, 50);
  }

  void clearScreen() {
    enemies.clear();
    player.bullets.clear();
    for (ShooterEnemy s : shooterEnemies) {
      s.bullets.clear();
    }
    shooterEnemies.clear();
    particles.clear();
    player.health = 100 - damageTaken;
    player.position = new PVector(width / 10, height - 60);
  }

  void menuScreen() {

    clearScreen();
    background(background);
    fill(0, 0, 0);
    textSize(50);
    textAlign(CENTER);
    text("PLATFORM SHOOTER 2D", width / 2, height / 4);
    //textSize(40);
    //text("Main menu", width / 2, height / 2 - 50);
    fill(255, 255, 0);
    textSize(30);
    text(totalcoins + "$", width/1.1, height / 1.1);
    damageTaken = 0;
    But1 = new Button(width/1.88, height/1.5, 100, "Lore", color(100, 100, 100));
    if (But1.visible) But1.show();

    But2 = new Button(width/1.88, height/1.25, 100, "Controls", color(100, 100, 100));
    if (But1.visible) But2.show();

    But3 = new Button(width/1.88, height/1.9, 100, "Play", color(100, 100, 100));
    if (But1.visible) But3.show();

    But6 = new Button(width/1.05, height/1.05, 100, "Cheese", color(255, 255, 0));
    if (But1.visible) But6.show();


    /*  if (keyPressed && key == ' ') {//Bruger ikke længere
     gameState = 1; */
  }

  void gameOverScreen() {
    clearScreen();
    background(255);
    fill(0, 0, 0);
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER", width / 2, height / 2.5);
    //textSize(40);
    //text("", width / 2, height / 2 - 50);
    damageTaken = 0;
    But4= new Button(width/1.88, height/1.9, 100, "Continue", color(100, 100, 100));
    if (gameState == 1) But4.show();

    But5= new Button(width/1.88, height/1.5, 100, "Menu", color(100, 100, 100));
    if (But4.visible) But5.show();
    /*
    text("press Space to play again", width/2, height / 2 );
     
     if (keyPressed && key == ' ') {
     gameState -= 1;
     }*/    //No longer in use
    delay(1000);
  }

  void checkPlayerDeath() {
    if (player.health <= 0) {
      player.health = 100;
      gameState = 1;
      if (totalcoins > coinloss) {
        totalcoins -= coinloss;
      } else {
        totalcoins = 0;
      }
    }
  }


  void setupLevel1() {
    player = new Player(new PVector(width / 10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
  }

  void runLevel1() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width*3/8, 3*height/4), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*5/8, height / 2), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*3/8, height/4), width*3/4, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    levelPrefab();
    lastLevel = 1;

    /*if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 1 && frameCount%200==0) {
      for (ShooterEnemy s : shooterEnemies) {
        s.health = 30;
      }
      shooterEnemies.clear();
      shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*1/8), 70, 30, 300, 300));
    }*/

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*1/8), 70, 30, 300, 300));
        shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*3/8), 70, 30, 300, 300));
        nextSpawnTime = frameCount + spawnRate;
      }
    }
    println(nextSpawnTime);
  }


  void setupLevel2() {
    player = new Player(new PVector(width / 10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
  }

  void runLevel2() {

    platforms.clear();
    platforms.add(new Platform(new PVector(width*5/8, 3*height/4), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*5/8, height / 2), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*3/8, height/4), width*3/4, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    levelPrefab();
    lastLevel = 2;

    if (enemies.size()>=0 && enemies.size() <=1 && frameCount%1000==0) {
      for (Enemy e : enemies) {
        e.health = 50;
      }
      enemies.clear();
      enemies.add(new Enemy(new PVector(width*7/8, height*5/8), 100, 7, 50));
    }

    if (shooterEnemies.size() >= 0 && shooterEnemies.size() <=1 && frameCount%100==0) {
      for (ShooterEnemy s : shooterEnemies) {
        s.health = 30;
      }
      shooterEnemies.clear();
      shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*1/8), 70, 30, 300, 300));
    }
  }

  void setupLevel3() {
    player = new Player(new PVector(width / 10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
  }

  void runLevel3() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width*5/8, 3*height/4), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*5/8, height / 2), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*3/8, height/4), width*3/4, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    levelPrefab();
    lastLevel = 3;

    if (enemies.size()>=0 && enemies.size() <=1 && frameCount%1000==0) {
      enemies.clear();
      enemies.add(new Enemy(new PVector(width*7/8, height*1/8), 100, 7, 50));
    }

    if (shooterEnemies.size() >= 0 && shooterEnemies.size() <=1 && frameCount%200==0) {
      shooterEnemies.clear();
      shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*1/8), 70, 30, 300, 300));
    }
  }
}
