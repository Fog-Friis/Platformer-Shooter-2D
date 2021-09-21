class Player {

  PVector position;
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector();
  PVector gravity = new PVector(0, 2);
  PVector jumpForce = new PVector(0, -100);
  float theta, health, mass, dir;
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
    if (key == 'a' || key == 'A') left = true;
    if (key == 'd' || key == 'D') right = true;
    if (key == ' ') jump = true;
    if (keyCode == SHIFT) sprint = !sprint;
  }

  void keyRelease() {
    if (key == 'a' || key == 'A') left = false;
    if (key == 'd' || key == 'D') right = false;
    if (key == ' ') jump = false;
    //if (keyCode == SHIFT) sprint = false;
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
      speed = 10;
    } else {
      speed = 4;
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
        if (b.isDead()) {
          bullets.remove(i);
        }

        for (Enemy e : enemies) {

          if (dist(b.position.x, b.position.y, e.position.x, e.position.y)<e.size/2) {
            bullets.remove(i);
            e.health -= 10;
          }
        }


        for (ShooterEnemy e : shooterEnemies) {

          if (dist(b.position.x, b.position.y, e.position.x, e.position.y)<e.size/2) {
            bullets.remove(i);
            e.health -= 10;
          }
        }
    }



    theta = atan2(position.y-mouseY, position.x-mouseX) + PI;

    move();

    if (position.x == 25 || position.x < 25) {
      velocity.x = 0;
      position.x = 25;
    }
    if (position.x >= width - 25) {
      velocity.x = 0;
      position.x = width - 25;
    }

    if (grounded) {
      gravity.y = 0;
    } else {
      gravity.y = 2;
    }

    applyForce(gravity);

    velocity.x = velocity.x + dir*speed;
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
    fill(0, 0, 255);
    rectMode(CENTER);
    ellipseMode(CENTER);

    rect(0, 0, 50, 50, 8, 8, 8, 8);

    fill(200, 200, 200);
    ellipse(0, 0, 35, 35);
    fill(0, 0, 255);
    ellipse(0, 0, 27, 27);
    fill(0, 0, 100);
    ellipse(0, 0, 20, 20);

    rotate(theta);
    fill(0, 0, 150);
    rect(0, 0, 70, 10);

    popMatrix();
  }

  void run() {
    display();
    update();
  }
}
