int pmin = 5;
int pmax = 20;
float fcoins;
int coins;
int totalcoins = 0;
ParticleSystem ps1, ps2;
//lav particlesysten
/*
//add on setup
  ps1 = new ParticleSystem(new PVector(player.position.x,player.position.y));
  ps2 = new ParticleSystem(new PVector(player.position.x,player.position.y));

//Add on hitdetect
ps1 = new ParticleSystem(new PVector(player.position.x,player.position.y));
        ps1.addParticle();
        
*/

class ParticleSystem {
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {

    for (int i = 0; i < fcoins; i++) {
        
        particles.add(new Particle(origin));
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
