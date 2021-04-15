boolean[] movement = new boolean[4];
//CarbotMarine.png
//BossImage.png
//EnemySprite.png
Player Player1 = new Player(new int[] {0,10},new int[] {100,100},476,255);
ButtonUI basicButton = new ButtonUI(0,0,300,300,"defaultUI-1.png");
EnemyMob[] Enemies = new EnemyMob[2000];
PImage background;


public void setup() {
  frameRate(60);
  //fullScreen();
  size(1000,750);
  System.out.println(width/2);
  System.out.println(height/2);
  background = loadImage("Ground.png", "png");
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
  basicButton.draw();
}

void mouseReleased() {
 if (ButtonUI.interactClick()) {
   
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
