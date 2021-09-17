class Platform {
  PVector position;
  float pLength;
  float pHeight;
  boolean isOn = false;

  Platform(PVector position, float pLength, float pHeight) {
    this.position = position;
    this.pLength = pLength;
    this.pHeight = pHeight;
  }

  boolean isOn(PVector p) {
    if (p.x >= position.x - pLength / 2 - 20 && p.x <= position.x + pLength / 2 + 20 && p.y >= position.y -40 && p.y <= position.y + pHeight / 2) {
      return true;
    } else {
      return false;
    }
  }

  boolean isOver(PVector p) {
    if (p.x >= position.x - pLength / 2 - 20 && p.x <= position.x + pLength / 2 + 20 && p.y <= position.y + pHeight && p.y >= position.y) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    stroke(1);
    fill(165, 155, 130);
    rect(0, 0, pLength, pHeight);
    popMatrix();
  }

  void run() {
    display();
  }
}
