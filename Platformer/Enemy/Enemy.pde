void setup(){
  size(1000,1000)
}
class enemy {
PVector position;
PVector velocity;
PVector acceleration = new PVector();
PVector gravity = new PVector (0,0);
int rTracker = 50;
Arraylist<Enemy> enemy;

enemy(PVector position, PVector velocity, PVector acceleration,PVector gravity) {
  this.position = position;
  this.velocity = velocity;
  this.acceleration = acceleration;
  this.gravity = gravity;


enemy = new ArrayList<Enemy>();

  
  }
}
void update() {
enemy.tracker();  
}

void tracker(){
//if (dist(enemy.position.x,enemy.postion.y, player.position.x,player.position.y)<rTracker){
 if keyPressed(){
 if (key == 't'){
  enemy.add(new enemy(new PVector(300,700));
 }
 if (key == 'y'){
  enemy.add(new enemy(new PVector(700,300));
 }
 
}
}
void spawner() {
  //i
}


}
