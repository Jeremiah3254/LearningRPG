public class Skills {
String name, icon;
int stamCost,damage,healAmount,difficultyLvl,lvlRequirement;
String option1, option2, option3, option4;

public Skills(String name, String icon,int damage,int healAmount, int stamCost, int difficultyLvl,int lvlRequirement) {
this.name = name;
this.icon = icon;
this.damage = damage;
this.healAmount = healAmount;
this.stamCost = stamCost;
this.difficultyLvl = difficultyLvl;
this.lvlRequirement = lvlRequirement;
}
}
