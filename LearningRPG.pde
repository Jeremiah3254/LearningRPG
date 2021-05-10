boolean gamePaused = false;
int currentTopic = 0;
String pauseText = "Pause Game";
boolean foundEnemy = false, battleUILoaded = false, attackSkills = false, healSkills = false;
boolean attributesMenuVis = false, attributesLoaded = false, manageSkillsMenuVis = false, manageSkillsMenuLoaded = false;
String currentHoverText = "";
EnemyMob currentEnemy;
boolean[] movement = new boolean[4];
//CarbotMarine.png
//BossImage.png
//EnemySprite.png
Player Player1;
// player ui
progressBar PlayerHP,PlayerXP,PlayerStamina,EnemyHP,EnemyXP;
ButtonUI playerStats, attributeMenu, skillMenu, pauseButton;
PImage playerPortrait,PortraitImages,enemyPortrait,enemyPortraitImages;
ButtonUI backGroundA, healthA, staminaA, damageA, speedA;
TextLabels attributeTitle, currentPoints, healthD, staminaD, damageD, speedD;
ButtonUI backgroundSM;
ButtonUI[] detailBorders = new ButtonUI[4],skillTypeButton = new ButtonUI[4];
PImage[] skillTypeIcons = new PImage[4];
TextLabels[] skillTypeNames = new TextLabels[4],skillLevelText = new TextLabels[4];
ButtonUI rightArrowS,leftArrowS,sideColumS;
TextLabels currentPage;
progressBar mathLvlBar, scienceLvlBar, socialStudiesLvlBar, englishLvlBar;
int pageNumber = 1;
// player ui
// combat ui
ButtonUI Pstat,Estat,background1,background2,bottomBar,attackButton,healButton,runButton,hoverText;
// combat ui
EnemyMob[] Enemies = new EnemyMob[2000];
skillTypes[] skillCategories = new skillTypes[4];
PImage background,Player,Enemy;
//Biome grassBiome,mixtureBiome,mudBiome;
Biome[] biomes = new Biome[8];
boolean initializedStats = false;
WayPoint grassWP,mixtureWP,mudWP,rockSandWP,rockWP,rockyJungleWP,roughGassWP,templeGroundWP;
//EnemyMob tankBoss;
EnemyMob[] Bosses = new EnemyMob[8];

public void setup() {
  frameRate(60);
  //fullScreen();
  size(1000,750);
  System.out.println(width/2);
  System.out.println(height/2);
  grassWP = new WayPoint("GrassLands",160,0,255,0);
  mixtureWP = new WayPoint("ObscureLands",160,165,42,42);
  mudWP = new WayPoint("MudLands",160,204,102,0);
  rockSandWP  = new WayPoint("RockySandLands",160,76,70,50);
  rockWP  = new WayPoint("RockyLands",160,0,0,0);
  rockyJungleWP = new WayPoint("RockyJungleLands",160,210,105,30);
  roughGassWP = new WayPoint("RoughGrassLands",160,34,139,34);
  templeGroundWP = new WayPoint("TempleLands",160,34,139,34);
  background = loadImage("Ground.png", "png");
  biomes[0] = new Biome("grassTerrain.png",(int) random(-width,width)*10,(int) random(-height,height)*10,1500,1500);
  biomes[1] = new Biome("mixtureTerrain.png",(int) random(-width,width)*10,(int) random(-height,height)*10,1500,1500);
  biomes[2] = new Biome("mudTerrain.png",(int) random(-width,width)*10,(int) random(-height,height)*10,1500,1500);
  biomes[3] = new Biome("RockSandTerrain.png",(int) random(-width,width)*10,(int) random(-height,height)*10,1500,1500);
  biomes[4] = new Biome("RockTerrain.png",(int) random(-width,width)*10,(int) random(-height,height)*10,1500,1500);
  biomes[5] = new Biome("RockyJungleTerrain.png",(int) random(-width,width)*10,(int) random(-height,height)*10,1500,1500);
  biomes[6] = new Biome("RoughGrassTerrain.png",(int) random(-width,width)*10,(int) random(-height,height)*10,1500,1500);
  biomes[7] = new Biome("TempleGroundTerrain.png",(int) random(-width,width)*10,(int) random(-height,height)*10,1500,1500);
  /*
  grassBiome = new Biome("grassTerrain.png",(int) random(-width,width)*10,(int) random(-height,height)*10,1500,1500);
  mixtureBiome = new Biome("mixtureTerrain.png",(int) random(-width,width)*10,(int) random(-height,height)*10,1500,1500);
  mudBiome = new Biome("mudTerrain.png",(int) random(-width,width)*10,(int) random(-height,height)*10,1500,1500);
  */
  //Check
  Player1 = new Player(new int[] {100000,10},new int[] {100,100},new int[] {100,100},1,0,width/2-30,height/2-30,25);
  skillCategories[0] = new skillTypes(0,new int[] {0,10});
  skillCategories[1] = new skillTypes(0,new int[] {0,10});
  skillCategories[2] = new skillTypes(0,new int[] {0,10});
  skillCategories[3] = new skillTypes(0,new int[] {0,10});
  //Check
  //bosses
  //Bosses[0] = new EnemyMob("Kerrigan [Boss]","KerriganBoss.png",(int) random(5,10),new int[] {0,10},new int[] {100,100},(int) random(biomes[0].getX(),biomes[0].getX() + 1500),(int) random(biomes[0].getY(),biomes[1].getY() + 1500),100,100,true);
  Bosses[1] = new EnemyMob("Tank [Boss]","SiegeTankBoss.png",(int) random(10,15),new int[] {0,10},new int[] {100,100},(int) random(biomes[1].getX(),biomes[1].getX() + 1500),(int) random(biomes[1].getY(),biomes[1].getY() + 1500),100,100,true);
  Bosses[2] = new EnemyMob("Archon [Boss]","ArchonBoss.png",(int) random(15,20),new int[] {0,10},new int[] {100,100},(int) random(biomes[2].getX(),biomes[1].getX() + 1500),(int) random(biomes[2].getY(),biomes[2].getY() + 1500),100,100,true);
  Bosses[3] = new EnemyMob("Colossus [Boss]","ColossusBoss.png",(int) random(20,25),new int[] {0,10},new int[] {100,100},(int) random(biomes[3].getX(),biomes[3].getX() + 1500),(int) random(biomes[3].getY(),biomes[3].getY() + 1500),100,100,true);
  Bosses[4] = new EnemyMob("Thor [Boss]","ThorBoss.png",(int) random(25,30),new int[] {0,10},new int[] {100,100},(int) random(biomes[4].getX(),biomes[4].getX() + 1500),(int) random(biomes[4].getY(),biomes[4].getY() + 1500),100,100,true);
  Bosses[5] = new EnemyMob("Tempest [Boss]","TempestBoss.png",(int) random(30,35),new int[] {0,10},new int[] {100,100},(int) random(biomes[5].getX(),biomes[5].getX() + 1500),(int) random(biomes[5].getY(),biomes[5].getY() + 1500),100,100,true);
  Bosses[6] = new EnemyMob("Carrier [Boss]","CarrierBoss.png",(int) random(35,40),new int[] {0,10},new int[] {100,100},(int) random(biomes[6].getX(),biomes[6].getX() + 1500),(int) random(biomes[6].getY(),biomes[6].getY() + 1500),100,100,true);
  Bosses[7] = new EnemyMob("Mothership [Boss]","MothershipBoss.png",(int) random(40,45),new int[] {0,10},new int[] {100,100},(int) random(biomes[7].getX(),biomes[6].getX() + 1500),(int) random(biomes[6].getY(),biomes[6].getY() + 1500),100,100,true);
  //tankBoss = new EnemyMob("Tank [Boss]","SiegeTankBoss.png",(int) random(35,40),new int[] {0,10},new int[] {100,100},(int) random(biomes[1].getX(),biomes[1].getX() + 1500),(int) random(biomes[1].getY(),biomes[1].getY() + 1500),100,100,true); 
  tankBoss.changeHP((int) random(1000,1500));
  //bosses
  for (int i = 0; i<Enemies.length; i++) {
    Enemies[i] = new EnemyMob("Spider","EnemySprite.png",1,new int[] {0,10},new int[] {80,100},(int) random(-width,width)*10,(int) random(-height,height)*10);
  }
  //fullScreen();
}

public void draw() {
  //background(loadImage("Ground2.png"));
  //background(200);
   int boundsLeft = Player1.getX() - (width/2)-30;
   int boundsRight = Player1.getX() + (width/2)+30;
   int boundsTop = Player1.getY() - (height/2)-30;
   int boundsBottom = Player1.getY() + (height/2)+30;
   //test

  image(background,0,0,width,height);
  for (Biome biome : biomes) {
    if (biome.getX()+1500 >= boundsLeft && biome.getX() <= boundsRight && biome.getY() <= boundsBottom && biome.getY()+1500 >= boundsTop) {
      biome.draw();
    }
    if (gamePaused == false && foundEnemy == false) {
        biome.move(movement,Player1.getSpeedA());
    }
  }
  
  /*if (gamePaused == false && foundEnemy == false) {
  grassBiome.move(movement,Player1.getSpeedA());
  mixtureBiome.move(movement,Player1.getSpeedA());
  mudBiome.move(movement,Player1.getSpeedA());
  }
  */
  
  if (foundEnemy == false) {
  grassWP.draw(biomes[0],Player1.getX(),Player1.getY());
  mixtureWP.draw(biomes[1],Player1.getX(),Player1.getY());
  mudWP.draw(biomes[2],Player1.getX(),Player1.getY());
  rockSandWP.draw(biomes[3],Player1.getX(),Player1.getY());
  rockWP.draw(biomes[4],Player1.getX(),Player1.getY());
  rockyJungleWP.draw(biomes[5],Player1.getX(),Player1.getY());
  roughGassWP.draw(biomes[6],Player1.getX(),Player1.getY());
  templeGroundWP.draw(biomes[7],Player1.getX(),Player1.getY());
  
  }
  
  //System.out.println(grassBiome.getX());
  //System.out.println(grassBiome.getY());
  int x = (width/2)-30;
  int y = (height/2)-30;

  if (gamePaused == false && foundEnemy == false) {
  tankBoss.move(movement,Player1.getSPD());
  if (tankBoss.getX() >= boundsLeft && tankBoss.getX() <= boundsRight && tankBoss.getY() <= boundsBottom && tankBoss.getY() >= boundsTop && tankBoss.isAlive() == true) {
   tankBoss.drawB();
   tankBoss.randomMovementBoss(biomes[1]); 
   if (dist(Player1.getX(),Player1.getY(),tankBoss.getX(),tankBoss.getY()) <= (60 / 2) + (60 / 2) && tankBoss.isAlive() == true) {
   foundEnemy = true;
   combatUI(tankBoss);
   currentEnemy = tankBoss;
   }
  }
  }
  if (tankBoss.isAlive() == false) {
   tankBoss.respawnBoss(); 
  }
  //System.out.println(minute());
  
  
  if (initializedStats == false) {
  for (int q = 0; q<biomes.length; q++) {
  for (int i = 0; i<Enemies.length; i++) {
    if (initializedStats == false && i < (Enemies.length-1)) {
     biomes[q].mobsInside(Enemies[i],q);
    } else {
    biomes[q].mobsInside(Enemies[i],q);
    initializedStats = true;
    System.out.println("done");
    }
  }
  }
  }
  
  for (EnemyMob Enemy : Enemies) {
    if (foundEnemy == false && gamePaused == false) {
    Enemy.move(movement,Player1.getSPD());
    }
      if (Enemy.getX() >= boundsLeft && Enemy.getX() <= boundsRight && Enemy.getY() <= boundsBottom && Enemy.getY() >= boundsTop) {
        if (Enemy.isAlive() == true && foundEnemy == false && gamePaused == false) {
          Enemy.randomMovement();
          Enemy.draw();
          if (dist(Player1.getX(),Player1.getY(),Enemy.getX(),Enemy.getY()) <= (60 / 2) + (60 / 2)) {
           foundEnemy = true;
           System.out.println("test"); 
           combatUI(Enemy);
           currentEnemy = Enemy;
          }
        }
     }
  }
  if (Player1.isAlive() == true) {
    //Player1.move(movement);
    if (gamePaused == false) {
    Player1.move(movement);
    }
    Player1.draw();
    Player1.levelUp();
    Player1.refreshStats();
  }
  
  if (manageSkillsMenuVis == true && foundEnemy == false && attackSkills == false && healSkills == false) {
     skillsMenu();
     if (pageNumber == 1) {
     skillTypeButton[0].hoverAnim();
     skillTypeButton[1].hoverAnim();
     skillTypeButton[2].hoverAnim();
     leftArrowS.hoverAnim();
     rightArrowS.hoverAnim();
     backgroundSM.draw(); 
     detailBorders[0].draw();
     skillTypeNames[0].draw();
     image(skillTypeIcons[0],(width/6),(int) (height/2.5),120,120);
     skillLevelText[0].draw();
     mathLvlBar.draw();
     skillTypeButton[0].draw();
     detailBorders[1].draw();
     skillTypeNames[1].draw();
     image(skillTypeIcons[1],(int) (width/2.4),(int) (height/2.5),120,120);
     skillLevelText[1].draw();
     scienceLvlBar.draw();
     skillTypeButton[1].draw();
     detailBorders[2].draw();
     skillTypeNames[2].draw();
     image(skillTypeIcons[2],(int) (width/1.487),(int) (height/2.5),120,120);
     skillLevelText[2].draw();
     socialStudiesLvlBar.draw();
     skillTypeButton[2].draw();
     sideColumS.draw();
     leftArrowS.draw();
     rightArrowS.draw();
     currentPage.draw();
     } else if (pageNumber == 2) {
     backgroundSM.draw(); 
     leftArrowS.hoverAnim();
     rightArrowS.hoverAnim();
     skillTypeButton[3].hoverAnim();
     detailBorders[3].draw();
     englishLvlBar.draw();
     skillTypeButton[3].draw();
     image(skillTypeIcons[3],(int) (width/6),(int) (height/2.5),120,120);
     skillTypeNames[3].draw();
     skillLevelText[3].draw();
     sideColumS.draw();
     leftArrowS.draw();
     rightArrowS.draw();
     currentPage.draw();
     }
  }
  
  if (foundEnemy == false && attackSkills == false && healSkills == false) {
    playerUI();
    attributeMenu.hoverAnim();
    skillMenu.hoverAnim();
    pauseButton.hoverAnim();
    playerStats.draw();
    PlayerXP.draw();
    PlayerHP.draw();
    PlayerStamina.draw();
    skillMenu.draw();
    attributeMenu.draw();
    pauseButton.draw();
    image(PortraitImages,0,0,85,85);
    image(playerPortrait,0,0,85,85);
  }
  
  if (foundEnemy == false && attackSkills == false && healSkills == false && attributesMenuVis == true) {
    attributesUI();
    healthA.hoverAnim();
    staminaA.hoverAnim();
    damageA.hoverAnim();
    speedA.hoverAnim();
    backGroundA.draw();
    healthD.draw();
    healthA.draw();
    attributeTitle.draw();
    staminaD.draw();
    staminaA.draw();
    damageD.draw();
    damageA.draw();
    speedD.draw();
    speedA.draw();
    currentPoints.draw();
  }
  
  if (foundEnemy == true && attackSkills == false && healSkills == false) {
  attackButton.hoverAnim();
  healButton.hoverAnim();
  runButton.hoverAnim();
  background1.draw();
  background2.draw();
  Pstat.draw();
  Estat.draw();
  bottomBar.draw();
  attackButton.draw();
  healButton.draw();
  runButton.draw();
  PlayerXP.draw();
  PlayerHP.draw();
  PlayerStamina.draw();
  EnemyXP.draw();
  EnemyHP.draw();
  hoverText.drawL(currentHoverText);
  image(Player,0+25,200,150,150);
  image(Enemy,width-175,200,150,150);
  // player portrait
  image(PortraitImages,0,0,85,85);
  image(playerPortrait,0,0,85,85);
  // player portrait
  //enemy Portrait
  image(enemyPortraitImages,width-85,0,85,85);
  image(enemyPortrait,width-85,0,85,85);
  //enemy Portrait
  if (attackButton.hoverOver() == true) {
    //attackButton.setStroke(255);
    currentHoverText = "Choose from a list of skills that you have unlocked, get a question\n correct and you will damage the enemy, get a question wrong\n and the enemy will retaliate.";
    } else if (healButton.hoverOver() == true) {
      currentHoverText = "Choose from a list of skills that you have unlocked, get a question\n correct and you will heal yourself, get a question wrong\n and the enemy will retaliate.";
    } else if (runButton.hoverOver() == true) {
      currentHoverText = "Try to escape from the enemies grasps.";
    }else {
     currentHoverText = ""; 
    }
  }
  if (foundEnemy == true && attackSkills == true && healSkills == false) {
  attackButton.hoverAnim();
  healButton.hoverAnim();
  runButton.hoverAnim();
  background1.draw();
  background2.draw();
  Pstat.draw();
  Estat.draw();
  bottomBar.draw();
  attackButton.draw();
  healButton.draw();
  runButton.draw();
  hoverText.drawL(currentHoverText);
  currentHoverText = ""; 
  PlayerXP.draw();
  PlayerHP.draw();
  PlayerStamina.draw();
  EnemyXP.draw();
  EnemyHP.draw();
  image(Player,0+25,200,150,150);
  image(Enemy,width-175,200,150,150);
  // player portrait
  image(PortraitImages,0,0,85,85);
  image(playerPortrait,0,0,85,85);
  // player portrait
  image(enemyPortraitImages,width-85,0,85,85);
  image(enemyPortrait,width-85,0,85,85);
  }
  
}


public void combatUI(EnemyMob enemy) {
  Pstat = new ButtonUI(0,0,300,100,"Player "+"Lvl: "+Player1.getLvl()+"\n\n\n",#00b300,3);
  Estat = new ButtonUI(width-300,0,300,100,enemy.getName()+" "+"Lvl: "+enemy.getLvl()+"\n\n\n",#e60000,2);
  background1 = new ButtonUI(0,0,width/2,height,"",#4dff4d,1);
  background2 = new ButtonUI(width-(width/2),0,width/2,height,"",#ff4d4d,1);
  Player = loadImage("CarbotMarineDR.png" , "png");
  Enemy = loadImage(enemy.getImage(), "png");
  bottomBar = new ButtonUI(0,(int)(height/1.75),width,height/2,"",#000000,1);
  attackButton = new ButtonUI(width-(int)(width/3),(int)(height/1.55),(int)(width/6),(int)(height/7),"Attack",#FF00FF,1);
  healButton = new ButtonUI(width-(int)(width/6),(int)(height/1.55),(int)(width/6),(int)(height/7),"Rejuvenators",#00b300,1);
  runButton = new ButtonUI(width-(int)(width/3),(int)(height/1.27),(int)(width/3),(int)(height/7),"Run",#e60000,1);
  hoverText = new ButtonUI(0,(int)(height/1.55),(int)(width/1.5),(int)(height/3.5),currentHoverText,#FFFFFF,1);
  playerPortrait = loadImage(Player1.getBorder(), "png");
  PortraitImages = loadImage("CarbotMarinePortrait.png" , "png");
  enemyPortrait = loadImage(enemy.getBorder(), "png");
  enemyPortraitImages = loadImage(enemy.findBorder(), "png");
  PlayerXP = new progressBar("XP: "+Player1.getCXP()+"/"+Player1.getMXP(),1,new int[] {Player1.getCXP(),Player1.getMXP()},75,25,225,25,#FFFF00);
  PlayerHP = new progressBar("Health: "+Player1.getCHP()+"/"+Player1.getMHP(),1,new int[] {Player1.getCHP(),Player1.getMHP()},75,50,225,25,#FF0000);
  PlayerStamina = new progressBar("Stamina: "+Player1.getStamC()+"/"+Player1.getStamM(),1,new int[] {Player1.getStamC(),Player1.getStamM()},15,75,285,25,#00FF00);
  EnemyXP = new progressBar("XP: "+enemy.getCXP()+"/"+enemy.getMXP(),2,new int[] {enemy.getCXP(),enemy.getMXP()},width-300,25,225,25,#FFFF00);
  EnemyHP = new progressBar("Health: "+enemy.getCHP()+"/"+enemy.getMHP(),2,new int[] {enemy.getCHP(),enemy.getMHP()},width-300,50,225,25,#FF0000);
  battleUILoaded = true;
}

public void playerUI() {
  playerStats = new ButtonUI(0,0,300,100,"Player "+"Lvl: "+Player1.getLvl()+"\nXp: "+Player1.getCXP()+"/"+Player1.getMXP()+"\nHealth: "+Player1.getCHP()+"/"+Player1.getMHP()+"\nStamina: "+Player1.getStamC()+"/"+Player1.getStamM(),#964B00,3);
  attributeMenu = new ButtonUI(0,100,150,25,"Attributes",#00b300,3);
  skillMenu = new ButtonUI(150,100,150,25,"Manage Skills",#008080,3);
  pauseButton = new ButtonUI(0,125,300,25,pauseText,#00b300,3);
  playerPortrait = loadImage(Player1.getBorder(), "png");
  PortraitImages = loadImage("CarbotMarinePortrait.png" , "png");
  PlayerXP = new progressBar("XP: "+Player1.getCXP()+"/"+Player1.getMXP(),1,new int[] {Player1.getCXP(),Player1.getMXP()},75,25,225,25,#FFFF00);
  PlayerHP = new progressBar("Health: "+Player1.getCHP()+"/"+Player1.getMHP(),1,new int[] {Player1.getCHP(),Player1.getMHP()},75,50,225,25,#FF0000);
  PlayerStamina = new progressBar("Stamina: "+Player1.getStamC()+"/"+Player1.getStamM(),1,new int[] {Player1.getStamC(),Player1.getStamM()},15,75,285,25,#00FF00);
}

public void attributesUI() {
  backGroundA = new ButtonUI(width/4,height/4,width/2,height/2,"",#C0C0C0,3);
  healthA = new ButtonUI((int)(width/1.48),height/3,60,60,"+",#00b300,3);
  staminaA = new ButtonUI((int)(width/1.48),(int)(height/2.25),60,60,"+",#00b300,3);
  damageA = new ButtonUI((int)(width/1.48),(int)(height/1.80),60,60,"+",#00b300,3);
  speedA = new ButtonUI((int)(width/1.48),(int)(height/1.5),60,60,"+",#00b300,3);
  attributeTitle = new TextLabels("Attributes Menu",(int)(width/2.25),(int)(height/4.5),100,100,#000000,25);
  healthD = new TextLabels("Health Attribute: "+Player1.getHealthA(),(int)(width/2.5),height/3,50,50,#DC143C,25);
  staminaD = new TextLabels("Stamina Attribute: "+Player1.getStaminaA(),(int)(width/2.5),(int)(height/2.25),50,50,#00ff00,25);
  damageD = new TextLabels("Damage Attribute: "+Player1.getDamageA(),(int)(width/2.5),(int)(height/1.80),50,50,#800080,25);
  speedD = new TextLabels("Speed Attribute: "+Player1.getSpeedA(),(int)(width/2.5),(int)(height/1.5),50,50,#FFFF00,25);
  currentPoints = new TextLabels("Current Points: "+Player1.getSkillPoints(),(int)(width/1.60),(int)(height/4.5),100,100,#000000,10);
  playerPortrait = loadImage(Player1.getBorder(), "png");
  PortraitImages = loadImage("CarbotMarinePortrait.png" , "png");
  attributesLoaded = true;
}

public void skillsMenu() {
  backgroundSM = new ButtonUI((int) (width/9.75),height/4,(int) (width/1.25),height/2,"",#C0C0C0,3);
  detailBorders[0] = new ButtonUI((int) (width/9.75),height/4,250,(int) (height/2.25),"",#C0C0C0,3);
  skillTypeNames[0] = new TextLabels("Math",(int) (width/6),(int) (height/3.5),120,40,#0000FF,35);
  skillTypeIcons[0] = loadImage("MathLogo.png", "png");
  skillLevelText[0] = new TextLabels(skillCategories[0].getLvl()+"",(int) (width/6),(int) (height/2.25),120,40,#FFFF00,60);
  mathLvlBar = new progressBar("XP: "+skillCategories[0].getXPC()+"/"+skillCategories[0].getXPM(),1,new int[] {skillCategories[0].getXPC(),skillCategories[0].getXPM()},(int) (width/9.75),(int) (height/1.68),250,40,#FFFF00);
  skillTypeButton[0] = new ButtonUI((int) (width/9.75),(int) (height/1.54),250,75,"Select",#C0C0C0,3);
  // math
  detailBorders[1] = new ButtonUI((int) (width/2.83),height/4,250,(int) (height/2.25),"",#C0C0C0,3);
  skillTypeNames[1] = new TextLabels("Science",(int) (width/2.4),(int) (height/3.5),120,40,#FF0000,35);
  skillTypeIcons[1] = loadImage("ScienceLogo.png", "png");
  skillLevelText[1] = new TextLabels(skillCategories[1].getLvl()+"",(int) (width/2.4),(int) (height/2.25),120,40,#FFFF00,60);
  scienceLvlBar = new progressBar("XP: "+skillCategories[1].getXPC()+"/"+skillCategories[1].getXPM(),1,new int[] {skillCategories[1].getXPC(),skillCategories[1].getXPM()},(int) (width/2.83),(int) (height/1.68),250,40,#FFFF00);
  skillTypeButton[1] = new ButtonUI((int) (width/2.83),(int) (height/1.54),250,75,"Select",#C0C0C0,3);
  // science
  detailBorders[2] = new ButtonUI((int) (width/1.657),height/4,250,(int) (height/2.25),"",#C0C0C0,3);
  skillTypeNames[2] = new TextLabels("Social Studies",(int) (width/1.487),(int) (height/3.5),120,40,#964B00,35);
  skillTypeIcons[2] = loadImage("socialStudiesLogo.png", "png");
  skillLevelText[2] = new TextLabels(skillCategories[2].getLvl()+"",(int) (width/1.487),(int) (height/2.25),120,40,#FFFF00,60);
  socialStudiesLvlBar = new progressBar("XP: "+skillCategories[2].getXPC()+"/"+skillCategories[2].getXPM(),1,new int[] {skillCategories[2].getXPC(),skillCategories[2].getXPM()},(int) (width/1.657),(int) (height/1.68),250,40,#FFFF00);
  skillTypeButton[2] = new ButtonUI((int) (width/1.657),(int) (height/1.54),250,75,"Select",#C0C0C0,3);
  // right and left tabs
  sideColumS = new ButtonUI((int) (width/1.171),height/4,50,(int) (height/2),"",#FF0000,3);
  leftArrowS = new ButtonUI((int) (width/1.171),height/4,50,50,"<",#FF0000,3);
  rightArrowS = new ButtonUI((int) (width/1.171),(int) (height/1.467),50,50,">",#FF0000,3);
  currentPage = new TextLabels(pageNumber+"",(int) (width/1.171),height/4,50,(int) (height/2),#FFFFFF,60);
  //English
  detailBorders[3] = new ButtonUI((int) (width/9.75),height/4,250,(int) (height/2.25),"",#C0C0C0,3);
  skillTypeNames[3] = new TextLabels("English",(int) (width/6),(int) (height/3.5),120,40,#0000FF,35);
  skillTypeIcons[3] = loadImage("EnglishIcon.png", "png");
  skillLevelText[3] = new TextLabels(skillCategories[3].getLvl()+"",(int) (width/6),(int) (height/2.25),120,40,#FFFF00,60);
  englishLvlBar = new progressBar("XP: "+skillCategories[3].getXPC()+"/"+skillCategories[3].getXPM(),1,new int[] {skillCategories[3].getXPC(),skillCategories[3].getXPM()},(int) (width/9.75),(int) (height/1.68),250,40,#FFFF00);
  skillTypeButton[3] = new ButtonUI((int) (width/9.75),(int) (height/1.54),250,75,"Select",#C0C0C0,3);
  manageSkillsMenuLoaded = true;
}

public void mouseReleased() {
  if (battleUILoaded == true && foundEnemy == true) {
  if (battleUILoaded == true && runButton.isClicked()) {
    //add other conditions so you cant click the button when its hidden
    foundEnemy = false;
    attackSkills = false;
    currentEnemy.setAlive(false);
    currentEnemy.setDeathTime(minute());
    battleUILoaded = false;
  }
    if (battleUILoaded == true && attackButton.isClicked()) {
      attackSkills = true;
    }
    }
  if (attributeMenu.isClicked() && foundEnemy == false) {
      if (attributesMenuVis == false) {
       attributesMenuVis = true; 
      } else {
       attributesLoaded = false;
       attributesMenuVis = false;
      }
  }
  if (skillMenu.isClicked() && foundEnemy == false) {
      if (manageSkillsMenuVis == false) {
       manageSkillsMenuVis = true; 
      } else {
       manageSkillsMenuLoaded = false;
       manageSkillsMenuVis = false;
      }
  }
  if (pauseButton.isClicked() && foundEnemy == false) {
    if (gamePaused == false) {
      pauseText = "Unpause Game";
      gamePaused = true;
    } else {
      pauseText = "Pause Game";
      gamePaused = false;
    }
  }
  // upgrade attributes
  if (attributesMenuVis == true && attributesLoaded == true && foundEnemy == false && Player1.getSkillPoints() >= 1 && healthA.isClicked()) {
    Player1.spendAttribute();
    Player1.upgradeHP();
  }
  if (attributesMenuVis == true && attributesLoaded == true && foundEnemy == false && Player1.getSkillPoints() >= 1 && staminaA.isClicked()) {
    Player1.spendAttribute();
    Player1.upgradeStamina();
  }
  if (attributesMenuVis == true && attributesLoaded == true && foundEnemy == false && Player1.getSkillPoints() >= 1 && damageA.isClicked()) {
    Player1.spendAttribute();
    Player1.upgradeDamage();
  }
  if (attributesMenuVis == true && attributesLoaded == true && foundEnemy == false && Player1.getSkillPoints() >= 1 && speedA.isClicked()) {
    Player1.spendAttribute();
    Player1.upgradeSpeed();
  }
  if (manageSkillsMenuVis == true && manageSkillsMenuLoaded == true && leftArrowS.isClicked() && foundEnemy == false && pageNumber > 1) {
    pageNumber = pageNumber -1;
  }
  if (manageSkillsMenuVis == true && manageSkillsMenuLoaded == true && rightArrowS.isClicked() && foundEnemy == false && pageNumber < 2) {
    pageNumber = pageNumber +1;
  }
  //select skill menu topic button
  if (manageSkillsMenuVis == true && manageSkillsMenuLoaded == true && foundEnemy == false && skillTypeButton[0].isClicked() && pageNumber == 1) {
    manageSkillsMenuLoaded = false;
    manageSkillsMenuVis = false;
    currentTopic = 1;
  }
  if (manageSkillsMenuVis == true && manageSkillsMenuLoaded == true && skillTypeButton[1].isClicked() && foundEnemy == false && pageNumber == 1) {
    manageSkillsMenuLoaded = false;
    manageSkillsMenuVis = false;
    currentTopic = 2;
  }
  if (manageSkillsMenuVis == true && manageSkillsMenuLoaded == true && foundEnemy == false && skillTypeButton[2].isClicked() && pageNumber == 1) {
    manageSkillsMenuLoaded = false;
    manageSkillsMenuVis = false;
    currentTopic = 3;
  }
  if (manageSkillsMenuVis == true && manageSkillsMenuLoaded == true && foundEnemy == false && skillTypeButton[3].isClicked() && pageNumber == 2) {
    manageSkillsMenuLoaded = false;
    manageSkillsMenuVis = false;
    currentTopic = 4;
  }
  //select skill menu topic button
}

public void keyReleased() {
  if (keyCode == 87 || keyCode == 38) {
    movement[0] = false;
  } else if (keyCode == 65 || keyCode == 37) {
    movement[1] = false;
  } else if (keyCode == 83 || keyCode == 40) {
    movement[2] = false;
  } else if (keyCode == 68 || keyCode == 39) {
    movement[3] = false;
  }
}

public void keyPressed() {
  if (keyCode == 87 || keyCode == 38) {
    movement[0] = true;
  } else if (keyCode == 65 || keyCode == 37) {
    movement[1] = true;
  } else if (keyCode == 83 || keyCode == 40) {
    movement[2] = true;
  } else if (keyCode == 68 || keyCode == 39) {
    movement[3] = true;
  }
}
