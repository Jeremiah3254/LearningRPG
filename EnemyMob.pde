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
   if (super.picture == "EnemySprite.png") {
    result = "SpiderEnemyPortrait.png";
   }else if (super.picture == "CarbotZergling.png") {
    result = "CarbotZerglingPortrait.png";
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
 
 //Change Stats
 
 public void changeName(String name) {
 this.mobName = name;
 }
 public void changeMobImage(String image) {
 super.picture = image;
 }
 public void changeLvl(int level) {
 super.lvl = level;
 }
 public void changeHP(int health) {
 super.hp[0] = health;
 super.hp[1] = health;
 }
 
 //Change Stats
 
 public String getName() {
 return mobName;
 }
  
 public boolean isAlive() {
    return isAlive;
 }
 
 public String getIcon() {
  return this.mobImage; 
 }
 
}
