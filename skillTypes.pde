public class skillTypes {
 int level;
 int[] xp = new int[2];
 public skillTypes(int level,int[] xp) {
   this.level = level;
   this.xp = xp;
   
 }
 
 public void levelUp() {
  if (this.xp[0] >= this.xp[1]) {
  this.level = this.level+1;
  this.xp[0] = this.xp[0] - this.xp[1];
  this.xp[1] = this.xp[1]+10;
  }
 }
  
  public int getXPC() {
    return xp[0];
  }
  
  public void setXP() {
   this.xp[0] = this.xp[0]+10;
  }
  
  public int getXPM() {
    return xp[1];
  }
  
  public int getLvl() {
   return level; 
  }
  
}
