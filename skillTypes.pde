public class skillTypes {
 int level;
 int[] xp = new int[2];
 public skillTypes(int level,int[] xp) {
   this.level = level;
   this.xp = xp;
   
 }
  
  public int getXPC() {
    return xp[0];
  }
  
  public int getXPM() {
    return xp[1];
  }
  
  public int getLvl() {
   return level; 
  }
  
}
