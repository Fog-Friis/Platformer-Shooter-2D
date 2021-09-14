Player player;

void setup() {
  size(1280, 720);
  player = new Player(new PVector(width/2, height/2), 10, 1, 1);
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
