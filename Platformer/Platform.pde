class Platform {
  PVector position;
  float pLength;
  float pHeight;
  boolean isOn = false;

  Platform(PVector position, float pLength, float pHeight) {
    this.position = position;
    this.pLength = pLength;
    this.pHeight = pHeight;
  }

  void update() {    
    
  }
  
  boolean isOn(PVector p) {
    if(p.x >= position.x - pLength / 2 - 20 && p.x <= position.x + pLength / 2 + 20&& p.y+40 >= position.y && p.y <= position.y + pHeight / 2){
      return true;
    } else {
      return false;
    }
    
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    
    
    fill(150, 150, 150);
    rect(0,0,pLength,pHeight);
    popMatrix();
  }
  
  void run() {
    update();
    display();
  }
}
