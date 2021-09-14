PVector position;
Enemy enemies;

class Enemy {
float positionX, positionY, radius;
PVector position;
PVector velocity;
PVector acceleration = new PVector();
PVector gravity = new PVector (0,0);
float enemySpeed;
int rTracker = 50;
ArrayList<Enemy> enemy;
char rightButton;
  

Enemy(PVector position, PVector velocity, float speed) {
 this.position = position;
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
for (Enemy e : enemies) {
  if (dist(e.position.x, e.position.y, player.position.x,player.position.y)<50){
       println("Thor er gud");
//if (dist(enemy.position.x, enemy.position.y, player.position.x,player.position.y)<50){
 //Move towards player
}
  }

}
/*void spawner() {
  //
 if (keyPressed && key == 'd'){
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
