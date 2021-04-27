public class Player extends Entity {
  int[] hp = new int[2],xp = new int[2],stamina = new int[2];
  int x,y,damage,speed,stam,health,skillPoints;
  boolean faceUp = false;
  boolean faceLeft = false;
  public Player(int[] xp,int[] hp,int[] stamina,int skillPoints,int damage,int x,int y,int speed) {
    super("CarbotMarineDR.png",x,y,1,hp,xp,speed);
    this.damage = damage;
    this.stamina = stamina;
    this.skillPoints = skillPoints;
  }
  
  public void levelUp() {
  if (super.xp[0] >= super.xp[1]) {
    this.skillPoints = this.skillPoints + 1;
    super.xp[0] = super.xp[0] - super.xp[1];
    super.xp[1] = (int) (super.xp[1]*1.25);
    super.lvl = super.lvl + 1;
    }
  }
  
  public void move(boolean[] direction) {
    if (direction[0] == true) {
      this.faceUp = true;
      if (this.faceLeft == false) {
        super.picture = "CarbotMarineFR.png";
      } else {
        super.picture = "CarbotMarineFL.png";
      }
    }
    if (direction[1] == true) {
      this.faceLeft = true;
      if (this.faceUp == false) {
      super.picture = "CarbotMarineDL.png";
      } else {
      super.picture = "CarbotMarineFL.png";
      }
    }
    if (direction[2] == true) {
       this.faceUp = false;
       if (this.faceLeft == false) {
        super.picture = "CarbotMarineDR.png";
      } else {
        super.picture = "CarbotMarineDL.png";
      }
    }
    if (direction[3] == true) {
      this.faceLeft = false;
      if (this.faceUp == false) {
      super.picture = "CarbotMarineDR.png";
      } else {
      super.picture = "CarbotMarineFR.png";
      }
    }
  }
  
  public void spendAttribute() {
   this.skillPoints = this.skillPoints-1;
  }
  
  public void upgradeDamage() {
  this.damage = this.damage+1;
  }
  
  public void upgradeSpeed() {
  super.speed = super.speed+1;
  }
  
  public void upgradeHP() {
  this.health = this.health+1;
  }
  
  public void upgradeStamina() {
   this.stam = stam+1; 
  }
  
  public int getDamageA() {
   return damage; 
  }
  
  public int getSpeedA() {
   return super.speed;
  }
  
  public int getHealthA() {
   return health; 
  }
  
  public int getStaminaA() {
   return stam; 
  }
  
  public int getSkillPoints() {
   return skillPoints;
  }
  
  public int getStamC() {
   return stamina[0];
  }
  
  public int getStamM() {
   return stamina[1]; 
  }
}
