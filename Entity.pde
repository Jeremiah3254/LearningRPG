public class Entity {
  String picture;
  PVector pos;
  int x,y,lvl,speed;
  int[] hp = new int[2],xp = new int[2];
  public Entity(String picture,int x, int y,int lvl,int[] hp,int[] xp,int speed) {
    this.picture = picture;
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
    //System.out.println(this.x+" "+this.y);
  }
  
  public void draw() {
   String url = picture;
   image(loadImage(url, "png"),x,y,60,60);
  }
}
