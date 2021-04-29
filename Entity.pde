public class Entity {
  //PImage image;// = loadImage(url, "png");
  boolean isAlive = true;
  String picture;
  PVector pos;
  int x,y,lvl,speed;
  int[] hp = new int[2],xp = new int[2];
  public Entity(String picture,int x, int y,int lvl,int[] hp,int[] xp,int speed) {
    this.picture = picture;
    //this.image = loadImage(this.picture, "png");
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    this.hp = hp;
    this.xp = xp;
    this.speed = speed;
  }
  
   Public String getBorder() {
    String result = "UnrankedPortrait.png";
    if (this.lvl >= 0 && this.lvl <= 4) {
    result = "UnrankedPortrait.png";
    } else if (this.lvl >= 5 && this..lvl <= 9) {
    result = "BronzePortrait.png";
    } else if (this.lvl >= 10 && this.lvl <= 14) {
    result = "SilverPortrait.png";
    } else if (this.lvl >= 15 && this.lvl <= 19) {
    result = "GoldPortrait.png";
    } else if (this.lvl >= 20 && this.lvl <= 24) {
    result = "PlatinumPortrait.png"
    } else if (this.lvl >= 25 && this.lvl <= 29) {
    result = "DiamondPortrait.png";
    } else if (this.lvl >= 30 && this.lvl <= 34) {
    result = "MasterPortrait.png";
    }
    return result;
  }
  
  public void move(boolean[] direction) {
    if (direction[0] == true) {
      this.y = y-speed; 
    }
    if (direction[1] == true) {
      this.x = x-speed;
    }
    if (direction[2] == true) {
      this.y = y+speed;
    }
    if (direction[3] == true) {
      this.x = x+speed;
    }
  }
  
  public void draw() {
   //String url = picture;
   image(loadImage(this.picture, "png"),x,y,60,60);
  }
  
  public int getX() {
  return x;
  }
  
 public int getY() {
  return y;
  }
  
  public int getLvl() {
  return lvl;
  }
  
  public int getCXP() {
  return xp[0];
  }
  
  public int getMXP() {
  return xp[1];
  }
  
  public int getCHP() {
  return hp[0];
  }
  
  public int getMHP(){
  return hp[1];
  }
  
  public boolean isAlive() {
  return isAlive;
 }
 
 public void setAlive(boolean b) {
   this.isAlive = b;
 }
 
 public String getImage() {
  return picture;
 }
 
 public int getSPD() {
  return speed;
  }

}
