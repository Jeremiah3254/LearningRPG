public class Player extends Entity {
  int[] hp = new int[2],xp = new int[2];
  public Player(int[] xp,int[] hp) {
    super("CarbotMarine.png",0,0,1,hp,xp,15);
  }
}
