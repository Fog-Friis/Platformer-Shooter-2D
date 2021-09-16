//int colorcode=215;

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-10, 10), random(-10, 0));
    position = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  //Opdater livet
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 10.0;
  }

  // Method til display
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(255, 215, 0  , lifespan); //RGB code og synlighed
    
    ellipse(position.x, position.y, random(3,20),random(3,20));
  }

  //Fjerner døde partikler
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
