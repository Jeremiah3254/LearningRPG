public class Player extends Entity {
  int[] hp = new int[2],xp = new int[2];
  int x,y;
  public Player(int[] xp,int[] hp,int x,int y) {
    super("CarbotMarine.png",x,y,1,hp,xp,25);
  }
  
  public void levelUp() {
  if (super.xp[0] >= super.xp[1]) {
    super.xp[0] = 0;
    super.xp[1] = super.xp[1]*1.25;
    super.lvl = super.lvl + 1;
    }
  }
}
