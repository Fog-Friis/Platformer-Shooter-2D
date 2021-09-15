class PlatformHandler {
  void setupPlatforms() {
    platforms = new ArrayList<Platform>();
  }

  void update() {
    player.grounded = false;
    for (Platform p : platforms) {
      p.run();
      if (p.isOn(player.position)) {
        println("player on platform");
        player.velocity.y = 0;
        player.position.y = p.position.y - 40;
        player.grounded = true;
      } else if(player.position.y >= height - 50) {
      player.velocity.y = player.velocity.y*0;
      player.grounded = true;
      }
    }
  }

  void addPlatform() {
    if (key == 'q') {
      platforms.add(new Platform(new PVector((width/4)*3, 3*height/4), 300, 30));
    }
    if (key == 'e') {
      platforms.add(new Platform(new PVector(width/2, height/2), 300, 30));
    }
  }
}
