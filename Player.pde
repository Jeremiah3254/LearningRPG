public class Player extends Entity {
  int[] hp = new int[2],xp = new int[2];
  public Player(int[] hp, int[] xp) {
    super("CarbotMarine.png",0,0,2,hp,xp,15);
  }
}
