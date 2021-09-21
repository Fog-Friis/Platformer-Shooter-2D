class CheckPoint {

  PVector position;
  Float cLength, cHeight;

  CheckPoint (PVector position, float cLength, float cHeight) {
    this.position = position;
    this.cLength = cLength;
    this.cHeight = cHeight;
  }
  
    boolean isOn(PVector p) {
    if (p.x >= position.x - cLength / 2 - 20 && p.x <= position.x + cLength / 2 + 20 && p.y >= position.y -40 && p.y <= position.y + cHeight / 2) {
      return true;
    } else {
      return false;
    }
  }

  boolean isOver(PVector p) {
    if (p.x >= position.x - cLength / 2 - 20 && p.x <= position.x + cLength / 2 + 20 && p.y <= position.y + cHeight && p.y >= position.y) {
      return true;
    } else {
      return false;
    }
  }



  void update() {
    if(isOn(player.position)){
      gameStateManager.clearScreen();
      player.position.x = width / 10;
      player.position.y = height - 50;
      gameState += 1;
      gameStateManager.nextSpawnTime = 0;
    }
    
    if(isOver(player.position)){
      gameStateManager.clearScreen();
      player.position.x = width / 10;
      player.position.y = height - 50;
      gameState += 1;
      gameStateManager.nextSpawnTime = 0;      
    }
    
    
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    stroke(1);
    fill(0,255,0);
    //rect(0,0,cLength,cHeight);
    quad(-cLength / 2, cHeight / 2 - cHeight / 2, 0, cHeight - cHeight / 2, cLength / 2, cHeight / 2 - cHeight / 2, 0, -cHeight / 2);
    popMatrix();
  }

  void run() {
    update();
    display();
  }
}
