
void setup(){
  size(1280,720);
}

void draw(){
background(255);  
}
class enemy {
float positionX, positionY, radius;
PVector velocity;
PVector acceleration = new PVector();
PVector gravity = new PVector (0,0);
float enemySpeed;
int rTracker = 50;
ArrayList<Enemy> enemy;
char rightButton;


enemy(float positionX,float positionY,float radius, PVector velocity, PVector acceleration,PVector gravity, float speed, char rightButton) {
  
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
  println("din far");
/*if (dist(enemy.position.x,enemy.postion.y, player.position.x,player.position.y)<rTracker){
 //Move towards player
}*/
 
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
