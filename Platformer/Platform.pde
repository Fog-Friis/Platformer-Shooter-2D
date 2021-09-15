class Platform {
  PVector position;

  Platform(PVector position) {
    this.position = position;
  }

  void update() {    
    
  }

  void display() {
    rect(position.x, position.y, 100, 100);
  }
  
  void run() {
    update();
    display();
  }
}
