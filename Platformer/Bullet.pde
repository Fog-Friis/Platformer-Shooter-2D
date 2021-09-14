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
    velocity = new PVector(direction*cos(angle)*5, sin(angle)*5);
  }

  void update() {
    position.add(velocity);

    if (velocity.x == 0 && velocity.y == 0 || position.x > width || position.x < 0) {
      hasHit = false;
    }
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
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
