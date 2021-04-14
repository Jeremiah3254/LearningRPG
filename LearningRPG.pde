boolean[] movement = new boolean[4];
//CarbotMarine.png
//BossImage.png
//EnemySprite.png
Player Player1 = new Player(new int[] {0,10},new int[] {100,100},476,255);
EnemyMob[] Enemies = new EnemyMob[20];
PImage background;

public void setup() {
  frameRate(30);
  //fullScreen();
  size(1042,600);
  background = loadImage("Ground.png", "png");
  for (int i = 0; i<Enemies.length; i++) {
    Enemies[i] = new EnemyMob("Spider",1,new int[] {0,10},new int[] {100,100},(int) random(pixelWidth*2),(int) (int) random(pixelHeight*2));
    System.out.print((int) random(50));
  }
  //fullScreen();
}

public void draw() {
  //background(loadImage("Ground2.png"));
  image(background,0,0,pixelWidth,pixelHeight);
  
  for (EnemyMob Enemy : Enemies) {
  //(Enemy.getX() < 0 && Enemy.getY() < 0 || Enemy.getY() > pixelHeight) || (Enemy.getX() > pixelWidth && Enemy.getY() < 0 || Enemy.getY() > pixelHeight)
if ((Enemy.getX() < 0 || Enemy.getX() > pixelWidth && Enemy.getY() < 0 || Enemy.getY() > pixelHeight)) {
  if (Enemy.isAlive() == true) {
   Enemy.move(movement);
   Enemy.randomMovement();
   Enemy.draw();
    }
   }
  }
  
  if (Player.isAlive() == true) {
  Player1.draw();
  //Player1.move(movement);
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
