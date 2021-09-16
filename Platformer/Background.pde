PImage background;
  ArrayList<Background> backgroundImage;

class Background {
  
  PImage Image;
  
  Background(PImage Image){
    this.Image = Image;
    
  }
  
  float lifeSpan = 5;
  
  void display(){
    lifeSpan -=10.0;
    
    image(Image, 0,0, width, height);
  }
  
  boolean isDead(){
    if(lifeSpan < 0){
      return true;
    } else {
      return false;
    }
  }
  
}

class BackgroundManager {
  
  void run(){
    backgroundImage.add(new Background(background));
    
    for (int i = backgroundImage.size()-1; i >=0; i--) {
      Background b = backgroundImage.get(i);
      b.display();
      if (b.isDead()) {
        backgroundImage.remove(i);
      }
    }
  }

}
