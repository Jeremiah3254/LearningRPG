public class equippedSkills {
  int staminaCost, lvl, damage,skillType;
  String skillName,skillIcon;
  public equippedSkills(String skillName,String skillIcon,int lvl,int staminaCost,int damage,int skillType) {
    this.skillName = skillName;
    this.skillIcon = skillIcon;
    this.lvl = lvl;
    this.staminaCost = staminaCost;
    this.skillType = skillType;
    this.damage = damage;
  }
  
  public void giveXP(skillTypes[] currentSkill) {
    if (this.skillIcon == "MathLogo.png") {
     currentSkill[0].setXP();
    }else if (this.skillIcon == "ScienceLogo.png") {
     currentSkill[1].setXP();
    }else if (this.skillIcon == "socialStudiesLogo.png") {
      currentSkill[2].setXP();
    }else if (this.skillIcon == "EnglishIcon.png") {
      currentSkill[3].setXP();
    }
  }
  
  public int getskillType() {
    int test = 0;
    if (this.skillIcon == "MathLogo.png") {
     return 0;
    }else if (this.skillIcon == "ScienceLogo.png") {
     return 1;
    }else if (this.skillIcon == "socialStudiesLogo.png") {
      return 2;
    }else if (this.skillIcon == "EnglishIcon.png") {
      return 3;
    }
    return test;
  }
  
  public boolean hasStamina(Player p1) {
  boolean result = false;
  if (p1.getStamC() >= this.staminaCost) {
  result = true;
  }
  return result;
  }
  
  public void equipSkill(int currentTopic, int currentSkillSelected) {
    if (currentTopic == 0 && currentSkillSelected == 1) {
     this.skillName = "Addition";
     this.staminaCost = 10;
     this.lvl = 0;
     this.damage = 20;
     this.skillType = 1;
     this.skillIcon = "MathLogo.png";
   }else if (currentTopic == 0 && currentSkillSelected == 2) {
     this.skillName = "Multiplication";
     this.staminaCost = 15;
     this.lvl = 5;
     this.damage = 35;
     this.skillType = 1;
     this.skillIcon = "MathLogo.png";
   }else if (currentTopic == 0 && currentSkillSelected == 3) {
     this.skillName = "Division";
     this.staminaCost = 25;
     this.lvl = 10;
     this.damage = 50;
     this.skillType = 1;
     this.skillIcon = "MathLogo.png";
   }else if (currentTopic == 0 && currentSkillSelected == 4) {
     this.skillName = "PEMDAS";
     this.staminaCost = 35;
     this.lvl = 15;
     this.damage = 100;
     this.skillType = 1;
     this.skillIcon = "MathLogo.png";
   }
   
   if (currentTopic == 1 && currentSkillSelected == 1) {
     this.skillName = "Cells";
     this.staminaCost = 10;
     this.lvl = 0;
     this.damage = 20;
     this.skillType = 2;
     this.skillIcon = "ScienceLogo.png";
   }else if (currentTopic == 1 && currentSkillSelected == 2) {
     this.skillName = "DNA";
     this.staminaCost = 15;
     this.lvl = 5;
     this.damage = 35;
     this.skillType = 2;
     this.skillIcon = "ScienceLogo.png";
   }else if (currentTopic == 1 && currentSkillSelected == 3) {
     this.skillName = "Planets";
     this.staminaCost = 25;
     this.lvl = 10;
     this.damage = 50;
     this.skillType = 2;
     this.skillIcon = "ScienceLogo.png";
   }else if (currentTopic == 1 && currentSkillSelected == 4) {
     this.skillName = "Elements";
     this.staminaCost = 35;
     this.lvl = 15;
     this.damage = 100;
     this.skillType = 2;
     this.skillIcon = "ScienceLogo.png";
   }
   
   if (currentTopic == 2 && currentSkillSelected == 1) {
     this.skillName = "Presidents";
     this.staminaCost = 0;
     this.lvl = 0;
     this.damage = 20;
     this.skillType = 3;
     this.skillIcon = "socialStudiesLogo.png";
   }else if (currentTopic == 2 && currentSkillSelected == 2) {
     this.skillName = "States";
     this.staminaCost = 0;
     this.lvl = 5;
     this.damage = 35;
     this.skillType = 3;
     this.skillIcon = "socialStudiesLogo.png";
   }else if (currentTopic == 2 && currentSkillSelected == 3) {
     this.skillName = "Dates";
     this.staminaCost = 0;
     this.lvl = 10;
     this.damage = 50;
     this.skillType = 3;
     this.skillIcon = "socialStudiesLogo.png";
   }else if (currentTopic == 2 && currentSkillSelected == 4) {
     this.skillName = "Dictators";
     this.staminaCost = 0;
     this.lvl = 15;
     this.damage = 100;
     this.skillType = 3;
     this.skillIcon = "socialStudiesLogo.png";
   }
   
   if (currentTopic == 3 && currentSkillSelected == 1) {
     this.skillName = "Grammar";
     this.staminaCost = 10;
     this.lvl = 0;
     this.damage = 20;
     this.skillType = 1;
     this.skillIcon = "EnglishIcon.png";
   }else if (currentTopic == 3 && currentSkillSelected == 2) {
     this.skillName = "Vocab";
     this.staminaCost = 15;
     this.lvl = 5;
     this.damage = 35;
     this.skillType = 1;
     this.skillIcon = "EnglishIcon.png";
   }else if (currentTopic == 3 && currentSkillSelected == 3) {
     this.skillName = "Figurative Language";
     this.staminaCost = 25;
     this.lvl = 10;
     this.damage = 50;
     this.skillType = 1;
     this.skillIcon = "EnglishIcon.png";
   }else if (currentTopic == 3 && currentSkillSelected == 4) {
     this.skillName = "Characters";
     this.staminaCost = 35;
     this.lvl = 15;
     this.damage = 100;
     this.skillType = 1;
     this.skillIcon = "EnglishIcon.png";
   }
  }
  
  public void setSkillIcon(String icon) {
   this.skillIcon = icon; 
  }
  
  public void setSkillType(int type) {
    this.skillType = type;
  }
  
  public void setskillName(String name) {
    this.skillName = name;
  }
  
  public void setStaminaCost(int stamina) {
    this.staminaCost = stamina;
  }
  
  public void setLvlRequirement(int level) {
   this.lvl = level; 
  }
  
  public void setDamage(int dmg) {
    this.damage = dmg;
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
  
  public int getType() {
   return this.skillType;
  }
  
  public String getIcon() {
   return this.skillIcon; 
  }
  
}
