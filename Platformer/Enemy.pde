<<<<<<< HEAD
PVector position;
Enemy enemies;
=======
>>>>>>> e2dbb325384376001aa5c343e0e86fe758aa89f6

class Enemy {
float positionX, positionY, radius;
PVector velocity;
PVector acceleration = new PVector();
PVector gravity = new PVector (0,0);
float enemySpeed;
int rTracker = 50;
ArrayList<Enemy> enemy;
char rightButton;

<<<<<<< HEAD
Enemy(PVector position, PVector velocity, float speed) {
 this.position = position;
=======

Enemy(float positionX,float positionY,float radius, PVector velocity, PVector acceleration,PVector gravity, float speed, char rightButton) {
  
>>>>>>> e2dbb325384376001aa5c343e0e86fe758aa89f6
  this.velocity = velocity;
  this.enemySpeed = enemySpeed;


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
<<<<<<< HEAD
for (Enemy e : enemies) {
  if (dist(e.position.x, e.position.y, player.position.x,player.position.y)<50){
       println("Thor er gud");
//if (dist(enemy.position.x, enemy.position.y, player.position.x,player.position.y)<50){
 //Move towards player
}
  }

=======
  println("din far");
/*if (dist(enemy.position.x,enemy.postion.y, player.position.x,player.position.y)<rTracker){
 //Move towards player
}*/
 
>>>>>>> e2dbb325384376001aa5c343e0e86fe758aa89f6
}
/*void spawner() {
  //
 if (keyPressed && key == rightButton){
   pushMatrix();
  //enemy.add(new enemy(new PVector(300,700));
  println("din far");
  popMatrix();  
 }
 if (key == 'y'){
  //enemy.add(new enemy(new PVector(700,300));
  println("din mor");
 }
 
}
*/
/*
void life() {
 if (hp =< 0){
   println("Emil er grim");
 }
}
*/

void run() {
    update();
    display();
    
  }
