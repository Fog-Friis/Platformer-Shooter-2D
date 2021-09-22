class HeartContainer {

  PVector position;
  Float hCsize;
  
  HeartContainer (PVector position, float hCsize) {
    this.position = position;
    this.hCsize = hCsize;

  }

 boolean isOn(PVector p) {
    if (p.x >= position.x -  hCsize && p.x <= position.x +  hCsize && p.y <= position.y +  hCsize && p.y >= position.y) {
      return true;
    } else {
      return false;
    }
  }

  void update() {
    if(isOn(player.position)){
    damageTaken = 0;
    player.health = 100;
    }
    
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    fill(255,200,255);
    rect(hCsize,hCsize,hCsize,hCsize);
    popMatrix();
  }

  void run() {
    update();
    display();
  }
}
