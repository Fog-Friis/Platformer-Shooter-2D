int lastLevel;
int coinloss = 20;

class GameStateManager {

  int[] spawnRate = new int[100];
  int nextSpawnTime = 0;

  void setManagerUp() {

    spawnRate[0] = 600;
    spawnRate[1] = 1600;
    spawnRate[2] = 1200;
    spawnRate[3] = 1000;
    spawnRate[4] = 300;

    gameStateManager.setupLevel1();
    gameStateManager.setupLevel2();
    gameStateManager.setupLevel3();
    gameStateManager.setupLevel4();
    gameStateManager.setupLevel5();
    gameStateManager.setupLevel6();
    gameStateManager.setupLevel7();
    gameStateManager.setupLevel8();
    gameStateManager.setupLevel9();
    gameStateManager.setupLevel10();
  }

  void manage() {

    checkPlayerDeath();

    switch(gameState) {
    case 0:
      menuScreen();
      break;

    case 1:
      gameOverScreen();
      break;

    case 2:
      controlScreen();
      break;

    case 3:
      runLevel1();
      break;

    case 4:
      runLevel2();
      break;

    case 5:
      runLevel3();
      break;

    case 6:
      runLevel4();
      break;

    case 7:
      runLevel5();
      break;

    case 8:
      runLevel6();
      break;

    case 9:
      runLevel7();
      break;

    case 10:
      runLevel8();
      break;

    case 11:
      runLevel9();
      break;

    case 12:
      runLevel10();
      break;

    default:
      gameState = 0;
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
    // HeartContainer.run();

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
  void controlScreen() {
    clearScreen();   
    background(backgroundControl);
    fill(0, 0, 0);
    textSize(50);
    textAlign(CENTER);
    //text("PLATFORM SHOOTER 2D", width / 2, height / 4);

    fill(255, 255, 0);
    textSize(40);
    text("Balance:" + totalcoins + "$", width/1.15, height / 9);

    But7 = new Button(width/1.88, height/1.10, 100, "Back", color(100, 100, 100));
    if (But1.visible) But7.show();
  }

  void menuScreen() {
    clearScreen();
    background(background);
    fill(0, 0, 0);
    textSize(50);
    textAlign(CENTER);
    text("PLATFORM SHOOTER 2D", width / 2, height / 4);
    fill(255, 255, 0);
    textSize(40);
    text("Balance:" + totalcoins + "$", width/1.15, height / 9);
    textSize(30);
    text("Cost: 69$", width/1.09, height / 1.11);
    damageTaken = 0;
    But1 = new Button(width/1.88, height/1.5, 100, "Lore", color(100, 100, 100));
    if (But1.visible) But1.show();

    But2 = new Button(width/1.88, height/1.25, 100, "Controls", color(100, 100, 100));
    if (But1.visible) But2.show();

    But3 = new Button(width/1.88, height/1.9, 100, "Play", color(100, 100, 100));
    if (But1.visible) But3.show();

    But6 = new Button(width/1.05, height/1.05, 100, "Cheese", color(255, 255, 0));
    if (But1.visible) But6.show();
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
    heartContainer = new HeartContainer(new PVector(300, 100), 60);
    enemies.clear();
    shooterEnemies.clear();
  }

  void runLevel1() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width*3/8, 3*height/4), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*5/8, height / 2), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*3/8, height/4), width*3/4, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    levelPrefab();
    heartContainer.run();
    lastLevel = 1;

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*1/8), 70, 30, 300, 300));
        shooterEnemies.add(new ShooterEnemy(new PVector(width*1/8, height/2), 70, 30, 300, 300));
        //shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*7/8), 70, 30, 300, 300));
        nextSpawnTime = frameCount + spawnRate[0];
      }
    }
  }


  void setupLevel2() {
    player = new Player(new PVector(width / 10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  void runLevel2() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width*4/8, 3*height/4), width/8, 30));
    platforms.add(new Platform(new PVector(width*6/8, height / 2), width/8, 30));
    platforms.add(new Platform(new PVector(width*3/16, height/4), width*3/8, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    lastLevel = 2;
    levelPrefab();

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*1/8), 70, 30, 300, 300));
        //shooterEnemies.add(new ShooterEnemy(new PVector(width*1/8, height*3/8), 70, 30, 300, 300));
        nextSpawnTime = frameCount + spawnRate[0];
      }
    } else if (shooterEnemies.size() > 1) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  void setupLevel3() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  void runLevel3() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width*6/8, 3*height/4), width/8, 30));
    platforms.add(new Platform(new PVector(width*4/8, height / 2), width/8, 30));
    platforms.add(new Platform(new PVector(width*1/16, height/4), width*2/8, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    levelPrefab();
    lastLevel = 3;

    if (enemies.size()==0 && frameCount%500==0) {
      enemies.clear();
      enemies.add(new Enemy(new PVector(width*1/8, height*1/8), 100, 5, 50));
      //enemies.add(new Enemy(new PVector(width*1/8, height*7/8), 100, 7, 50));
    }

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*1/8), 70, 30, 300, 300));
        shooterEnemies.add(new ShooterEnemy(new PVector(width*1/8, height*3/8), 70, 30, 300, 300));
        //shooterEnemies.add(new ShooterEnemy(new PVector(width*1/4, height*1/8), 70, 30, 300, 300));
        nextSpawnTime = frameCount + spawnRate[0];
      }
    } else if (shooterEnemies.size() < 2) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
    //println(nextSpawnTime);
  }

  void setupLevel4() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  void runLevel4() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width/3+17, height/2), width/3, 30));
    platforms.add(new Platform(new PVector(0, height*3/4), width/8, 30));
    platforms.add(new Platform(new PVector(width*3/16, height*3/4+15), 20, 30*12));
    platforms.add(new Platform(new PVector(width*3/8, height/4), width*6/8, 30));
    platforms.add(new Platform(new PVector(width*13/16, height*3/4), width/8, 30));
    platforms.add(new Platform(new PVector(width*15/16, height/2), width/8, 30));
    platforms.add(new Platform(new PVector(width*6/8-10, height/2+15), 20, 30*12));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    levelPrefab();
    lastLevel = 4;

    if (enemies.size()==0 && frameCount%600==0) {
      enemies.clear();
      enemies.add(new Enemy(new PVector(width*1/4, height*7/8), 100, 4, 50));
    }

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 3) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*1/8), 70, 30, 500, 300));
        //shooterEnemies.add(new ShooterEnemy(new PVector(width*1/4, height*5/8), 70, 30, 500, 300));
        nextSpawnTime = frameCount + spawnRate[3];
      }
    } else if (shooterEnemies.size() > 1) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  void setupLevel5() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  void runLevel5() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width* 7/8, height*2/3), width/4, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*8, height*2/3+31), 80, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*7, height*2/3+62), 80, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*6, height*2/3+93), 80, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*5, height*2/3+93+31), 80, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*4, height*2/3+93+62), 80, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*3, height*2/3+93+93), 80, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*2, height*2/3+93+93+31), 80, 30));
    platforms.add(new Platform(new PVector(width* 1/8, height*1/3), width/4, 30));
    platforms.add(new Platform(new PVector(width*25/32-80*8, height*1/3+31*1), 80, 30));
    platforms.add(new Platform(new PVector(width*25/32-80*7, height*1/3+31*2), 80, 30));
    platforms.add(new Platform(new PVector(width*25/32-80*6, height*1/3+31*3), 80, 30));
    platforms.add(new Platform(new PVector(width*25/32-80*5, height*1/3+31*4), 80, 30));
    platforms.add(new Platform(new PVector(width/4+40, height*1/3+31*5), width/2+40*2, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    lastLevel = 5;
    levelPrefab();

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*7/8), 70, 30, 200, 300));
        shooterEnemies.add(new ShooterEnemy(new PVector(width*1/8, height*7/16), 70, 30, 200, 300));
        nextSpawnTime = frameCount + spawnRate[0];
      }
    } else if (shooterEnemies.size() < 2) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  void setupLevel6() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(width-100, height-100), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  void runLevel6() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width/2, height*13/16), width/16, height*5/16));
    checkPoint = new CheckPoint(new PVector(width-100, height-100), 80, 120);
    levelPrefab();
    lastLevel = 6;

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width, 0), 70, 30, 20, 100));
        shooterEnemies.add(new ShooterEnemy(new PVector(0, 0), 70, 30, 20, 100));
        shooterEnemies.add(new ShooterEnemy(new PVector(width/2, 0), 70, 30, 20, 100));
        nextSpawnTime = frameCount + spawnRate[1];
      }
    } else if (shooterEnemies.size() < 3) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  void setupLevel7() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(width-100, height-100), 80, 120);
    heartContainer = new HeartContainer(new PVector(550, 550), 60);
    enemies.clear();
    shooterEnemies.clear();
  }

  void runLevel7() {
    platforms.clear();
    lastLevel = 7;

    platforms.add(new Platform(new PVector(0, height*3/4), width/8, 30));
    platforms.add(new Platform(new PVector(width*2/16-20, height*10/16), 30, 30));
    platforms.add(new Platform(new PVector(width*3/16+30, height*12/16+20), 30, 30));
    platforms.add(new Platform(new PVector(width*5/16-45, height*10/16-10), 95, 30));
    platforms.add(new Platform(new PVector(width*2/16+82, height*1/2+150), 30, 30*9));
    platforms.add(new Platform(new PVector(0, height*2/4-20), width/8+40, 30));
    platforms.add(new Platform(new PVector(width/2-2, height/2+210), 30, 30*3));
    platforms.add(new Platform(new PVector(width*9/16, height-60), 30, 30*5));
    platforms.add(new Platform(new PVector(width*10/16, height-130), 30, 30*4));
    platforms.add(new Platform(new PVector(width*11/16, height-60), 30, 30*5));
    platforms.add(new Platform(new PVector(width*12/16, height-130), 30, 30*4));
    platforms.add(new Platform(new PVector(width*13/16, height-60), 30, 30*5-20));
    platforms.add(new Platform(new PVector(width*14/16, height-130), 30, 30*4));
    platforms.add(new Platform(new PVector(width/2+100, height/2+110), 30, 30*3));
    platforms.add(new Platform(new PVector(width/2-50, height/2+110), 30, 30*3));
    platforms.add(new Platform(new PVector(width/2-250, height/2+110), 30, 30*3));
    platforms.add(new Platform(new PVector(width/2-150, height/2+50), 30, 30*3));
    platforms.add(new Platform(new PVector(width/2+100, height/2-45), 30, 30*3));
    platforms.add(new Platform(new PVector(width*8/16+7, height*2/3+40), width*7/16+40, 30));
    platforms.add(new Platform(new PVector(width*6/16-40, height/2), width/3, 30));
    platforms.add(new Platform(new PVector(width*6/16-40, height*14/16), width/3, 30));
    platforms.add(new Platform(new PVector(width*2/16, height*3/4+15), 30, 30*19));
    platforms.add(new Platform(new PVector(width*3/8, height/4), width*6/8, 30));
    platforms.add(new Platform(new PVector(width/2+100, height/2-45), 30, 30*3));
    platforms.add(new Platform(new PVector(width*13/16+5, height*3/4-10), width/8+20, 30));
    platforms.add(new Platform(new PVector(width*15/16, height/2), width/8, 30));
    platforms.add(new Platform(new PVector(width*6/8-10, height/2-5), 30, 30*12+20));
    platforms.add(new Platform(new PVector(width*7/16-90, height/2-100), width*2/3-20, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 119);
    levelPrefab();
    heartContainer.run();
    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        //shooterEnemies.add(new ShooterEnemy(new PVector(width, 0), 70, 30, 10, 100));
        //shooterEnemies.add(new ShooterEnemy(new PVector(0, 0), 70, 30, 10, 100));
        nextSpawnTime = frameCount + spawnRate[1];
      }
    } else if (shooterEnemies.size() > 1) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  void setupLevel8() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(width-100, height-100), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  void runLevel8() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width*5/8+40, height*2/16+15), width/4, 30));
    platforms.add(new Platform(new PVector(width*5/8+40, height*11/16+15), width/4, 30));
    platforms.add(new Platform(new PVector(width*7/8, height*7/16), width/4, 30));
    platforms.add(new Platform(new PVector(width/2, height*13/16), width/16, height*5/16+40));
    platforms.add(new Platform(new PVector(width/2+width/16, height*9/16), width/16, height*7/8));
    platforms.add(new Platform(new PVector(width/4, height*5/16), width/8, 30));
    checkPoint = new CheckPoint(new PVector(width-100, height-100), 80, 120);
    levelPrefab();
    lastLevel = 8;

    if (enemies.size()==0 && frameCount%360==0) {
      enemies.clear();
      enemies.add(new Enemy(new PVector(width*1/4, height*7/8), 100, 4, 50));
    }

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width-150, 150), 70, 30, 200, 100));
        nextSpawnTime = frameCount + spawnRate[1];
      }
    } else if (shooterEnemies.size() < 1) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  void setupLevel9() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(width/2, height/2), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  void runLevel9() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width/2, height-50), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*7/8-45, height*2/3-50), width/32, 30));
    platforms.add(new Platform(new PVector(width*7/8-15, height/2+3), 30, height*13/16));
    platforms.add(new Platform(new PVector(width*11/16+15, height/2), 30, height*7/16));
    platforms.add(new Platform(new PVector(width*3/8+70, height*2/3+26), width*9/16, 30));
    platforms.add(new Platform(new PVector(width*15/32+70, height/3-23), width*6/16, 30));
    platforms.add(new Platform(new PVector(width*1/8+15, height/2-height*3/32+3), 30, height*10/16));
    platforms.add(new Platform(new PVector(width/2, 70), width*3/4, 30));
    checkPoint = new CheckPoint(new PVector(width/2, height/2), 80, 120);
    levelPrefab();
    lastLevel = 9;

    //if (enemies.size()==0 && frameCount%360==0) {
    //  enemies.clear();
    //  enemies.add(new Enemy(new PVector(width*1/4, height*7/8), 100, 4, 50));
    //}

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width-100, 150), 70, 30, 200, 100));
        shooterEnemies.add(new ShooterEnemy(new PVector(100, 150), 70, 30, 200, 100));
        nextSpawnTime = frameCount + spawnRate[1];
      }
    } else if (shooterEnemies.size() < 1) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  void setupLevel10() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(50, 70), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  void runLevel10() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width/4+15, height*3/4), width/16, height/2));
    platforms.add(new Platform(new PVector(width/4+15, height*7/8), width/16+60, height/4));
    platforms.add(new Platform(new PVector(width*2/3+15, height*3/4), width/12-30, height/2));
    platforms.add(new Platform(new PVector(width*8/9, height*3/12), width/12+60, 30));  
    platforms.add(new Platform(new PVector(width*4/9, height*1/9), width*6/9, 30));
    platforms.add(new Platform(new PVector(width*1/9, height*1/7+3), 30, 80));
    platforms.add(new Platform(new PVector(width*1/16-1, height*1/5+16), width*1/8-4, 30));
    platforms.add(new Platform(new PVector(width*2/3+15, height*7/8), width/12+31, height/4));
    checkPoint = new CheckPoint(new PVector(50, 70), 80, 120);
    levelPrefab();
    lastLevel = 10;

    //if (enemies.size()==0 && frameCount%360==0) {
    //  enemies.clear();
    //  enemies.add(new Enemy(new PVector(width*1/4, height*7/8), 100, 4, 50));
    //}

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width-80, height-60), 70, 30, 200, 100));
        shooterEnemies.add(new ShooterEnemy(new PVector(width/6, 150), 70, 30, 200, 100));
        nextSpawnTime = frameCount + spawnRate[1];
      }
    } else if (shooterEnemies.size() < 1) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }
}
