class HeartContainer {

  void setContainerUp(){
    show = 255;
  }
  
  int show = 255;
  PVector position;
  Float hCsize;
  
  HeartContainer (PVector position, float hCsize) {
    this.position = position;
    this.hCsize = hCsize;

  }

 boolean isOn(PVector p) {
    if (p.x >= position.x - 25 && p.x <= position.x +  hCsize + 25 && p.y <= position.y + hCsize + 25 && p.y >= position.y) {
      return true;
    } else {
      return false;
    }
  }

  void update() {        
    if(isOn(player.position) && show > 0){
    damageTaken = 0;
    player.health = 100;
    //position.x = 10000;
    show = 0;
    }
    
  }

  void display() {
  pushMatrix();
  rectMode(CORNER);

  translate(position.x, position.y);
  stroke(1);
  
  if (show <= 0) noStroke();
  
  fill(155, 150, 155, show);
  rect(0,0,hCsize,hCsize, hCsize/3.5, hCsize/3.5, hCsize/3.5, hCsize/3.5);
  
  fill(255, 200, 255, show);
  ellipse(hCsize/2,hCsize/2,hCsize,hCsize);

  fill(155, 150, 155, show);
  rect(hCsize/2.5,0,hCsize/6,hCsize);
  rect(0,hCsize/2.5,hCsize,hCsize/6);
  
  fill(255, 200, 255, show);
  ellipse(hCsize/2,hCsize/2,hCsize/1.2,hCsize/1.2);
  
  noStroke();  
  fill(255,0,0, show);
  ellipse(hCsize/3,hCsize/2.5,hCsize/3,hCsize/3);
  ellipse(hCsize/1.5,hCsize/2.5,hCsize/3,hCsize/3);  
  ellipse(hCsize/2,hCsize/1.764,hCsize/3,hCsize/3);
  triangle(hCsize/5.714,hCsize/2.143, hCsize/2, hCsize/1.2, hCsize/1.2121, hCsize/2.143);
  stroke(1);
  popMatrix();

  }

  void run() {
    update();
    display();
  }
}
