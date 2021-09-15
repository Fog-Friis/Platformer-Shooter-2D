

class Enemy {
  PVector position;
  PVector velocity;
  float size;
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



  void update() {    
    //takeDamage();
    //tracker(); //leder efter player 


    //spawner();
    //life();
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    fill(255, 0, 0);
    rect(0, 0, size, size);
    popMatrix();
  }

  void tracker() {

    // if (dist(e.position.x, e.position.y, player.position.x,player.position.y)<50){
    //    println("test");
    //if (dist(enemy.position.x, enemy.position.y, player.position.x,player.position.y)<50){
    //Move towards player
    //}
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
