float playerHealth = 100;

class LifeManager {

  float attackRate = 120f;
  float nextAttackTime = attackRate;

  void update() {

    for (Enemy e : enemies) { 
      if (frameCount >= nextAttackTime) {
        if (dist(player.position.x, player.position.y, e.position.x, e.position.y)<e.size/2+25) {
          playerHealth -= 10;
          nextAttackTime += attackRate;
        }
      }
    }
  }

  void display() {
    println(playerHealth);
    pushMatrix();
    rectMode(CORNER);
    fill(0, 0, 0);
    rect(width/16, height/32, 2*104, 2*14);
    fill(255, 0, 0);
    rect(width/16+4, height/32+4, 2*playerHealth, 2*10);
    popMatrix();
    //text(str(playerHealth), width/16, height/32, 9999, 9999);
  }

  void run() {
    update();
    display();
  }
}
