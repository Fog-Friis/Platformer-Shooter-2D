class EnemyHandler {
  void setupEnemies() {
    enemies = new ArrayList<Enemy>();
  }

  void update() {
    for (int i = enemies.size()-1; i >=0; i--) {
      Enemy e = enemies.get(i);
      e.run();
      if (e.health <= 0) {
          ps2 = new ParticleSystem(new PVector(e.position.x,e.position.y));
        enemies.remove(i);
        ps2.addParticle();
      }
    }
  }

  void addEnemy() {
    if (key == 'p') {
      enemies.add(new Enemy(new PVector(random(200,width-200), random(200,height-200)), new PVector(0, 0), new PVector(0, 0), 100, 5, 50));
    }
  }
}
