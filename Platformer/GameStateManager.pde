class GameStateManager {

  void setManagerUp() {

    gameStateManager.setupLevel1();
    gameStateManager.setupLevel2();
    gameStateManager.setupLevel3();
  }

  void manage() {

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

    default:
      menuScreen();
      break;
    }
  }

  void menuScreen() {
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

    for (Enemy e : enemies) {
      e.health = 0;
    }
    for (Particle p : particles) {
      p.lifespan = -1;
    }

    for (Bullet b : player.bullets) {
      b.position.x = -100;
    }

    if (keyPressed && key == ' ') {
      gameState = 1;
    }

    player.health = 100;
  }

  void gameOverScreen() {

    background(255);
    fill(0, 0, 0);
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER", width / 2, height / 4);
    //textSize(40);
    //text("", width / 2, height / 2 - 50);
    textSize(30);
    text("press Space to play again", width/2, height / 2 );


    for (Enemy e : enemies) {
      e.health = 0;
    }
    for (Particle p : particles) {
      p.lifespan = -1;
    }

    if (keyPressed && key == ' ') {
      totalcoins = 0;
      gameState -= 1;
    }

    for (Bullet b : player.bullets) {
      b.position.x = -100;
    }

    for (ShooterEnemy e : shooterEnemies) {

      e.health = 0;

      for (Bullet b : e.bullets) {
        b.position.x = -100;
      }
    }
  }

  void checkPlayerDeath() {
    if (player.health <= 0) {
      player.health = 100;
      gameState -= 1;
    }
  }


  void setupLevel1() {
    player = new Player(new PVector(width / 10, height - 60), 10, 1, 100);
    //platforms.add(new Platform(new PVector(width/4, 3*height/4), width, 30));
    //platforms.add(new Platform(new PVector(width*3/8, 3*height/4), width*3/4, 30));
    //platforms.add(new Platform(new PVector(3*width/4, height / 2), width, 30));
    //platforms.add(new Platform(new PVector(width/4, height/4), width, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
  }

  void runLevel1() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width*3/8, 3*height/4), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*5/8, height / 2), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*3/8, height/4), width*3/4, 30));
    //println(platforms.size());
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    //setupLevel1();
    background(background);
    lifeManager.run();
    player.run();
    platformHandler.update();
    enemyHandler.update();
    ps1.run();
    ps2.run();
    checkPoint.run();
    
    if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 1 && frameCount%100==0) {
      shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8,height*1/8), 70, 30, 300, 300));
    }

    fill(255, 215, 0);
    text(totalcoins+" coins", width-300, 50);
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
    background(background);
    lifeManager.run();
    player.run();
    platformHandler.update();
    enemyHandler.update();
    ps1.run();
    ps2.run();
    checkPoint.run();

    if (enemies.size()>=0 && enemies.size() <=1 && frameCount%1000==0) {
      enemies.clear();
      enemies.add(new Enemy(new PVector(width*7/8,height*1/8), 100, 7, 50));
    }
    
    if(shooterEnemies.size() >= 0 && shooterEnemies.size() <=1 && frameCount%100==0){
      shooterEnemies.clear();
      shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8,height*1/8), 70, 30, 300, 300));
    }

    fill(255, 215, 0);
    text(totalcoins+" coins", width-300, 50);
  }

  void setupLevel3() {
    player = new Player(new PVector(width / 10, height - 60), 10, 1, 100);
    platforms.add(new Platform(new PVector(width/4, 3*height/4), width*3/4, 30));
    platforms.add(new Platform(new PVector(3*width/4, height / 2), width*3/4, 30));
    platforms.add(new Platform(new PVector(width/4, height/4), width*3/4, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
  }
}
