class PlatformHandler {
  void setupPlatforms() {
    platforms = new ArrayList<Platform>();
  }

  void update() {
    
  }
  
  void addPlatform(){
    if(key == 'q'){
      platforms.add(new Platform(new PVector((width/4)*3, height/2)));
    }
  }
}
