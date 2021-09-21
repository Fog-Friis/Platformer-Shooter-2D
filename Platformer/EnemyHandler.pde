class EnemyHandler {
  void setupEnemies() {
    enemies = new ArrayList<Enemy>();
    shooterEnemies = new ArrayList<ShooterEnemy>();
  }

  void update() {
    for (int i = enemies.size()-1; i >=0; i--) {
      Enemy e = enemies.get(i);
      e.run();
      if (e.health <= 0) {
        fcoins = random(pmin, pmax);
        fcoins += 0.5;
        int coins = (int) fcoins;
        ps2 = new ParticleSystem(new PVector(e.position.x, e.position.y));
        enemies.remove(i);
        ps2.addParticle();
        totalcoins = totalcoins+coins;
        HipHopSound.play();
      }
    }

    for (int i = shooterEnemies.size()-1; i >=0; i--) {
      ShooterEnemy e = shooterEnemies.get(i);
      e.run();
      if (e.health <= 0) {
        
      fcoins = random(pmin, pmax);
        fcoins += 0.5;
        int coins = (int) fcoins;
        ps2 = new ParticleSystem(new PVector(e.position.x, e.position.y));
        ps2.addParticle();
        totalcoins = totalcoins+coins;
        HipHopSound.play(); 
        e.position.x = 10000;
         e.health = 30;
        
        
        for (Bullet b : e.bullets) {
          if (b.isDead()) {
            shooterEnemies.remove(i);
            
        
          }
        }
        
      }
    }
  }

  void addEnemy() {
    if (key == 'p') {
      enemies.add(new Enemy(new PVector(random(200, width-200), random(200, height-200)), 100, 7, 50));
    }

    if (key == 'o') {
      shooterEnemies.add(new ShooterEnemy(new PVector(random(200, width - 200), random(200, height - 200)), 70, 30, 300, 300));
    }
  }
}
