class Bullet {
  PVector position;
  PVector velocity;
  float angle;
  float radius;
  float direction;
  boolean hasHit = false;

  Bullet(PVector position, float angle, float radius, float direction) {
    this.position = position;
    this.radius = radius;
    this.direction = direction;
    this.angle = angle;
    velocity = new PVector(cos(angle)*10, sin(angle)*10);
  }

  void update() {
    if (velocity.x == 0 && velocity.y == 0 || position.x > width || position.x < 0) {
      hasHit = false;
    }

    position.add(velocity);
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    fill(0, 0, 0);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }

  boolean isDead() {
    if (position.x < 0 || position.x > width || position.y > height || position.y < 0) {
      return true;
    } else {
      return false;
    }
  }

  void run() {
    update();
    display();
    //hasHit();
    //println(angle);
  }
}
