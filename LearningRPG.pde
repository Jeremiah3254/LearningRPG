boolean[] movement = new boolean[4];
//CarbotMarine.png
//BossImage.png
//EnemySprite.png
Entity test = new Entity("CarbotMarine.png",0,0,2,new int[] {20,20},new int[] {0,10},5);

public void setup() {
  size(500,500);
  //fullScreen();
}

public void draw() {
  background(200);
  
  test.draw();
  test.move(movement);
}

public void keyReleased() {
  if (keyCode == 87) {
    movement[0] = false;
  } else if (keyCode == 65) {
    movement[1] = false;
  } else if (keyCode == 83) {
    movement[2] = false;
  } else if (keyCode == 68) {
    movement[3] = false;
  }
}

public void keyPressed() {
  if (keyCode == 87) {
    movement[0] = true;
  } else if (keyCode == 65) {
    movement[1] = true;
  } else if (keyCode == 83) {
    movement[2] = true;
  } else if (keyCode == 68) {
    movement[3] = true;
  }
}
