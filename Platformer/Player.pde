class Player {

  PVector position;
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector();
  PVector gravity = new PVector(0, 2);
  PVector jumpForce = new PVector(0, -100);
  float theta, health, mass, sprintSpeed, dir;
  float speed = 4;
  boolean grounded = false;
  boolean right, left, jump, sprint;

  Player(PVector position, float mass, float theta, float health) {
    this.position = position;
    this.theta = theta;
    this.health = health;
    this.mass = mass;
  }

  boolean grounded(PVector p) {
    return(p.x >= width && p.x <= width && p.y >= height && p.y <= height);
  }

  void registerPress() {
    if (key == 'a') left = true;
    if (key == 'd') right = true;
    if (key == ' ') jump = true;
    if (keyCode == CONTROL) sprint = true;
  }

  void registerRelease() {
    if (key == 'a') left = false;
    if (key == 'd') right = false;
    if (key == ' ') jump = false;
    if (keyCode == CONTROL) sprint = false;
  }

  void move() {

    if (left) {
      dir = -1;
    } 
    if (right) {
      dir = 1;
    }

    if (jump) {
      if (grounded) {
        grounded = false;
        applyForce(jumpForce);
      }
    }

    if (sprint) {
      sprintSpeed = 2.5;
    } else {
      sprintSpeed = 1;
    }
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    move();

    if (!grounded) applyForce(gravity);

    velocity.x = velocity.x + dir*speed*sprintSpeed;
    velocity.add(acceleration);
    position.add(velocity);

    dir = 0;

    if (position.y >= height - 50) {
      velocity.y = velocity.y*0;
      grounded = true;
    }
    velocity.x = 0;
    acceleration.mult(0);
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);

    rect(0, 0, 50, 50);

    popMatrix();
  }

  void run() {
    display();
    update();
  }
}
