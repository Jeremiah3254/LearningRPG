public class EnemyMob extends Entity {
  String mobName,mobImage = "EnemySprite.png";
  boolean isBoss;
  int[] hp = new int[2],xp = new int[2];
  int lvl,x,y,w,h, deathTime;
 public EnemyMob(String mobName,String mobImage,int lvl,int[] xp,int[] hp,int x, int y) {
  super(mobImage,x,y,lvl,hp,xp,25); 
  this.mobName = mobName;
 }
 
 public EnemyMob(String mobName,String mobImage,int lvl,int[] xp,int[] hp,int x, int y,int w, int h,boolean isBoss) {
   super(mobImage,x,y,lvl,hp,xp,25);
   this.mobName = mobName;
   this.isBoss = isBoss;
   this.w = w;
   this.h = h;
 }
 
   public void drawB() {
   //String url = picture;
   image(loadImage(super.picture, "png"),super.x,super.y,this.w,this.h);
  }
  
  public void respawnBoss() {
    if (super.isAlive == false && this.isBoss == true) {
      if (minute() == deathTime+2) {
      super.isAlive = true;
      }
    }
  }
 
 public String findBorder() {
   String result = "SpiderEnemyPortrait.png";
   if (super.picture == "EnemySprite.png") {
    result = "SpiderEnemyPortrait.png";
   }else if (super.picture == "CarbotZergling.png") {
    result = "CarbotZerglingPortrait.png";
   }else if (super.picture == "SiegeTankBoss.png") {
    result = "SeigeTankBossPortrait.png";
   }else if (super.picture == "MarauderMob.png") {
     
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
 
 public void randomMovementBoss(Biome b) {
  int direction;
  direction = (int) random(4);
  if (direction == 1 && this.y  >= b.getU()) {
    super.y = super.y-(speed/2);
  }
  if (direction == 2 && this.x >= b.getX()) {
    super.x = super.x-(speed/2);
  }
  if (direction == 3 && this.y <= (b.getY()+1500)) {
    super.y = super.y+(speed/2);
  }
  if (direction == 4 && this.x <= (b.getX()+1500))
    super.x = super.x+(speed/2)
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
 
 public void setDeathTime(int time) {
  this.deathTime = time;
 }
}
