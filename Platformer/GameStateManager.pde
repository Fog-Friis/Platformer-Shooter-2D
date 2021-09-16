class GameStateManager {

  void setManagerUp() {

    gameStateManager.setupLevel1();
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
      runLevel1();
      break;

    default:
      menuScreen();
      break;
    }
  }

  void menuScreen() {
    background(255);
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
      gameState = 2;
    }
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
      gameState = 2;
    }
  }

  void checkPlayerDeath() {
    if (player.health <= 0) {
      player.health = 100;
      gameState = 1;
      //println("player dead switching gamestate");
    }
  }

  void setupLevel1() {
    player = new Player(new PVector(width / 10, height - 60), 10, 1, 100);
    platforms.add(new Platform(new PVector(3*width/4, 3*height/4), width, 30));
    platforms.add(new Platform(new PVector(width/4, height / 2), width, 30));
    platforms.add(new Platform(new PVector(3*width/4, height/4), width, 30));
    checkPoint = new CheckPoint(new PVector(width - 100, 100), 80, 120);
  }

  void runLevel1() {

    background(255);
    lifeManager.run();
    player.run();
    platformHandler.update();    
    ps1.run();
    ps2.run();
    checkPoint.run();

    fill(255, 215, 0);
    text(totalcoins+" coins", width-300, 50);
  }
}
