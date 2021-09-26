class CheckPoint {

  PVector position;
  Float cLength, cHeight;

  CheckPoint (PVector position, float cLength, float cHeight) {
    this.position = position;
    this.cLength = cLength;
    this.cHeight = cHeight;
  }  

  boolean contains(PVector p) {
    if (p.x >= position.x - cLength / 2 - 25 && p.x <= position.x + cLength / 2 + 25 && p.y <= position.y + cHeight / 2 && p.y >= position.y - cHeight/2 - 25) {
      return true;
    } else {
      return false;
    }
  }



  void update() {        
    if (contains(player.position)) {
      gameStateManager.clearScreen();
      player.position.x = width / 11;
      player.position.y = height - 50;
      gameState += 1;
      //ddddddddddddgameStateManager.nextSpawnTime = 0;
      heartContainer1.show = 255;
      heartContainer2.show = 255;
    }
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    stroke(1);
    fill(0, 255, 0);
    quad(-cLength / 2, cHeight / 2 - cHeight / 2, 0, cHeight - cHeight / 2, cLength / 2, cHeight / 2 - cHeight / 2, 0, -cHeight / 2);
    popMatrix();
  }

  void run() {
    update();
    display();
  }
}
