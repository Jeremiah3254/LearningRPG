public class equippedSkills {
  int staminaCost, lvl, damage;
  String skillName;
  public equippedSkills(String skillName,int lvl,int staminaCost,int damage) {
    this.skillName = skillName;
    this.lvl = lvl;
    this.staminaCost = staminaCost;
    this.damage = damage;
  }
  
  public boolean hasStamina(Player p1) {
  boolean result = false;
  if (p1.getStamC >= this.staminaCost) {
  result = true;
  }
  return result;
  }
  
  public String getskillName() {
  return this.skillName;
  }
  
  public int getLvl() {
  return this.lvl;
  }
  
  public int getStaminaCost() {
  return this.staminaCost;
  }
  
  public int getDamage() {
  return this.damage;
  }
  
}
