Player player;

void setup() {
  size(1280, 720);
  player = new Player(new PVector(width/2, height/2), 10, 1, 1);
  enemies.add(new Enemy(new PVector(200, 200), new PVector(0, 0),0.0));
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
