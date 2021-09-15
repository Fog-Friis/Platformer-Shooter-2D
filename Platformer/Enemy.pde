

class Enemy {
PVector position;
PVector velocity;
PVector acceleration = new PVector();
PVector gravity = new PVector (0,0);
float enemySpeed;
int rTracker = 50;
ArrayList<Enemy> enemy;
char rightButton;

Enemy(PVector position, PVector velocity, PVector acceleration,PVector gravity, float speed, char rightButton) {
 this.position = position;
  this.velocity = velocity;
  this.acceleration = acceleration;
  this.gravity = gravity;
  this.enemySpeed = enemySpeed;
 this.rightButton = rightButton;

enemy = new ArrayList<Enemy>();
  
 
  }
}

void update() {

tracker(); //leder efter player 

//spawner();
//life();
}

void display() {
}

void tracker(){

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
