boolean[] movement = new boolean[4];
//CarbotMarine.png
//BossImage.png
//EnemySprite.png
Player Player1;
ButtonUI b1,b2;
EnemyMob[] Enemies = new EnemyMob[2000];
PImage background;


public void setup() {
  frameRate(60);
  //fullScreen();
  size(1000,750);
  System.out.println(width/2);
  System.out.println(height/2);
  background = loadImage("Ground.png", "png");
  //Check
  combatUI();
  Player1 = new Player(new int[] {0,10},new int[] {100,100},476,255);
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

  translate(x-Player1.getX(),y-Player1.getY()); 
  
  for (EnemyMob Enemy : Enemies) {
    int boundsLeft = Player1.getX() - (width/2)-30;
    int boundsRight = Player1.getX() + (width/2)+30;
    int boundsTop = Player1.getY() - (height/2)-30;
    int boundsBottom = Player1.getY() + (height/2)+30;
      if (Enemy.getX() >= boundsLeft && Enemy.getX() <= boundsRight && Enemy.getY() <= boundsBottom && Enemy.getY() >= boundsTop) {
        if (Enemy.isAlive() == true) {
          Enemy.randomMovement();
          Enemy.draw();
          if (Enemy.getX() == Player1.getX() && Enemy.getY() == Player1.getY()) {
           System.out.println("test"); 
          }
        }
     }
  }
  
  if (Player1.isAlive() == true) {
    Player1.move(movement);
    Player1.draw();
  }
  b1.draw();
  b2.draw();
}

public void combatUI() {
  b1 = new ButtonUI(100,20,100,100,"One",#F0000F);
  b2 = new ButtonUI(500,130,200,75,"Two",#00CC22);
}

public void mouseReleased() {
  int x = (width/2)-30;
  int y = (height/2)-30;
  if (b1.isClicked(Player1.getX(),Player1.getY(),x,y)) {
    println("one clicked");
  }
  if (b2.isClicked(Player1.getX(),Player1.getY(),x,y)) {
    println(b2.title);
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
