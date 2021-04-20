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
 
 public String getImage() {
  return picture;
 }

}
