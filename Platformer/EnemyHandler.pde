class EnemyHandler {
  void setupEnemies() {
    enemies = new ArrayList<Enemy>();
  }

  void update() {
    for (int i = enemies.size()-1; i >=0; i--) {
      Enemy e = enemies.get(i);
      e.run();
      if (e.health <= 0) {
        enemies.remove(i);
      }
    }
  }
  
  void addEnemy(){
    if(key == 'p'){
      enemies.add(new Enemy(new PVector(width/2, height/2), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), 0, 100));
    }
  }
}
