class GameStateManager {

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
      runLevel1();
      break;

    case 2:
      gameOverScreen();
      break;

    case 3:
      runLevel2();
      break;

    case 4:
      gameOverScreen();
      break;

    case 5:
      runLevel3();
      break;

    case 6:
      gameOverScreen();


    default:
      menuScreen();
      break;
    }
  }
  
  void levelPrefab(){
    background(background);
    lifeManager.run();
    player.run();
    platformHandler.update();
    enemyHandler.update();
    ps1.run();
    ps2.run();
    checkPoint.run();
    
    fill(255, 215, 0);
    text(totalcoins+" coins", width-300, 50);
  }

  void clearScreen() {
    enemies.clear();
    player.bullets.clear();
    for (ShooterEnemy s : shooterEnemies) {
      s.bullets.clear();
    }
    shooterEnemies.clear();
    particles.clear();
    player.health = 100;
    player.position = new PVector(width / 10, height - 60);
  }

  void menuScreen() {
    clearScreen();
    background(background);
    fill(0, 0, 0);
    textSize(50);
    textAlign(CENTER);
    text("PLATFORM SHOOTER 2D", width / 2, height / 4);
    textSize(40);
    text("Main menu", width / 2, height / 2 - 50);
    textSize(30);
    text("press Space to play", width/2, height / 2 );

    B1 = new Button(width/1.88, height/1.5, 100, "Lore", color(100, 100, 100));
    if (B1.visible) B1.show();

    B2 = new Button(width/1.88, height/1.25, 100, "Controls", color(100, 100, 100));
    if (B2.visible) B2.show();

    if (keyPressed && key == ' ') {
      gameState = 1;
    }
  }

  void gameOverScreen() {
    clearScreen();
    background(255);
    fill(0, 0, 0);
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER", width / 2, height / 4);
    //textSize(40);
    //text("", width / 2, height / 2 - 50);
    textSize(30);
    text("press Space to play again", width/2, height / 2 );

    if (keyPressed && key == ' ') {
      gameState -= 1;
    }
  }

  void checkPlayerDeath() {
    if (player.health <= 0) {
      player.health = 100;
      gameState += 1;
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

    if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 1 && frameCount%200==0) {
      for (ShooterEnemy s : shooterEnemies) {
        s.health = 30;
      }
      shooterEnemies.clear();
      shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*1/8), 70, 30, 300, 300));
    }
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
