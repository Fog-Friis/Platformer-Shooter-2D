Player player;

void setup() {
  size(1280, 720);
  player = new Player(new PVector(width/2, height/2), 10, 1, 1);
  ArrayList<Enemy> enemy;
  for (int i = 0; i <10; i++){
  enemy.add(new Enemy());
  }
}

void keyPressed() {
  player.keyPress();
}

void keyReleased() {
  player.keyRelease();
}

void mousePressed() {
  player.mousePress();
}

void mouseReleased() {
  player.mouseRelease();
}

void draw() {
  background(255);
  player.run();
}
