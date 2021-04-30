public class Biome {
 String biomeImage;
 int x,y,sizeX,sizeY;
 public Biome(String biomeImage, int x, int y, int sizeX, int sizeY) {
   this.biomeImage = biomeImage;
   this.x = x;
   this.y = y;
   this.sizeX = sizeX;
   this.sizeY = sizeY;
 }
  
  public void move(boolean[] direction,int SPD) {
    if (direction[0] == true) {//w
      this.y = this.y+SPD;
    }
    if (direction[1] == true) {//a
      this.x = this.x+SPD;
    }
    if (direction[2] == true) {//s
      this.y = this.y-SPD; 
    }
    if (direction[3] == true) {//d
      this.x = this.x-SPD;
    }
  }
  
  public void mobsInside(EnemyMob enemy,int biome) {
   int boundsLeft = this.x - 750;
   int boundsRight = this.x + 750;
   int boundsTop = this.y - 750;
   int boundsBottom = this.y + 750;
   if (enemy.getX() >= boundsLeft && enemy.getX() <= boundsRight && enemy.getY() <= boundsBottom && enemy.getY() >= boundsTop) {
     if (biome == 1) {
      enemy.changeName("Zergling");
      enemy.changeMobImage("CarbotZergling.png");
      enemy.changeLvl((int) random(5,1));
      enemy.changeHP((int) random(350,100));
     }
   }
  }
  
  public void draw() {
   image(loadImage(this.biomeImage, "png"),x,y,sizeX,sizeY); 
  }
  
  public int getX() {
    return this.x;
  }
  public int getY() {
   return this.y; 
  }
}
