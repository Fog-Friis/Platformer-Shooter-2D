

class Enemy {
  PVector position;
  PVector velocity;
  float size, theta;
  PVector acceleration = new PVector();
  PVector gravity = new PVector (0, 0);
  float enemySpeed, health;
  int rTracker = 50;
  char rightButton;

  Enemy(PVector position, PVector velocity, PVector gravity, float size, float enemySpeed, float health) {
    this.position = position;
    this.velocity = velocity;
    this.size = size;
    this.gravity = gravity;
    this.enemySpeed = enemySpeed;
    this.health = health;
    //this.rightButton = rightButton;
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }

  void update() {    
    //takeDamage();
    tracker(); //leder efter player 
    
    position.add(velocity);
    velocity.add(acceleration);
    applyForce(gravity);
    acceleration.mult(0);
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    fill(3*health+150, 0, 0);
    println(3*health+150);
    rect(0, 0, size, size, size / 8, size / 8, size / 8, size / 8);
    popMatrix();
    
  }

  void tracker() {
    theta = atan2(position.y-player.position.y, position.x-player.position.x) + PI;
    velocity = new PVector(cos(theta)*enemySpeed, sin(theta)*enemySpeed);
  }
  /*void spawner() {
   //
   if (keyPressed && key == 'd'){
   pushMatrix();
   //enemy.add(new enemy(new PVector(300,700));
   println("test1");
   popMatrix();  
   }
   if (key == 'y'){
   //enemy.add(new enemy(new PVector(700,300));
   println("test2");
   }
   
   }
   */
  /*
void life() {
   if (hp =< 0){
   println("test3");
   }
   }
   */

  void run() {
    update();
    display();

    /*   for (Enemy e: enemy){
     e.update();
     e.display();
     }*/
  }
}
