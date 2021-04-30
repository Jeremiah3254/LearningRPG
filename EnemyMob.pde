public class EnemyMob extends Entity {
  String mobName,mobImage = "EnemySprite.png";
  int[] hp = new int[2],xp = new int[2];
  int lvl,x,y;
 public EnemyMob(String mobName,String mobImage,int lvl,int[] xp,int[] hp,int x, int y) {
  super(mobImage,x,y,lvl,hp,xp,25); 
  this.mobName = mobName;
 }
 
 public String findBorder() {
   String result = "SpiderEnemyPortrait.png";
   if (mobImage == "EnemySprite.png") {
    result = "SpiderEnemyPortrait.png";
   }
   return result;
 }
 
 public boolean getCollision(Player P) {
 if (dist(P.getX(),P.getY(),this.x,this.y) <= (60 / 2) + (60 / 2)) {
   System.out.println("yep");
   return true;
 }
 return false;
 }
 
 
  public void randomMovement() {
   int direction;
   direction = (int) random(4);
   if (direction == 1) {
      super.y = super.y-(speed/2); 
    }
    if (direction == 2) {
      super.x = super.x-(speed/2);
    }
    if (direction == 3) {
      super.y = super.y+(speed/2);
    }
    if (direction == 4) {
      super.x = super.x+(speed/2);
    }
 }
 
 public void move(boolean[] direction,int SPD) {
    if (direction[0] == true) {//w
      super.y = super.y+SPD;
    }
    if (direction[1] == true) {//a
      super.x = super.x+SPD;
    }
    if (direction[2] == true) {//s
      super.y = super.y-SPD; 
    }
    if (direction[3] == true) {//d
      super.x = super.x-SPD;
    }
  }
  
 public boolean isAlive() {
    return isAlive;
 }
 
 public String getIcon() {
  return this.mobImage; 
 }
 
}
