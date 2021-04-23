boolean foundEnemy = false;
EnemyMob currentEnemy;
boolean[] movement = new boolean[4];
//CarbotMarine.png
//BossImage.png
//EnemySprite.png
Player Player1;
ButtonUI Pstat,Estat,background1,background2,bottomBar;
EnemyMob[] Enemies = new EnemyMob[2000];
PImage background,Player,Enemy;


public void setup() {
  frameRate(60);
  //fullScreen();
  size(1000,750);
  System.out.println(width/2);
  System.out.println(height/2);
  background = loadImage("Ground.png", "png");
  //Check
  Player1 = new Player(new int[] {100,10},new int[] {100,100},1,0,width/2-30,height/2-30,25);
  //Check
  for (int i = 0; i<Enemies.length; i++) {
    Enemies[i] = new EnemyMob("Spider",1,new int[] {0,10},new int[] {100,100},(int) random(-width,width)*10,(int) random(-height,height)*10);
  }
  //fullScreen();
}

public void draw() {
  //background(loadImage("Ground2.png"));
  //background(200);
  image(background,0,0,width,height);
  int x = (width/2)-30;
  int y = (height/2)-30;

  //translate(x-Player1.getX(),y-Player1.getY()); 
  
  for (EnemyMob Enemy : Enemies) {
    int boundsLeft = Player1.getX() - (width/2)-30;
    int boundsRight = Player1.getX() + (width/2)+30;
    int boundsTop = Player1.getY() - (height/2)-30;
    int boundsBottom = Player1.getY() + (height/2)+30;
    if (foundEnemy == false) {
    Enemy.move(movement,Player1.getSPD());
    }
      if (Enemy.getX() >= boundsLeft && Enemy.getX() <= boundsRight && Enemy.getY() <= boundsBottom && Enemy.getY() >= boundsTop) {
        if (Enemy.isAlive() == true && foundEnemy == false) {
          Enemy.randomMovement();
          Enemy.draw();
          if (dist(Player1.getX(),Player1.getY(),Enemy.getX(),Enemy.getY()) <= (60 / 2) + (60 / 2)) {
           foundEnemy = true;
           System.out.println("test"); 
           combatUI(Enemy);
           currentEnemy = Enemy;
          }
        }
     }
  }
  //b1.move(movement);
  //b2.move(movement);
  if (Player1.isAlive() == true) {
    //Player1.move(movement);
    Player1.move(movement);
    Player1.draw();
    Player1.levelUp();
  }
  if (foundEnemy == true) {
  background1.draw();
  background2.draw();
  Pstat.draw();
  Estat.draw();
  bottomBar.draw();
  image(Player,0+25,200,150,150);
  image(Enemy,width-175,200,150,150);
  }
}

public void combatUI(EnemyMob enemy) {
  Pstat = new ButtonUI(0,0,300,125,"Player "+"Lvl: "+Player1.getLvl()+"\nXp: "+Player1.getCXP()+"/"+Player1.getMXP()+"\nHealth: "+Player1.getCHP()+"/"+Player1.getMHP(),#00b300,3);
  Estat = new ButtonUI(width-300,0,300,125,"Enemy "+"Lvl: "+enemy.getLvl()+"\nXp: "+enemy.getCXP()+"/"+enemy.getMXP()+"\nHealth: "+enemy.getCHP()+"/"+enemy.getMHP(),#e60000,2);
  background1 = new ButtonUI(0,0,width/2,height,"",#4dff4d,1);
  background2 = new ButtonUI(width-(width/2),0,width/2,height,"",#ff4d4d,1);
  Player = loadImage("CarbotMarineDR.png" , "png");
  Enemy = loadImage(enemy.getImage(), "png");
  bottomBar = new ButtonUI(0,(int)(height/1.75),width,height/2,"",#000000,1);
}

public void mouseReleased() {
  if (foundEnemy == true) {
  if (Pstat.isClicked()) {
    println(Pstat.title);
    /* kill mobs & close ui
    foundEnemy = false;
    currentEnemy.setAlive(false);
    */
  }
  if (Estat.isClicked()) {
    println(Estat.title);
    }
  }
}

public void keyReleased() {
  if (keyCode == 87 || keyCode == 38) {
    movement[0] = false;
  } else if (keyCode == 65 || keyCode == 37) {
    movement[1] = false;
  } else if (keyCode == 83 || keyCode == 40) {
    movement[2] = false;
  } else if (keyCode == 68 || keyCode == 39) {
    movement[3] = false;
  }
}

public void keyPressed() {
  if (keyCode == 87 || keyCode == 38) {
    movement[0] = true;
  } else if (keyCode == 65 || keyCode == 37) {
    movement[1] = true;
  } else if (keyCode == 83 || keyCode == 40) {
    movement[2] = true;
  } else if (keyCode == 68 || keyCode == 39) {
    movement[3] = true;
  }
}
