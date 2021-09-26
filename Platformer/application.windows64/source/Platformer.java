import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Platformer extends PApplet {


SoundFile death1,death2,death3,death4,death5,HipHopSound;

Player player;
ArrayList<Enemy> enemies;
ArrayList<ShooterEnemy> shooterEnemies;
ArrayList<Platform> platforms;
ArrayList<Particle> particles;
ArrayList<Blood> blood;
EnemyHandler enemyHandler;
PlatformHandler platformHandler;
LifeManager lifeManager;
GameStateManager gameStateManager;
int gameState = 0;
CheckPoint checkPoint;
HeartContainer heartContainer1 , heartContainer2;
//BackgroundManager backgroundManager;


public void setup() {
  
  background = loadImage("Background-OG2.png");
  backgroundControl = loadImage("BackgroundControl.png");
  gameStateManager = new GameStateManager();
  enemyHandler = new EnemyHandler();
  enemyHandler.setupEnemies();
  platformHandler = new PlatformHandler();
  platformHandler.setupPlatforms();
  player = new Player(new PVector(width/2, height/2), 10, 1, 100);
  //ps1 er til player 
  ps1 = new ParticleSystem(new PVector(player.position.x, player.position.y));
  //ps2 er til enemy
  ps2 = new ParticleSystem(new PVector(player.position.x, player.position.y));
  textSize(50);
  lifeManager = new LifeManager();
  gameStateManager.setManagerUp();
  death1 = new SoundFile(this, "Anakin.wav");// Virker ikke med længre lyd filer
  death2 = new SoundFile(this, "ImperialGuard.wav");
  death3 = new SoundFile(this, "Lando.wav");
  death4 = new SoundFile(this, "WilhelmScream.wav");
  death5 = new SoundFile(this, "YoungAnakin.wav");
  HipHopSound = new SoundFile(this, "Stud.wav");
  //heartContainer.setContainerUp();
}

public void keyPressed() {
  player.keyPress();
 // enemyHandler.addEnemy();
}

public void keyReleased() {
  player.keyRelease();
}

public void mousePressed() {
  
  player.mousePress();
 if (gameState == 0) { //Hvis knappen ikke kan ses eksistere den ikke
  But1.mainMenuB();
  }
  
  if (gameState == 1) {
  But4.gameOverB();
  }
  
  if (gameState == 2){
  But1.controlScreenB();
  }
 
} 
public void mouseReleased() {
  player.mouseRelease();
}

public void draw() {
  gameStateManager.manage();
  //println(heartContainer.show);
}
PImage background, backgroundControl;
class Bullet {
  PVector position;
  PVector velocity;
  float angle;
  float radius;
  float direction;
  boolean hasHit = false;

  Bullet(PVector position, float angle, float radius, float direction) {
    this.position = position;
    this.radius = radius;
    this.direction = direction;
    this.angle = angle;
    velocity = new PVector(cos(angle)*10, sin(angle)*10);
  }

  public void update() {
    if (velocity.x == 0 && velocity.y == 0 || position.x > width || position.x < 0) {
      hasHit = false;
    }

    position.add(velocity);
  }

  public void display() {
    pushMatrix();
    translate(position.x, position.y);
    fill(0, 0, 0);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }

  public boolean isDead() {
    if (position.x < 0 || position.x > width || position.y > height || position.y < 0) {
      return true;
    } else {
      return false;
    }
  }

  public void run() {
    update();
    display();
  }
}
float Fcheese;
int cheese;
Button But1, But2, But3, But4, But5, But6, But7, But8, But9;  //cB=circleButton
boolean toggleColor;
float sizebutton = 200; //radius af kuglen

//Ændre tekst her
/*void draw() {
 if(toggleColor) {
 cB = new Button(width/2, height/1.25, 125, "Fire Player 1", color(255, 0, 0));
 } else {
 cB = new Button(width/2, height/1.25, 125, "Fire Player 2", color(0, 0, 255));
 }
 if (cB.visible) cB.show();
 }
 */
/*
void mousePressed() {
 if (B1.visible) { //Hvis knappen ikke kan ses eksistere den ikke
 float d = dist(cB.pos.x, cB.pos.y, mouseX, mouseY);
 if (d <= cB.radius) {
 link("http://www.processing.org");
 
 }
 }
 }*/


class Button {
  PVector pos;
  float radius;
  int col;
  String caption;
  boolean visible=true;
  boolean mouseOver=false;

  Button(float x, float y, float r, String txt, int c) {
    pos = new PVector(x, y);
    radius = r;
    caption = txt;
    col = c;
    visible = true;
  }

  public void show() {
    rectMode(CORNER);
    fill(col);
    strokeWeight(3);
    rect(pos.x-sizebutton/1.4f, pos.y-sizebutton/7, sizebutton, sizebutton/3);
    fill(0);
    float fontSize = sizebutton * 0.20f;
    textSize(fontSize);
    // float tw = textWidth(caption);
    float tx = pos.x - 45;
    float ty = pos.y + (fontSize / 2);
    text(caption, tx, ty);
  }
 

  
  public void mainMenuB() {    


    if  (mouseX>width/1.88f-sizebutton/1.4f && mouseX<width/1.88f+sizebutton-sizebutton/1.4f &&    
      mouseY>height/1.5f-sizebutton/7 && mouseY<(height/1.5f+sizebutton/3)-sizebutton/7) {   //Ændre hvad height er divideret for fremtide knapper
      link("https://github.com/Fog-Friis/Platformer-Shooter-2D/wiki/Lore"); //Funktion
    }
    if  (mouseX>width/1.88f-sizebutton/1.4f && mouseX<width/1.88f+sizebutton-sizebutton/1.4f &&    
      mouseY>height/1.25f-sizebutton/7 && mouseY<(height/1.25f+sizebutton/3)-sizebutton/7) {   
        gameState = 2;
    }
      
    if  (mouseX>width/1.88f-sizebutton/1.4f && mouseX<width/1.88f+sizebutton-sizebutton/1.4f &&    
      mouseY>height/1.9f-sizebutton/7 && mouseY<(height/1.9f+sizebutton/3)-sizebutton/7) {
      heartContainer1.show = 255;
      heartContainer2.show = 255;
      gameState = 3;
      gameStateManager.nextSpawnTime = 0;
    }
    if  (mouseX>width/1.05f-sizebutton/1.4f && mouseX<width/1.05f+sizebutton-sizebutton/1.4f &&    
      mouseY>height/1.05f-sizebutton/7 && mouseY<(height/1.05f+sizebutton/3)-sizebutton/7) {  
      if (totalcoins >= 69) {
        totalcoins -= 69;
        Fcheese = random(1, 5.9999999f);
        cheese = (int) Fcheese;
        switch(cheese) {
        case 1:
          link("https://en.wikipedia.org/wiki/Cheddar_cheese"); //Funktion
          break;

        case 2:
          link("https://en.wikipedia.org/wiki/Mozzarella"); //Funktion
          break;

        case 3:
          link("https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley"); //Funktion
          break;

        case 4:
          link("https://en.wikipedia.org/wiki/Halloumi"); //Funktion
          break;

        case 5:
          link("https://www.youtube.com/watch?v=SyimUCBIo6c&ab_channel=Jensen"); //Funktion
          break;
        }
      }
    }
  }
  public void gameOverB() {
    if  (mouseX>width/1.88f-sizebutton/1.4f && mouseX<width/1.88f+sizebutton-sizebutton/1.4f &&    
      mouseY>height/1.5f-sizebutton/7 && mouseY<(height/1.5f+sizebutton/3)-sizebutton/7) {   //Ændre hvad height er divideret for fremtide knapper
      gameState = 0; //Funktion
    }
    if  (mouseX>width/1.88f-sizebutton/1.4f && mouseX<width/1.88f+sizebutton-sizebutton/1.4f &&    
      mouseY>height/1.9f-sizebutton/7 && mouseY<(height/1.9f+sizebutton/3)-sizebutton/7) { 
      heartContainer1.show = 255;
      heartContainer2.show = 255;
      switch(lastLevel) {

      case 1:
        gameState = 3;
        break;

      case 2:
        gameState = 4;
        break;

      case 3:
        gameState = 5;
        break;
        
       case 4:
        gameState = 6;
        break;
        
        case 5:
        gameState = 7;
        break;
        
        case 6:
        gameState = 8;
        break;
        
        case 7:
        gameState = 9;
        break;
        
        case 8:
        gameState = 10;
        break;
        
        case 9:
        gameState = 11;
        break;
        
        case 10:
        gameState = 12;
        break;
      }
    }
  }
   public void controlScreenB() {   

    if  (mouseX>width/1.88f-sizebutton/1.4f && mouseX<width/1.88f+sizebutton-sizebutton/1.4f &&    
      mouseY>height/1.10f-sizebutton/7 && mouseY<(height/1.10f+sizebutton/3)-sizebutton/7) {   
     gameState = 0;
    }
   }
}
class CheckPoint {

  PVector position;
  Float cLength, cHeight;

  CheckPoint (PVector position, float cLength, float cHeight) {
    this.position = position;
    this.cLength = cLength;
    this.cHeight = cHeight;
  }  

  public boolean contains(PVector p) {
    if (p.x >= position.x - cLength / 2 - 25 && p.x <= position.x + cLength / 2 + 25 && p.y <= position.y + cHeight / 2 && p.y >= position.y - cHeight/2 - 25) {
      return true;
    } else {
      return false;
    }
  }



  public void update() {        
    if (contains(player.position)) {
      gameStateManager.clearScreen();
      player.position.x = width / 11;
      player.position.y = height - 50;
      gameState += 1;
      //ddddddddddddgameStateManager.nextSpawnTime = 0;
      heartContainer1.show = 255;
      heartContainer2.show = 255;
    }
  }

  public void display() {
    pushMatrix();
    translate(position.x, position.y);
    stroke(1);
    fill(0, 255, 0);
    quad(-cLength / 2, cHeight / 2 - cHeight / 2, 0, cHeight - cHeight / 2, cLength / 2, cHeight / 2 - cHeight / 2, 0, -cHeight / 2);
    popMatrix();
  }

  public void run() {
    update();
    display();
  }
}


class Enemy {
  PVector position;
  PVector velocity = new PVector();
  float size, theta;
  float enemySpeed, health, attackRate;

  Enemy(PVector position, float size, float enemySpeed, float health) {
    this.position = position;
    this.size = size;
    this.enemySpeed = enemySpeed;
    this.health = health;
  }

  public void update() {    
    attackRate = sin(frameCount / 30);
        
    tracker(); //leder efter player 

    if (attackRate < -0.2f){
      velocity.mult(0);
    }
    
    position.add(velocity);
  }

  public void display() {
    pushMatrix();
    translate(position.x, position.y);
    fill(3*health+150, 0, 0);
    rect(0, 0, size, size, size / 8, size / 8, size / 8, size / 8);
    fill(100,100,100, health);
    
    line(15, -15, 35, -25 );
    fill(100,100,100, health);
    line(-15, -15, -35, -25 );
    fill(100,100,100, health);
    line(15,10,-15,10);
   
    
    popMatrix();
  }

  public void tracker() {
    theta = atan2(position.y-player.position.y, position.x-player.position.x) + PI;

      velocity = new PVector(cos(theta)*enemySpeed, sin(theta)*enemySpeed);
  }

  public void run() {
    update();
    display();
  }
}

class ShooterEnemy {

  PVector position;
  float size, theta, health, attackRate, nextAttackTime;
  float dir = 1;
  public ArrayList<Bullet> bullets;

  ShooterEnemy(PVector position, float size, float health, float attackRate, float nextAttackTime) {
    this.position = position;
    this.size = size;
    this.health = health;
    this.attackRate = attackRate;
    this.nextAttackTime = nextAttackTime;
    bullets = new ArrayList<Bullet>();
  }

  public void shoot() {
    pushMatrix();
    translate(position.x, position.y);
    bullets.add(new Bullet(new PVector(35*cos(theta)+position.x, 35*sin(theta)+position.y), theta, 10, dir));
    popMatrix();
  }

  public void update() {

    for (int i = bullets.size()-1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      b.run();
      //c.velocity = new PVector(cos(angle)*5, sin(angle*5));
      if (b.isDead()) {
        bullets.remove(i);
      }
      if (dist(player.position.x, player.position.y, b.position.x, b.position.y)<35) {
        bullets.remove(i);
        player.health -= 10;
        damageTaken += 10;
        fdeathN = random(1,5);
          fdeathN += 0.5f;
          deathN  = (int) fdeathN;
          
          switch(deathN) { //Virker ikke ordenligt der er et delay
            case 1:
          death1.play();
          break;
          
          case 2:
          death2.play();
          break;
          
          case 3:
          death3.play();
          break;
          
          case 4:
          death4.play();
          break;
          
          case 5:
          death5.play();
          break;
          }
      }
    }

    //if(player.position.x < position.x) dir = -1;
    //if(player.position.x > position.x) dir = 1;

    theta = atan2(position.y-player.position.y, position.x-player.position.x) + PI;

    if (frameCount >= nextAttackTime) {
      shoot();
      nextAttackTime = frameCount + attackRate;
    }
  }

  public void display() {
    pushMatrix();
    translate(position.x, position.y);

    fill(3*health+100, 0, 3*health+100);
    rect(0, 0, size, size, size / 5, size / 5, size / 5, size / 5);
    
    rotate(theta);
    fill(90, 0, 90);
    rect(0, 0, 3*size/2, 10);
     
    popMatrix();
  }

  public void run() {
    display();
    update();
  }
}
class EnemyHandler {
  public void setupEnemies() {
    enemies = new ArrayList<Enemy>();
    shooterEnemies = new ArrayList<ShooterEnemy>();
  }

  public void update() {
    for (int i = enemies.size()-1; i >=0; i--) {
      Enemy e = enemies.get(i);
      e.run();
      if (e.health <= 0) {
        fcoins = random(pmin, pmax);
        fcoins += 0.5f;
        int coins = (int) fcoins;
        ps2 = new ParticleSystem(new PVector(e.position.x, e.position.y));
        enemies.remove(i);
        ps2.addParticle();
        totalcoins = totalcoins+coins;
        HipHopSound.play();
      }
    }

    for (int i = shooterEnemies.size()-1; i >=0; i--) {
      ShooterEnemy e = shooterEnemies.get(i);
      e.run();
      if (e.health <= 0) {
        
      fcoins = random(pmin, pmax);
        fcoins += 0.5f;
        int coins = (int) fcoins;
        ps2 = new ParticleSystem(new PVector(e.position.x, e.position.y));
        ps2.addParticle();
        totalcoins = totalcoins+coins;
        HipHopSound.play(); 
        e.position.x = 10000;
         e.health = 30;
        
        
        for (Bullet b : e.bullets) {
          if (b.isDead()) {
            shooterEnemies.remove(i);
            
        
          }
        }
        
      }
    }
  }
/*
  void addEnemy() { //Blev brugt til at teste
    if (key == 'p') {
      enemies.add(new Enemy(new PVector(random(200, width-200), random(200, height-200)), 100, 7, 50));
    }

    if (key == 'o') {
      shooterEnemies.add(new ShooterEnemy(new PVector(random(200, width - 200), random(200, height - 200)), 70, 30, 300, 300));
    }
  }*/
}
int lastLevel;
int coinloss = 20;

class GameStateManager {

  int[] spawnRate = new int[100];
  int nextSpawnTime = 0;

  public void setManagerUp() {

    spawnRate[0] = 600;
    spawnRate[1] = 1600;
    spawnRate[2] = 1200;
    spawnRate[3] = 1000;
    spawnRate[4] = 300;

    gameStateManager.setupLevel1();
    gameStateManager.setupLevel2();
    gameStateManager.setupLevel3();
    gameStateManager.setupLevel4();
    gameStateManager.setupLevel5();
    gameStateManager.setupLevel6();
    gameStateManager.setupLevel7();
    gameStateManager.setupLevel8();
    gameStateManager.setupLevel9();
    gameStateManager.setupLevel10();
  }

  public void manage() {

    checkPlayerDeath();

    switch(gameState) {
    case 0:
      menuScreen();
      break;

    case 1:
      gameOverScreen();
      break;

    case 2:
      controlScreen();
      break;

    case 3:
      runLevel1();
      break;

    case 4:
      runLevel2();
      break;

    case 5:
      runLevel3();
      break;

    case 6:
      runLevel4();
      break;

    case 7:
      runLevel5();
      break;

    case 8:
      runLevel6();
      break;

    case 9:
      runLevel7();
      break;

    case 10:
      runLevel8();
      break;

    case 11:
      runLevel9();
      break;

    case 12:
      runLevel10();
      break;

    default:
      gameState = 0;
      break;
    }
  }

  public void levelPrefab() {
    background(background);
    lifeManager.run();
    player.run();
    platformHandler.update();
    enemyHandler.update();
    ps1.run();
    ps2.run();
    checkPoint.run();
    // HeartContainer.run();

    fill(255, 215, 0);
    text(totalcoins+" $", width-300, 50);
  }

  public void clearScreen() {
    enemies.clear();
    player.bullets.clear();
    for (ShooterEnemy s : shooterEnemies) {
      s.bullets.clear();
    }
    shooterEnemies.clear();
    particles.clear();
    player.health = 100 - damageTaken;
    player.position = new PVector(width / 10, height - 60);
  }
  public void controlScreen() {
    clearScreen();   
    background(backgroundControl);
    fill(0, 0, 0);
    textSize(50);
    textAlign(CENTER);
    //text("PLATFORM SHOOTER 2D", width / 2, height / 4);

    fill(255, 255, 0);
    textSize(40);
    text("Balance:" + totalcoins + "$", width/1.15f, height / 9);

    But7 = new Button(width/1.88f, height/1.10f, 100, "Back", color(100, 100, 100));
    if (But1.visible) But7.show();
  }

  public void menuScreen() {
    clearScreen();
    background(background);
    fill(0, 0, 0);
    textSize(50);
    textAlign(CENTER);
    text("PLATFORM SHOOTER 2D", width / 2, height / 4);
    fill(255, 255, 0);
    textSize(40);
    text("Balance:" + totalcoins + "$", width/1.15f, height / 9);
    textSize(30);
    text("Cost: 69$", width/1.09f, height / 1.11f);
    damageTaken = 0;
    But1 = new Button(width/1.88f, height/1.5f, 100, "Lore", color(100, 100, 100));
    if (But1.visible) But1.show();

    But2 = new Button(width/1.88f, height/1.25f, 100, "Controls", color(100, 100, 100));
    if (But1.visible) But2.show();

    But3 = new Button(width/1.88f, height/1.9f, 100, "Play", color(100, 100, 100));
    if (But1.visible) But3.show();

    But6 = new Button(width/1.05f, height/1.05f, 100, "Cheese", color(255, 255, 0));
    if (But1.visible) But6.show();
  }
  public void gameOverScreen() {
    clearScreen();  
    background(255);
    fill(0, 0, 0);
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER", width / 2, height / 2.5f);
    //textSize(40);
    //text("", width / 2, height / 2 - 50);
    damageTaken = 0;
    But4= new Button(width/1.88f, height/1.9f, 100, "Continue", color(100, 100, 100));
    if (gameState == 1) But4.show();

    But5= new Button(width/1.88f, height/1.5f, 100, "Menu", color(100, 100, 100));
    if (But4.visible) But5.show();
    /*
    text("press Space to play again", width/2, height / 2 );
     
     if (keyPressed && key == ' ') {
     gameState -= 1;
     }*/    //No longer in use
    delay(1000);
  }

  public void checkPlayerDeath() {
    if (player.health <= 0) {
      player.health = 100;
      gameState = 1;
      if (totalcoins > coinloss) {
        totalcoins -= coinloss;
      } else {
        totalcoins = 0;
      }
    }
  }


  public void setupLevel1() {
    player = new Player(new PVector(width / 10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    heartContainer1 = new HeartContainer(new PVector(300, 100), 60);
    enemies.clear();
    shooterEnemies.clear();
  }

  public void runLevel1() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width*3/8, 3*height/4), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*5/8, height / 2), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*3/8, height/4), width*3/4, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    levelPrefab();
    heartContainer1.run();
    lastLevel = 1;

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*1/8), 70, 30, 300, 300));
        shooterEnemies.add(new ShooterEnemy(new PVector(width*1/8, height/2), 70, 30, 300, 300));
        //shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*7/8), 70, 30, 300, 300));
        nextSpawnTime = frameCount + spawnRate[0];
      }
    }
  }


  public void setupLevel2() {
    player = new Player(new PVector(width / 10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  public void runLevel2() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width*4/8, 3*height/4), width/8, 30));
    platforms.add(new Platform(new PVector(width*6/8, height / 2), width/8, 30));
    platforms.add(new Platform(new PVector(width*3/16, height/4), width*3/8, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    lastLevel = 2;
    levelPrefab();

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*1/8), 70, 30, 300, 300));
        //shooterEnemies.add(new ShooterEnemy(new PVector(width*1/8, height*3/8), 70, 30, 300, 300));
        nextSpawnTime = frameCount + spawnRate[0];
      }
    } else if (shooterEnemies.size() > 1) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  public void setupLevel3() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  public void runLevel3() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width*6/8, 3*height/4), width/8, 30));
    platforms.add(new Platform(new PVector(width*4/8, height / 2), width/8, 30));
    platforms.add(new Platform(new PVector(width*1/16, height/4), width*2/8, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    levelPrefab();
    lastLevel = 3;

    if (enemies.size()==0 && frameCount%500==0) {
      enemies.clear();
      enemies.add(new Enemy(new PVector(width*1/8, height*1/8), 100, 5, 50));
      //enemies.add(new Enemy(new PVector(width*1/8, height*7/8), 100, 7, 50));
    }

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*1/8), 70, 30, 300, 300));
        shooterEnemies.add(new ShooterEnemy(new PVector(width*1/8, height*3/8), 70, 30, 300, 300));
        //shooterEnemies.add(new ShooterEnemy(new PVector(width*1/4, height*1/8), 70, 30, 300, 300));
        nextSpawnTime = frameCount + spawnRate[0];
      }
    } else if (shooterEnemies.size() < 2) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
    //println(nextSpawnTime);
  }

  public void setupLevel4() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  public void runLevel4() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width/3+17, height/2), width/3, 30));
    platforms.add(new Platform(new PVector(0, height*3/4), width/8, 30));
    platforms.add(new Platform(new PVector(width*3/16, height*3/4+15), 20, 30*12));
    platforms.add(new Platform(new PVector(width*3/8, height/4), width*6/8, 30));
    platforms.add(new Platform(new PVector(width*13/16, height*3/4), width/8, 30));
    platforms.add(new Platform(new PVector(width*15/16, height/2), width/8, 30));
    platforms.add(new Platform(new PVector(width*6/8-10, height/2+15), 20, 30*12));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    levelPrefab();
    lastLevel = 4;

    if (enemies.size()==0 && frameCount%600==0) {
      enemies.clear();
      enemies.add(new Enemy(new PVector(width*1/4, height*7/8), 100, 4, 50));
    }

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 3) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*1/8), 70, 30, 500, 300));
        //shooterEnemies.add(new ShooterEnemy(new PVector(width*1/4, height*5/8), 70, 30, 500, 300));
        nextSpawnTime = frameCount + spawnRate[3];
      }
    } else if (shooterEnemies.size() > 1) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  public void setupLevel5() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  public void runLevel5() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width* 7/8, height*2/3), width/4, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*8, height*2/3+31), 80, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*7, height*2/3+62), 80, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*6, height*2/3+93), 80, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*5, height*2/3+93+31), 80, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*4, height*2/3+93+62), 80, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*3, height*2/3+93+93), 80, 30));
    platforms.add(new Platform(new PVector(width*7/32+80*2, height*2/3+93+93+31), 80, 30));
    platforms.add(new Platform(new PVector(width* 1/8, height*1/3), width/4, 30));
    platforms.add(new Platform(new PVector(width*25/32-80*8, height*1/3+31*1), 80, 30));
    platforms.add(new Platform(new PVector(width*25/32-80*7, height*1/3+31*2), 80, 30));
    platforms.add(new Platform(new PVector(width*25/32-80*6, height*1/3+31*3), 80, 30));
    platforms.add(new Platform(new PVector(width*25/32-80*5, height*1/3+31*4), 80, 30));
    platforms.add(new Platform(new PVector(width/4+40, height*1/3+31*5), width/2+40*2, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 120);
    lastLevel = 5;
    levelPrefab();

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width*7/8, height*7/8), 70, 30, 200, 300));
        shooterEnemies.add(new ShooterEnemy(new PVector(width*1/8, height*7/16), 70, 30, 200, 300));
        nextSpawnTime = frameCount + spawnRate[0];
      }
    } else if (shooterEnemies.size() < 2) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  public void setupLevel6() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(width-100, height-100), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  public void runLevel6() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width/2, height*13/16), width/16, height*5/16));
    checkPoint = new CheckPoint(new PVector(width-100, height-100), 80, 120);
    levelPrefab();
    lastLevel = 6;

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width, 0), 70, 30, 20, 100));
        shooterEnemies.add(new ShooterEnemy(new PVector(0, 0), 70, 30, 20, 100));
        shooterEnemies.add(new ShooterEnemy(new PVector(width/2, 0), 70, 30, 20, 100));
        nextSpawnTime = frameCount + spawnRate[1];
      }
    } else if (shooterEnemies.size() < 3) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  public void setupLevel7() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(width-100, height-100), 80, 120);
    heartContainer2 = new HeartContainer(new PVector(550, 550), 60);
    enemies.clear();
    shooterEnemies.clear();
  }

  public void runLevel7() {
    platforms.clear();
    lastLevel = 7;

    platforms.add(new Platform(new PVector(0, height*3/4), width/8, 30));
    platforms.add(new Platform(new PVector(width*2/16-20, height*10/16), 30, 30));
    platforms.add(new Platform(new PVector(width*3/16+30, height*12/16+20), 30, 30));
    platforms.add(new Platform(new PVector(width*5/16-45, height*10/16-10), 95, 30));
    platforms.add(new Platform(new PVector(width*2/16+82, height*1/2+150), 30, 30*9));
    platforms.add(new Platform(new PVector(0, height*2/4-20), width/8+40, 30));
    platforms.add(new Platform(new PVector(width/2-2, height/2+210), 30, 30*3));
    platforms.add(new Platform(new PVector(width*9/16, height-60), 30, 30*5));
    platforms.add(new Platform(new PVector(width*10/16, height-130), 30, 30*4));
    platforms.add(new Platform(new PVector(width*11/16, height-60), 30, 30*5));
    platforms.add(new Platform(new PVector(width*12/16, height-130), 30, 30*4));
    platforms.add(new Platform(new PVector(width*13/16, height-60), 30, 30*5-20));
    platforms.add(new Platform(new PVector(width*14/16, height-130), 30, 30*4));
    platforms.add(new Platform(new PVector(width/2+100, height/2+110), 30, 30*3));
    platforms.add(new Platform(new PVector(width/2-50, height/2+110), 30, 30*3));
    platforms.add(new Platform(new PVector(width/2-250, height/2+110), 30, 30*3));
    platforms.add(new Platform(new PVector(width/2-150, height/2+50), 30, 30*3));
    platforms.add(new Platform(new PVector(width/2+100, height/2-45), 30, 30*3));
    platforms.add(new Platform(new PVector(width*8/16+7, height*2/3+40), width*7/16+40, 30));
    platforms.add(new Platform(new PVector(width*6/16-40, height/2), width/3, 30));
    platforms.add(new Platform(new PVector(width*6/16-40, height*14/16), width/3, 30));
    platforms.add(new Platform(new PVector(width*2/16, height*3/4+15), 30, 30*19));
    platforms.add(new Platform(new PVector(width*3/8, height/4), width*6/8, 30));
    platforms.add(new Platform(new PVector(width/2+100, height/2-45), 30, 30*3));
    platforms.add(new Platform(new PVector(width*13/16+5, height*3/4-10), width/8+20, 30));
    platforms.add(new Platform(new PVector(width*15/16, height/2), width/8, 30));
    platforms.add(new Platform(new PVector(width*6/8-10, height/2-5), 30, 30*12+20));
    platforms.add(new Platform(new PVector(width*7/16-90, height/2-100), width*2/3-20, 30));
    checkPoint = new CheckPoint(new PVector(100, 100), 80, 119);
    levelPrefab();
    heartContainer2.run();
    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        //shooterEnemies.add(new ShooterEnemy(new PVector(width, 0), 70, 30, 10, 100));
        //shooterEnemies.add(new ShooterEnemy(new PVector(0, 0), 70, 30, 10, 100));
        nextSpawnTime = frameCount + spawnRate[1];
      }
    } else if (shooterEnemies.size() > 1) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  public void setupLevel8() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(width-100, height-100), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  public void runLevel8() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width*5/8+40, height*2/16+15), width/4, 30));
    platforms.add(new Platform(new PVector(width*5/8+40, height*11/16+15), width/4, 30));
    platforms.add(new Platform(new PVector(width*7/8, height*7/16), width/4, 30));
    platforms.add(new Platform(new PVector(width/2, height*13/16), width/16, height*5/16+40));
    platforms.add(new Platform(new PVector(width/2+width/16, height*9/16), width/16, height*7/8));
    platforms.add(new Platform(new PVector(width/4, height*5/16), width/8, 30));
    checkPoint = new CheckPoint(new PVector(width-100, height-100), 80, 120);
    levelPrefab();
    lastLevel = 8;

    if (enemies.size()==0 && frameCount%360==0) {
      enemies.clear();
      enemies.add(new Enemy(new PVector(width*1/4, height*7/8), 100, 4, 50));
    }

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width-150, 150), 70, 30, 200, 100));
        nextSpawnTime = frameCount + spawnRate[1];
      }
    } else if (shooterEnemies.size() < 1) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  public void setupLevel9() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(width/2, height/2), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  public void runLevel9() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width/2, height-50), width*3/4, 30));
    platforms.add(new Platform(new PVector(width*7/8-45, height*2/3-50), width/32, 30));
    platforms.add(new Platform(new PVector(width*7/8-15, height/2+3), 30, height*13/16));
    platforms.add(new Platform(new PVector(width*11/16+15, height/2), 30, height*7/16));
    platforms.add(new Platform(new PVector(width*3/8+70, height*2/3+26), width*9/16, 30));
    platforms.add(new Platform(new PVector(width*15/32+70, height/3-23), width*6/16, 30));
    platforms.add(new Platform(new PVector(width*1/8+15, height/2-height*3/32+3), 30, height*10/16));
    platforms.add(new Platform(new PVector(width/2, 70), width*3/4, 30));
    checkPoint = new CheckPoint(new PVector(width/2, height/2), 80, 120);
    levelPrefab();
    lastLevel = 9;

    //if (enemies.size()==0 && frameCount%360==0) {
    //  enemies.clear();
    //  enemies.add(new Enemy(new PVector(width*1/4, height*7/8), 100, 4, 50));
    //}

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width-100, 150), 70, 30, 200, 100));
        shooterEnemies.add(new ShooterEnemy(new PVector(100, 150), 70, 30, 200, 100));
        nextSpawnTime = frameCount + spawnRate[1];
      }
    } else if (shooterEnemies.size() < 1) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }

  public void setupLevel10() {
    player = new Player(new PVector(width/10, height - 60), 10, 1, 100);
    checkPoint = new CheckPoint(new PVector(50, 70), 80, 120);
    enemies.clear();
    shooterEnemies.clear();
  }

  public void runLevel10() {
    platforms.clear();
    platforms.add(new Platform(new PVector(width/4+15, height*3/4), width/16, height/2));
    platforms.add(new Platform(new PVector(width/4+15, height*7/8), width/16+60, height/4));
    platforms.add(new Platform(new PVector(width*2/3+15, height*3/4), width/12-30, height/2));
    platforms.add(new Platform(new PVector(width*8/9, height*3/12), width/12+60, 30));  
    platforms.add(new Platform(new PVector(width*4/9, height*1/9), width*6/9, 30));
    platforms.add(new Platform(new PVector(width*1/9, height*1/7+3), 30, 80));
    platforms.add(new Platform(new PVector(width*1/16-1, height*1/5+16), width*1/8-4, 30));
    platforms.add(new Platform(new PVector(width*2/3+15, height*7/8), width/12+31, height/4));
    checkPoint = new CheckPoint(new PVector(50, 70), 80, 120);
    levelPrefab();
    lastLevel = 10;

    //if (enemies.size()==0 && frameCount%360==0) {
    //  enemies.clear();
    //  enemies.add(new Enemy(new PVector(width*1/4, height*7/8), 100, 4, 50));
    //}

    if (frameCount >= nextSpawnTime) {
      if (shooterEnemies.size() >= 0 && shooterEnemies.size() <= 2) {
        for (ShooterEnemy s : shooterEnemies) {
          s.health = 30;
        }
        shooterEnemies.clear();
        shooterEnemies.add(new ShooterEnemy(new PVector(width-80, height-60), 70, 30, 200, 100));
        shooterEnemies.add(new ShooterEnemy(new PVector(width/6, 150), 70, 30, 200, 100));
        nextSpawnTime = frameCount + spawnRate[1];
      }
    } else if (shooterEnemies.size() < 1) {
      shooterEnemies.clear();
      nextSpawnTime = 0;
    }
  }
}
class HeartContainer {

  public void setContainerUp(){
    show = 255;
  }
  
  int show = 255;
  PVector position;
  Float hCsize;
  
  HeartContainer (PVector position, float hCsize) {
    this.position = position;
    this.hCsize = hCsize;

  }

 public boolean isOn(PVector p) {
    if (p.x >= position.x - 25 && p.x <= position.x +  hCsize + 25 && p.y <= position.y + hCsize + 25 && p.y >= position.y) {
      return true;
    } else {
      return false;
    }
  }

  public void update() {        
    if(isOn(player.position) && show > 0){
    damageTaken = 0;
    player.health = 100;
    //position.x = 10000;
    show = 0;
    }
    
  }

  public void display() {
  pushMatrix();
  rectMode(CORNER);

  translate(position.x, position.y);
  stroke(1);
  
  if (show <= 0) noStroke();
  
  fill(155, 150, 155, show);
  rect(0,0,hCsize,hCsize, hCsize/3.5f, hCsize/3.5f, hCsize/3.5f, hCsize/3.5f);
  
  fill(255, 200, 255, show);
  ellipse(hCsize/2,hCsize/2,hCsize,hCsize);

  fill(155, 150, 155, show);
  rect(hCsize/2.5f,0,hCsize/6,hCsize);
  rect(0,hCsize/2.5f,hCsize,hCsize/6);
  
  fill(255, 200, 255, show);
  ellipse(hCsize/2,hCsize/2,hCsize/1.2f,hCsize/1.2f);
  
  noStroke();  
  fill(255,0,0, show);
  ellipse(hCsize/3,hCsize/2.5f,hCsize/3,hCsize/3);
  ellipse(hCsize/1.5f,hCsize/2.5f,hCsize/3,hCsize/3);  
  ellipse(hCsize/2,hCsize/1.764f,hCsize/3,hCsize/3);
  triangle(hCsize/5.714f,hCsize/2.143f, hCsize/2, hCsize/1.2f, hCsize/1.2121f, hCsize/2.143f);
  stroke(1);
  popMatrix();

  }

  public void run() {
    update();
    display();
  }
}
int pmin = 5;
int pmax = 20;
float fcoins;
int coins;
int totalcoins = 0;
ParticleSystem ps1, ps2;


class ParticleSystem {
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.get();
    particles = new ArrayList<Particle>();
    blood = new ArrayList<Blood>();
  }

  public void addParticle() {

    for (int i = 0; i < fcoins; i++) {
        
        particles.add(new Particle(origin));
    }

  }
  public void addBlood() {
  for (int i = 0; i < 10; i++) {
        
        blood.add(new Blood(origin));
    }
  }
  public void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
class Platform {
  PVector position;
  float pLength;
  float pHeight;
  boolean isOn = false;

  Platform(PVector position, float pLength, float pHeight) {
    this.position = position;
    this.pLength = pLength;
    this.pHeight = pHeight;
  }

  public boolean isOn(PVector p) {
    if (p.x >= position.x - pLength / 2 - 10 && p.x <= position.x + pLength / 2 + 10 && p.y >= position.y - pHeight / 2 - 25 && p.y <= position.y + pHeight / 2) {
      return true;
    } else {
      return false;
    }
  }

  public boolean isOver(PVector p) {
    if (p.x >= position.x - pLength / 2 - 10 && p.x <= position.x + pLength / 2 + 10 && p.y <= position.y + pHeight / 2 + 25 && p.y >= position.y) {
      return true;
    } else {
      return false;
    }
  }
  
  public boolean isLeft(PVector p){
    if (p.x <= position.x + pLength / 2 + 25 && p.x >= position.x && p.y <= position.y + pHeight / 2 && p.y >= position.y - pHeight / 2){
      return true;
    } else {
      return false;
    }
  }
  
    public boolean isRight(PVector p){
    if (p.x >= position.x - pLength / 2 - 25 && p.x <= position.x && p.y <= position.y + pHeight/2 && p.y >= position.y - pHeight/2){
      return true;
    } else {
      return false;
    }
  }

  public void display() {
    pushMatrix();
    translate(position.x, position.y);
    stroke(1);
    fill(165, 155, 130);
    rect(0, 0, pLength, pHeight);
    popMatrix();
  }

  public void run() {
    display();
  }
}
class PlatformHandler {
  public void setupPlatforms() {
    platforms = new ArrayList<Platform>();
  }

  public void update() {
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
class Player {

  PVector position;
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector();
  PVector gravity = new PVector(0, 2);
  PVector jumpForce = new PVector(0, -100);
  float theta, health, mass, dir;
  float speed = 4;
  float nextAttackTime = 0;
  float attackRate = 10;
  boolean grounded = false;
  boolean right, left, jump, sprint, shoot;
  ArrayList<Bullet> bullets;

  Player(PVector position, float mass, float theta, float health) {
    this.position = position;
    this.theta = theta;
    this.health = health;
    this.mass = mass;
    bullets = new ArrayList<Bullet>();
  }

  public boolean grounded(PVector p) {
    return(p.x >= width && p.x <= width && p.y >= height && p.y <= height);
  }

  public void keyPress() {
    if (key == 'a' || key == 'A') left = true;
    if (key == 'd' || key == 'D') right = true;
    if (key == ' ') jump = true;
    if (keyCode == SHIFT) sprint = !sprint;
  }

  public void keyRelease() {
    if (key == 'a' || key == 'A') left = false;
    if (key == 'd' || key == 'D') right = false;
    if (key == ' ') jump = false;
    //if (keyCode == SHIFT) sprint = false;
  }

  public void mousePress() {
    if (mouseButton == LEFT) shoot = true;
  }
  public void mouseRelease() {
    if (mouseButton == LEFT) shoot = false;
  }

  public void shoot() {
    pushMatrix();
    translate(position.x, position.y);
    bullets.add(new Bullet(new PVector(35*cos(theta)+position.x, 35*sin(theta)+position.y), theta, 10, dir));
    popMatrix();
  }

  public void move() {

    if (left) {
      dir = -1;
    }
    if (right) {
      dir = 1;
    }

    if (jump) {
      if (grounded) {
        grounded = false;
        applyForce(jumpForce);
      }
    }

    if (sprint) {
      speed = 10;
    } else {
      speed = 4;
    }

    if (frameCount >= nextAttackTime) {
      if (shoot) {
        shoot();
        nextAttackTime = frameCount + attackRate;
      }
    }
  }

  public void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  public void update() {
    for (int i = bullets.size()-1; i >= 0; i--) {
        Bullet b = bullets.get(i);
        b.run();
        //c.velocity = new PVector(cos(angle)*5, sin(angle*5));
        if (b.isDead()) {
          bullets.remove(i);
        }

        for (Enemy e : enemies) {

          if (dist(b.position.x, b.position.y, e.position.x, e.position.y)<e.size/2) {
            bullets.remove(i);
            e.health -= 10;
          }
        }


        for (ShooterEnemy e : shooterEnemies) {

          if (dist(b.position.x, b.position.y, e.position.x, e.position.y)<e.size/2) {
            bullets.remove(i);
            e.health -= 10;
          }
        }
    }



    theta = atan2(position.y-mouseY, position.x-mouseX) + PI;

    move();

    if (position.x == 25 || position.x < 25) {
      velocity.x = 0;
      position.x = 25;
    }
    if (position.x >= width - 25) {
      velocity.x = 0;
      position.x = width - 25;
    }

    if (grounded) {
      gravity.y = 0;
    } else {
      gravity.y = 2;
    }

    applyForce(gravity);

    velocity.x = velocity.x + dir*speed;
    velocity.add(acceleration);
    position.add(velocity);

    dir = 0;

    if (position.y >= height - 50) {
      velocity.y = velocity.y*0;
      grounded = true;
    }
    velocity.x = 0;
    acceleration.mult(0);
  }

  public void display() {
    pushMatrix();
    translate(position.x, position.y);
    fill(0, 0, 255);
    rectMode(CENTER);
    ellipseMode(CENTER);

    rect(0, 0, 50, 50, 8, 8, 8, 8);

    fill(200, 200, 200);
    ellipse(0, 0, 35, 35);
    fill(0, 0, 255);
    ellipse(0, 0, 27, 27);
    fill(0, 0, 100);
    ellipse(0, 0, 20, 20);

    rotate(theta);
    fill(0, 0, 150);
    rect(0, 0, 70, 10);

    popMatrix();
  }

  public void run() {
    display();
    update();
  }
}
//Script fungere ikke sammen med andre particler på skærmen

class Blood extends Particle {

  Blood(PVector l) {
    super(l);
  }

   public void display() {
    fill(255, 0, 0  , lifespan); //RGB code og synlighed
    
    ellipse(position.x, position.y, 20,20);
  }
}
float fdeathN;
int deathN;
int damageTaken = 0;

class LifeManager {

  float attackRate = 120f;
  float nextAttackTime = attackRate;

  public void update() {

    for (Enemy e : enemies) { 
      if (frameCount >= nextAttackTime) {
        if (dist(player.position.x, player.position.y, e.position.x, e.position.y)<e.size/2+25) {
          e.health = 0;
          player.health -= 10;
          damageTaken += 10;
          nextAttackTime += attackRate;
          ps1 = new ParticleSystem(new PVector(player.position.x,player.position.y));
         // ps1.addBlood();
          fdeathN = random(1,5);
          fdeathN = fdeathN + 0.5f;
          deathN  = (int) fdeathN;
          
          switch(deathN) { //Virker ikke ordenligt der er et delay
            case 1:
          death1.play();
          break;
          
          case 2:
          death2.play();
          break;
          
          case 3:
          death3.play();
          break;
          
          case 4:
          death4.play();
          break;
          
          case 5:
          death5.play();
          break;
          }
        }
      }
    }
  }

  public void display() {
    pushMatrix();
    rectMode(CORNER);
    fill(0, 0, 0);
    rect(width - width/2, height/32, 2*104, 2*14);
    fill(255, 0, 0);
    rect(width - width/2+4, height/32+4, 2*player.health, 2*10);
    popMatrix();
    //text(str(playerHealth), width/16, height/32, 9999, 9999);
  }

  public void run() {
    update();
    display();
  }
}
//int colorcode=215;

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(PVector l) {
    acceleration = new PVector(0, 0.05f);
    velocity = new PVector(random(-10, 10), random(-10, 0));
    position = l.get();
    lifespan = 255.0f;
  }

  public void run() {
    update();
    display();
  }

  //Opdater livet
  public void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 10.0f;
  }

  // Method til display
  public void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(255, 215, 0  , lifespan); //RGB code og synlighed
    
    ellipse(position.x, position.y, random(3,20),random(3,20));
  }

  //Fjerner døde partikler
  public boolean isDead() {
    if (lifespan < 0.0f) {
      return true;
    } else {
      return false;
    }
  }
}
  public void settings() {  size(1280, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Platformer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
