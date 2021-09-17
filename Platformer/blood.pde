class Blood extends Particle {

  Blood(PVector l) {
    super(l);
  }

   void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(255, 0, 0  , lifespan); //RGB code og synlighed
    
    ellipse(position.x, position.y, 10,10);
  }
}
