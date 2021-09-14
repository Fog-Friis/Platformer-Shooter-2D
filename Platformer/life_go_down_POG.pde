boolean playerHit = false;
float playerLife = 100;

class LifeManager {
  void update() {
    if (playerHit == true) {
      playerLife -= 10;
      playerHit = false;
    }
  }

  void display() {
    text(str(playerLife), width/16, height/32, 9999, 9999);
  }

  void run() {
    update();
    display();
  }
}
