int pmin = 5;
int pmax = 20;
float fcoins;
int coins;
int totalcoins = 0;
ParticleSystem ps1, ps2;


class ParticleSystem {
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.get();
    particles = new ArrayList<Particle>();
    blood = new ArrayList<Blood>();
  }

  void addParticle() {

    for (int i = 0; i < fcoins; i++) {
        
        particles.add(new Particle(origin));
    }

  }
  void addBlood() {
  for (int i = 0; i < 10; i++) {
        
        blood.add(new Blood(origin));
    }
  }
  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
