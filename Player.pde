public class Player extends Entity {
  int[] hp = new int[2],xp = new int[2];
  int x,y;
  public Player(int[] xp,int[] hp,int x,int y) {
    super("CarbotMarine.png",x,y,1,hp,xp,15);
  }
}
