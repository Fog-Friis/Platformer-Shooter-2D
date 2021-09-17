class Blood extends Particle {

  Blood(PVector l) {
    super(l);
  }

   void display() {
    fill(255, 0, 0  , lifespan); //RGB code og synlighed
    
    ellipse(position.x, position.y, 20,20);
  }
}
