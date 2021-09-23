float Fcheese;
int cheese;
Button But1, But2, But3, But4, But5, But6, But7, But8, But9;  //cB=circleButton
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
  boolean visible=true;
  boolean mouseOver=false;

  Button(float x, float y, float r, String txt, color c) {
    pos = new PVector(x, y);
    radius = r;
    caption = txt;
    col = c;
    visible = true;
  }

  void show() {
    rectMode(CORNER);
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
 

  
  void mainMenuB() {    


    if  (mouseX>width/1.88-sizebutton/1.4 && mouseX<width/1.88+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.5-sizebutton/7 && mouseY<(height/1.5+sizebutton/3)-sizebutton/7) {   //Ændre hvad height er divideret for fremtide knapper
      link("https://github.com/Fog-Friis/Platformer-Shooter-2D/wiki/Lore"); //Funktion
    }
    if  (mouseX>width/1.88-sizebutton/1.4 && mouseX<width/1.88+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.25-sizebutton/7 && mouseY<(height/1.25+sizebutton/3)-sizebutton/7) {   
        gameState = 12;
    }
      
    if  (mouseX>width/1.88-sizebutton/1.4 && mouseX<width/1.88+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.9-sizebutton/7 && mouseY<(height/1.9+sizebutton/3)-sizebutton/7) {
      heartContainer.show = 255;
      gameState = 2;
      gameStateManager.nextSpawnTime = 0;
    }
    if  (mouseX>width/1.05-sizebutton/1.4 && mouseX<width/1.05+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.05-sizebutton/7 && mouseY<(height/1.05+sizebutton/3)-sizebutton/7) {  
      if (totalcoins >= 69) {
        totalcoins -= 69;
        Fcheese = random(1, 5.9999999);
        cheese = (int) Fcheese;
        switch(cheese) {
        case 1:
          link("https://en.wikipedia.org/wiki/Cheddar_cheese"); //Funktion
          break;

        case 2:
          link("https://en.wikipedia.org/wiki/Mozzarella"); //Funktion
          break;

        case 3:
          link("https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley"); //Funktion
          break;

        case 4:
          link("https://en.wikipedia.org/wiki/Halloumi"); //Funktion
          break;

        case 5:
          link("https://www.youtube.com/watch?v=SyimUCBIo6c&ab_channel=Jensen"); //Funktion
          break;
        }
      }
    }
  }
  void gameOverB() {
    if  (mouseX>width/1.88-sizebutton/1.4 && mouseX<width/1.88+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.5-sizebutton/7 && mouseY<(height/1.5+sizebutton/3)-sizebutton/7) {   //Ændre hvad height er divideret for fremtide knapper
      gameState = 0; //Funktion
    }
    if  (mouseX>width/1.88-sizebutton/1.4 && mouseX<width/1.88+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.9-sizebutton/7 && mouseY<(height/1.9+sizebutton/3)-sizebutton/7) { 

      heartContainer.show = 255;
      switch(lastLevel) {

      case 1:
        gameState = 2;
        break;

      case 2:
        gameState = 3;
        break;

      case 3:
        gameState = 4;
        break;
      }
    }
  }
   void controlScreenB() {   

    if  (mouseX>width/1.88-sizebutton/1.4 && mouseX<width/1.88+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.10-sizebutton/7 && mouseY<(height/1.10+sizebutton/3)-sizebutton/7) {   
     gameState = 0;
    }
   }
}
