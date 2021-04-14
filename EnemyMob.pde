public class EnemyMob extends Entity {
  String mobName;
  int[] hp = new int[2],xp = new int[2];
  int lvl,x,y;
 public EnemyMob(String mobName,int lvl,int[] xp,int[] hp,int x, int y) {
  super("EnemySprite.png",x,y,lvl,hp,xp,15); 
  this.mobName = mobName;
 }
 /*
 public getCollision(Player test) {
 if (test.getX() == this.x && test.getY() == this.y) {
 // Create and Display fighting Class with the images & stats of the given mob.
 }
 
 */
}
