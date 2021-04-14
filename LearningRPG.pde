boolean[] movement = new boolean[4];
//CarbotMarine.png
//BossImage.png
//EnemySprite.png
Player test = new Player(new int[] {100,100},new int[] {0,10});

public void setup() {
  frameRate(30);
  //1042,600
  size(1042,600);
  //fullScreen();
}

public void draw() {
  background(loadImage("Ground2.png"));
  //image(loadImage("Ground.png", "png"),0,0,pixelHeight*1.75,pixelWidth);
  test.draw();
  test.move(movement);
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
