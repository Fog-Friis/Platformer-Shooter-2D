class PlatformHandler {
  void setupPlatforms() {
    platforms = new ArrayList<Platform>();
  }

  void update() {
    player.grounded = false;
    for (Platform p : platforms) {
      p.run();
      if (p.isOn(player.position)) {
        player.velocity.y = 0;
        player.position.y = p.position.y - (25+p.pHeight / 2);
        player.grounded = true;
      } else if (player.position.y >= height - 50) {
        player.velocity.y = player.velocity.y*0;
        player.grounded = true;
      }
      if (p.isOver(player.position)){
        player.velocity.y = 0;
        player.position.y = p.position.y + p.pHeight / 2 + 25;
        player.grounded = false;
      } else if (player.position.y <= 25){
        player.velocity.y = 0;
        player.position.y = 25;
      }
      if (p.isLeft(player.position)){
        player.velocity.x = 0;
        //player.position.y = p.position.y;
        player.position.x = p.position.x + p.pLength / 2 + 26;
        //+ p.pHeight / 2 + 21;
      }
      if (p.isRight(player.position)){
        player.velocity.x = 0;
        player.position.x = p.position.x - p.pLength / 2 - 26;
      }
    }
  }

  /*void addPlatform(PVector pos, float len, float hei) {
   
   platforms.add(new Platform(pos, len, hei));
   if (key == 'q') {
   platforms.add(new Platform(new PVector((width/4)*3, 3*height/4), 300, 30));
   }
   if (key == 'e') {
   platforms.add(new Platform(new PVector(width/2, height/2), 300, 30));
   }
   }*/
}
