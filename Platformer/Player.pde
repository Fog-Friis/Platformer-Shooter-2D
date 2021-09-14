class Player {

  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector gravity;
  float theta, health;

  Player(PVector position, float theta, float health) {
    this.position = position;
    this.theta = theta;
    this.health = health;
  }

  void move() {
    if (keyPressed && keyCode == 'a') {
      position.sub(velocity);
    }

    if (keyPressed && keyCode == 'd') {
      position.add(velocity);
    }
  }

  void update() {
  }

  void display() {
  }

  void run() {
    display();
    update();
  }
}
