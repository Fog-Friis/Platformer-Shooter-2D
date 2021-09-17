

class Enemy {
  PVector position;
  PVector velocity;
  float size, theta;
  PVector acceleration = new PVector();
  PVector gravity = new PVector (0, 0);
  float enemySpeed, health;
  int rTracker = 50;
  char rightButton;

  Enemy(PVector position, PVector velocity, PVector gravity, float size, float enemySpeed, float health) {
    this.position = position;
    this.velocity = velocity;
    this.size = size;
    this.gravity = gravity;
    this.enemySpeed = enemySpeed;
    this.health = health;
    //this.rightButton = rightButton;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {    
    //takeDamage();
    tracker(); //leder efter player 

    position.add(velocity);
    velocity.add(acceleration);
    applyForce(gravity);
    acceleration.mult(0);
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    fill(3*health+150, 0, 0);
    rect(0, 0, size, size, size / 8, size / 8, size / 8, size / 8);
    popMatrix();
  }

  void tracker() {
    theta = atan2(position.y-player.position.y, position.x-player.position.x) + PI;
    velocity = new PVector(cos(theta)*enemySpeed, sin(theta)*enemySpeed);
  }

  void run() {
    update();
    display();
  }
}

class ShooterEnemy {

  PVector position;
  float size, theta, health, attackRate, nextAttackTime;
  float dir = 1;
  public ArrayList<Bullet> bullets;

  ShooterEnemy(PVector position, float size, float health, float attackRate, float nextAttackTime) {
    this.position = position;
    this.size = size;
    this.health = health;
    this.attackRate = attackRate;
    this.nextAttackTime = nextAttackTime;
    bullets = new ArrayList<Bullet>();
  }

  void shoot() {
    println("shot");
    pushMatrix();
    translate(position.x, position.y);
    bullets.add(new Bullet(new PVector(35*cos(theta)+position.x, 35*sin(theta)+position.y), theta, 10, dir));
    popMatrix();
  }

  void update() {

    for (int i = bullets.size()-1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      b.run();
      //c.velocity = new PVector(cos(angle)*5, sin(angle*5));
      if (b.isDead()) {
        bullets.remove(i);
      }
      if (dist(player.position.x, player.position.y, b.position.x, b.position.y)<35) {
        bullets.remove(i);
        player.health -= 10;
      }
    }

    //if(player.position.x < position.x) dir = -1;
    //if(player.position.x > position.x) dir = 1;

    theta = atan2(position.y-player.position.y, position.x-player.position.x) + PI;

    if (frameCount >= nextAttackTime) {
      shoot();
      nextAttackTime = frameCount + attackRate;
    }
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);

    fill(255, 0, 0);
    rect(0, 0, size, size, size / 5, size / 5, size / 5, size / 5);

    rotate(theta);
    fill(150, 0, 0);
    rect(0, 0, 3*size/2, 10);


    popMatrix();
  }

  void run() {
    display();
    update();
  }
}
