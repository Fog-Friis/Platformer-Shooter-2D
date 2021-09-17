float fdeathN;
int deathN;

class LifeManager {

  float attackRate = 120f;
  float nextAttackTime = attackRate;

  void update() {

    for (Enemy e : enemies) { 
      if (frameCount >= nextAttackTime) {
        if (dist(player.position.x, player.position.y, e.position.x, e.position.y)<e.size/2+25) {
          e.health = 0;
          player.health -= 10;
          nextAttackTime += attackRate;
          ps1 = new ParticleSystem(new PVector(player.position.x,player.position.y));
         // ps1.addBlood();
          fdeathN = random(1,5);
          fdeathN = fdeathN + 0.5f;
          deathN  = (int) fdeathN;
          
          switch(deathN) { //Virker ikke ordenligt der er et delay
            case 1:
          death1.play();
          break;
          
          case 2:
          death2.play();
          break;
          
          case 3:
          death3.play();
          break;
          
          case 4:
          death4.play();
          break;
          
          case 5:
          death5.play();
          break;
          }
        }
      }
    }
  }

  void display() {
    pushMatrix();
    rectMode(CORNER);
    fill(0, 0, 0);
    rect(width - width/2, height/32, 2*104, 2*14);
    fill(255, 0, 0);
    rect(width - width/2+4, height/32+4, 2*player.health, 2*10);
    popMatrix();
    //text(str(playerHealth), width/16, height/32, 9999, 9999);
  }

  void run() {
    update();
    display();
  }
}
