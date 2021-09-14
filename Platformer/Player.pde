class Player {

  PVector position;
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector();
  PVector gravity = new PVector(0, 2);
  PVector jumpForce = new PVector(0, -100);
  float theta, health, mass, sprintSpeed, dir;
  float speed = 4;
  float nextAttackTime = 0;
  float attackRate = 10;
  boolean grounded = false;
  boolean right, left, jump, sprint, shoot;
  ArrayList<Bullet> bullets;

  Player(PVector position, float mass, float theta, float health) {
    this.position = position;
    this.theta = theta;
    this.health = health;
    this.mass = mass;
    bullets = new ArrayList<Bullet>();
  }

  boolean grounded(PVector p) {
    return(p.x >= width && p.x <= width && p.y >= height && p.y <= height);
  }

  void keyPress() {
    if (key == 'a') left = true;
    if (key == 'd') right = true;
    if (key == ' ') jump = true;
    if (keyCode == CONTROL) sprint = true;
  }

  void keyRelease() {
    if (key == 'a') left = false;
    if (key == 'd') right = false;
    if (key == ' ') jump = false;
    if (keyCode == CONTROL) sprint = false;
  }

  void mousePress() {
    if (mouseButton == LEFT) shoot = true;
  }
  void mouseRelease() {
    if (mouseButton == LEFT) shoot = false;
  }

  void shoot() {
    pushMatrix();
    translate(position.x, position.y);
    bullets.add(new Bullet(new PVector(35*cos(theta)+position.x, 35*sin(theta)+position.y), theta, 10, dir));
    popMatrix();
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

    if (frameCount >= nextAttackTime) {
      if (shoot) {
        shoot();
        nextAttackTime = frameCount + attackRate;
      }
    }
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    for (int i = bullets.size()-1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      b.run();
      //c.velocity = new PVector(cos(angle)*5, sin(angle*5));
      if (b.isDead() /*|| gameState != 1*/) {
        bullets.remove(i);
        //println("removed ball");
      }
    }

    theta = atan2(position.y-mouseY, position.x-mouseX) + PI;

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

    rotate(theta);
    rectMode(CENTER);
    rect(0, 0, 70, 10);

    popMatrix();
  }

  void run() {
    display();
    update();
  }
}