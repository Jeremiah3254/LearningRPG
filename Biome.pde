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
   int boundsLeft = this.x;
   int boundsRight = this.x + 1500;
   int boundsTop = this.y;
   int boundsBottom = this.y + 1500;
   System.out.println(biome);
   if (enemy.getX() >= boundsLeft && enemy.getX() <= boundsRight && enemy.getY() <= boundsBottom && enemy.getY() >= boundsTop) {
     if (biome == 1) {
      System.out.println("mobFound");
      enemy.changeName("Zergling");
      enemy.changeMobImage("CarbotZergling.png");
      enemy.changeLvl((int) random(1,5));
      enemy.changeHP((int) random(100,350));
     }else if (biome == 2) {
      System.out.println("mobFound");
      enemy.changeName("Marauder");
      enemy.changeMobImage("MarauderMob.png");
      enemy.changeLvl((int) random(5,10));
      enemy.changeHP((int) random(350,850));
     }else if (biome == 3) {
      System.out.println("mobFound");
      enemy.changeName("Zergling");
      enemy.changeMobImage("MarauderMob.png");
      enemy.changeLvl((int) random(10,15));
      enemy.changeHP((int) random(650,1150));
     }else if (biome == 4) {
      System.out.println("mobFound");
      enemy.changeName("Zergling");
      enemy.changeMobImage("MarauderMob.png");
      enemy.changeLvl((int) random(15,20));
      enemy.changeHP((int) random(950,1450));
     }else if (biome == 5) {
      System.out.println("mobFound");
      enemy.changeName("Zergling");
      enemy.changeMobImage("MarauderMob.png");
      enemy.changeLvl((int) random(20,25));
      enemy.changeHP((int) random(1250,1750));
     }else if (biome == 6) {
      System.out.println("mobFound");
      enemy.changeName("Zergling");
      enemy.changeMobImage("MarauderMob.png");
      enemy.changeLvl((int) random(25,30));
      enemy.changeHP((int) random(1550,2150));
     }else if (biome == 7) {
      System.out.println("mobFound");
      enemy.changeName("Zergling");
      enemy.changeMobImage("MarauderMob.png");
      enemy.changeLvl((int) random(30,35));
      enemy.changeHP((int) random(1850,2450));
     }else if (biome == 8) {
      System.out.println("mobFound");
      enemy.changeName("Dark Templar");
      enemy.changeMobImage("DarkTemplar.png");
      enemy.changeLvl((int) random(35,40));
      enemy.changeHP((int) random(2350,3550));
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
