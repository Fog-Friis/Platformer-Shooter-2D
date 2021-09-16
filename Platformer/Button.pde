//Button class

Button B1,B2,B3,B4,B5,B6,B7,B8,B9;  //cB=circleButton
boolean toggleColor;
float sizebutton = 200; //radius af kuglen

//Ændre tekst her
/*void draw() {
 if(toggleColor) {
 cB = new Button(width/2, height/1.25, 125, "Fire Player 1", color(255, 0, 0));
 } else {
 cB = new Button(width/2, height/1.25, 125, "Fire Player 2", color(0, 0, 255));
 }
 if (cB.visible) cB.show();
 }
 */
/*
void mousePressed() {
  if (B1.visible) { //Hvis knappen ikke kan ses eksistere den ikke
    float d = dist(cB.pos.x, cB.pos.y, mouseX, mouseY);
    if (d <= cB.radius) {
    link("http://www.processing.org");
        
    }
  }
}*/


class Button {
  PVector pos;
  float radius;
  color col;
  String caption;
  boolean visible;

  Button(float x, float y, float r, String txt, color c) {
    pos = new PVector(x, y);
    radius = r;
    caption = txt;
    col = c;
    visible = true;
  }

  void show() {
    fill(col);
    strokeWeight(3);
    rect(pos.x-sizebutton/1.4, pos.y-sizebutton/7, sizebutton, sizebutton/3);
    fill(0);
    float fontSize = sizebutton * 0.20;
    textSize(fontSize);
   // float tw = textWidth(caption);
    float tx = pos.x - 45;
    float ty = pos.y + (fontSize / 2);
    text(caption, tx, ty);
  }
}
