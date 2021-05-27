boolean gamePaused = false, playerdied = false;
int currentTopic = 0;
int currentSkillSelected = 0,clickTime;
String pauseText = "Pause Game";
boolean gameLoaded = false;
boolean foundEnemy = false, battleUILoaded = false, attackSkills = false, healSkills = false;
boolean attributesMenuVis = false, attributesLoaded = false, manageSkillsMenuVis = false, manageSkillsMenuLoaded = false, skillSectionEquipVis = false, skillSectionEquipLoaded = false,slotSelectionActive = false,slotSelectionLoaded = false, attackinProgress = false;
String currentHoverText = "";
EnemyMob currentEnemy;
boolean[] movement = new boolean[4];
//CarbotMarine.png
//BossImage.png
//EnemySprite.png
Player Player1;
//Player UI
ButtonUI backgroundQA,sectionQA1,buttonQA1,sectionQA2,buttonQA2,sectionQA3,buttonQA3,sectionQA4,buttonQA4,rightArrowQA,leftArrowQA,SideColumnQA,LevelQA,closeButton;
PImage[] skillTierIconQA = new PImage[4];
TextLabels skillName1,skillName2,skillName3,skillName4,skillDesc1,skillDesc2,skillDesc3,skillDesc4;
progressBar xpbarQA;
TextLabels tabQANumber;
ButtonUI backgroundSSS,SkillSlotS1,SkillSlotS2,SkillSlotS3,SkillSlotS4;

ButtonUI[] options = new ButtonUI[4];
ButtonUI submitAnswer;
TextLabels[] answers = new TextLabels[4];
TextLabels question;
QuestionPool currentQ;
int currentDSkill = 0,currentHSkill = 0, correctAnswer = 0, currentSelected = 0;;
boolean healSkill = false;
//boolean questionAssigned = false;

ButtonUI[] damageButtons = new ButtonUI[4];
PImage[] damageButtonIcons = new PImage[4];
TextLabels[][][] damageTextLabels = new TextLabels[5][5][5];
ButtonUI[] healButtons = new ButtonUI[4];
PImage[] healButtonIcons = new PImage[4];
TextLabels[][][] healTextLabels = new TextLabels[5][5][5];
String[] selectedX = new String[4];

//Player UI
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
int pageNumber = 1,SkillPageNumber = 1;
// player ui
// combat ui
ButtonUI Pstat,Estat,background1,background2,bottomBar,attackButton,healButton,runButton,hoverText;
// combat ui
EnemyMob[] Enemies = new EnemyMob[2000];
skillTypes[] skillCategories = new skillTypes[4];

equippedSkills[] damageSkillsE = new equippedSkills[4];
equippedSkills[] healSkillsE = new equippedSkills[4];

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
  //size(1250,1000);
  for (int i = 0; i<4; i++) {
   selectedX[i] = ""; 
  }
  System.out.println(width/2);
  System.out.println(height/2);
  grassWP = new WayPoint("GrassLands",160,0,255,0);
  mixtureWP = new WayPoint("ObscureLands",160,165,42,42);
  mudWP = new WayPoint("MudLands",160,204,102,0);
  rockSandWP  = new WayPoint("RockySandLands",160,255,0,0);
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
  Player1 = new Player(new int[] {0,10},new int[] {100,100},new int[] {100,100},1,0,width/2-30,height/2-30,25);
  skillCategories[0] = new skillTypes(0,new int[] {0,10});
  skillCategories[1] = new skillTypes(0,new int[] {0,10});
  skillCategories[2] = new skillTypes(0,new int[] {0,10});
  skillCategories[3] = new skillTypes(0,new int[] {0,10});
  
  damageSkillsE[0] = new equippedSkills("","",0,0,0,0);
  damageSkillsE[1] = new equippedSkills("","",0,0,0,0);
  damageSkillsE[2] = new equippedSkills("","",0,0,0,0);
  damageSkillsE[3] = new equippedSkills("","",0,0,0,0);
  
  healSkillsE[0] = new equippedSkills("","",0,0,0,0);
  healSkillsE[1] = new equippedSkills("","",0,0,0,0);
  healSkillsE[2] = new equippedSkills("","",0,0,0,0);
  healSkillsE[3] = new equippedSkills("","",0,0,0,0);
  //Check
  //bosses
  Bosses[0] = new EnemyMob("Kerrigan [Boss]","KerriganBoss.png",(int) random(5,10),new int[] {0,10},new int[] {100,100},(int) random(biomes[0].getX(),biomes[0].getX() + 1500),(int) random(biomes[0].getY(),biomes[0].getY() + 1500),150,150,true);
  Bosses[1] = new EnemyMob("Tank [Boss]","SiegeTankBoss.png",(int) random(10,15),new int[] {0,10},new int[] {100,100},(int) random(biomes[1].getX(),biomes[1].getX() + 1500),(int) random(biomes[1].getY(),biomes[1].getY() + 1500),150,150,true);
  Bosses[2] = new EnemyMob("Archon [Boss]","ArchonBoss.png",(int) random(15,20),new int[] {0,10},new int[] {100,100},(int) random(biomes[2].getX(),biomes[2].getX() + 1500),(int) random(biomes[2].getY(),biomes[2].getY() + 1500),150,150,true);
  Bosses[3] = new EnemyMob("Colossus [Boss]","ColossusBoss.png",(int) random(20,25),new int[] {0,10},new int[] {100,100},(int) random(biomes[3].getX(),biomes[3].getX() + 1500),(int) random(biomes[3].getY(),biomes[3].getY() + 1500),150,150,true);
  Bosses[4] = new EnemyMob("Thor [Boss]","ThorBoss.png",(int) random(25,30),new int[] {0,10},new int[] {100,100},(int) random(biomes[4].getX(),biomes[4].getX() + 1500),(int) random(biomes[4].getY(),biomes[4].getY() + 1500),150,150,true);
  Bosses[5] = new EnemyMob("Hyperion [Boss]","HyperionBoss.png",(int) random(30,35),new int[] {0,10},new int[] {100,100},(int) random(biomes[5].getX(),biomes[5].getX() + 1500),(int) random(biomes[5].getY(),biomes[5].getY() + 1500),150,150,true);
  Bosses[6] = new EnemyMob("Carrier [Boss]","CarrierBoss.png",(int) random(35,40),new int[] {0,10},new int[] {100,100},(int) random(biomes[6].getX(),biomes[6].getX() + 1500),(int) random(biomes[6].getY(),biomes[6].getY() + 1500),150,150,true);
  Bosses[7] = new EnemyMob("Mothership [Boss]","MothershipBoss.png",(int) random(40,45),new int[] {0,10},new int[] {100,100},(int) random(biomes[7].getX(),biomes[7].getX() + 1500),(int) random(biomes[7].getY(),biomes[7].getY() + 1500),150,150,true);
  //tankBoss = new EnemyMob("Tank [Boss]","SiegeTankBoss.png",(int) random(35,40),new int[] {0,10},new int[] {100,100},(int) random(biomes[1].getX(),biomes[1].getX() + 1500),(int) random(biomes[1].getY(),biomes[1].getY() + 1500),100,100,true); 
  Bosses[0].changeHP((int) random(500,1000));
  Bosses[1].changeHP((int) random(1000,1500));
  Bosses[2].changeHP((int) random(1500,2000));
  Bosses[3].changeHP((int) random(2000,2500));
  Bosses[4].changeHP((int) random(2500,3000));
  Bosses[5].changeHP((int) random(3000,3500));
  Bosses[6].changeHP((int) random(3500,4000));
  Bosses[7].changeHP((int) random(4000,5000));
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
    if (gamePaused == false && playerdied == false && foundEnemy == false) {
        biome.move(movement,Player1.getSpeedA());
    }
  }
  
  /*if (gamePaused == false && playerdied == false && foundEnemy == false) {
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

for (EnemyMob boss : Bosses) {
  if (gamePaused == false && playerdied == false && foundEnemy == false) {
  boss.move(movement,Player1.getSPD());
  if (boss.getX() >= boundsLeft && boss.getX() <= boundsRight && boss.getY() <= boundsBottom && boss.getY() >= boundsTop && boss.isAlive() == true) {
   boss.drawB();
   boss.randomMovementBoss(biomes[1]); 
   if (dist(Player1.getX(),Player1.getY(),boss.getX(),boss.getY()) <= (60 / 2) + (60 / 2) && boss.isAlive() == true) {
   foundEnemy = true;
   combatUI(boss);
   currentEnemy = boss;
   }
  }
  }
  if (boss.isAlive() == false) {
   boss.respawnBoss(); 
  }
}
  //System.out.println(minute());
  
  
  if (initializedStats == false) {
  for (int q = 0; q<biomes.length; q++) {
  for (int i = 0; i<Enemies.length; i++) {
    if (initializedStats == false && i < (Enemies.length-1)) {
     biomes[q].mobsInside(Enemies[i],(q+1));
    } else {
    biomes[q].mobsInside(Enemies[i],(q+1));
    initializedStats = true;
    System.out.println("done");
    }
  }
  }
  }
  
  for (EnemyMob Enemy : Enemies) {
    if (foundEnemy == false && gamePaused == false && playerdied == false) {
    Enemy.move(movement,Player1.getSPD());
    }
      if (Enemy.getX() >= boundsLeft && Enemy.getX() <= boundsRight && Enemy.getY() <= boundsBottom && Enemy.getY() >= boundsTop) {
        if (Enemy.isAlive() == true && foundEnemy == false && gamePaused == false && playerdied == false && gameLoaded == true) {
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
    if (gamePaused == false && playerdied == false) {
    Player1.move(movement);
    }
    Player1.draw();
    Player1.levelUp();
    Player1.refreshStats();
  }
  
  gameLoaded = true;
  
  if (skillSectionEquipVis == true && foundEnemy == false && attackSkills == false && healSkills == false) {
    skillSelection();
    leftArrowQA.hoverAnim();
    rightArrowQA.hoverAnim();
    buttonQA2.hoverAnim();
    buttonQA1.hoverAnim();
    buttonQA3.hoverAnim();
    buttonQA4.hoverAnim();
    closeButton.hoverAnim();
    
    backgroundQA.draw();
    sectionQA1.draw();
    sectionQA2.draw();
    sectionQA3.draw();
    sectionQA4.draw();
    xpbarQA.draw();
    buttonQA1.draw();
    buttonQA2.draw();
    buttonQA3.draw();
    buttonQA4.draw();
    
    skillName1.draw();
    skillName2.draw();
    skillName3.draw();
    skillName4.draw();
    
    skillDesc1.draw();
    skillDesc2.draw();
    skillDesc3.draw();
    skillDesc4.draw();
    LevelQA.draw();
    closeButton.draw();
    
    image(skillTierIconQA[0],(int) (width/6.5), height/3,100,100);
    image(skillTierIconQA[1],(int) (width/2.85), height/3,100,100);
    image(skillTierIconQA[2],(int) (width/1.82), height/3,100,100);
    image(skillTierIconQA[3],(int) (width/1.35), height/3,100,100);
    
    SideColumnQA.draw();
    rightArrowQA.draw();
    leftArrowQA.draw();
    tabQANumber.draw();
    if (slotSelectionActive == true) {
      SkillSlotS1.hoverAnim();
      SkillSlotS2.hoverAnim();
      SkillSlotS3.hoverAnim();
      SkillSlotS4.hoverAnim();
      backgroundSSS.draw();
      SkillSlotS1.draw();
      SkillSlotS2.draw();
      SkillSlotS3.draw();
      SkillSlotS4.draw();
      if (clickTime+10 <= millis()) {
      slotSelectionLoaded = true;
      }
    }
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
  if (foundEnemy == true && attackSkills == true) {
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
  
  if (!(damageSkillsE[0].getType() == 0)){
  damageButtons[0].hoverAnim();
  int base1X = 0, base1Y = (int)(height/1.55);
  damageButtons[0].draw();
  damageTextLabels[1][0][0].draw();
  damageTextLabels[0][1][0].draw();
  damageTextLabels[0][0][1].draw();
  image(damageButtonIcons[0],base1X+60,base1Y+5,100,100);
  }else {
   damageButtons[0].draw();
  }
  if (!(damageSkillsE[1].getType() == 0)){
  damageButtons[1].hoverAnim();
  int base1X = (int)((width/1.5)/2), base1Y = (int)(height/1.55);
  damageButtons[1].draw();
  damageTextLabels[2][0][0].draw();
  damageTextLabels[0][2][0].draw();
  damageTextLabels[0][0][2].draw();
  image(damageButtonIcons[1],base1X+60,base1Y+5,100,100);
  }else {
   damageButtons[1].draw();
  }
  if (!(damageSkillsE[2].getType() == 0)){
  damageButtons[2].hoverAnim();
  int base1X = 0, base1Y = (int)(height/1.55)+(int)((height/3.5)/2);
  damageButtons[2].draw();
  damageTextLabels[3][0][0].draw();
  damageTextLabels[0][3][0].draw();
  damageTextLabels[0][0][3].draw();
  image(damageButtonIcons[2],base1X+60,base1Y+5,100,100);
  }else {
   damageButtons[2].draw();
  }
   if (!(damageSkillsE[3].getType() == 0)){
  damageButtons[3].hoverAnim();
  int base1X = (int)((width/1.5)/2), base1Y = (int)(height/1.55)+(int)((height/3.5)/2);
  damageButtons[3].draw();
  damageTextLabels[4][0][0].draw();
  damageTextLabels[0][4][0].draw();
  damageTextLabels[0][0][4].draw();
  image(damageButtonIcons[3],base1X+60,base1Y+5,100,100);
  }else {
   damageButtons[3].draw();
  }
  
  }
  if (foundEnemy == true && healSkills == true) {
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
  
    if (!(healSkillsE[0].getType() == 0)){
      healButtons[0].hoverAnim();
      int base1X = 0, base1Y = (int)(height/1.55);
      healButtons[0].draw();
      healTextLabels[1][0][0].draw();
      healTextLabels[0][1][0].draw();
      healTextLabels[0][0][1].draw();
      image(healButtonIcons[0],base1X+60,base1Y+5,100,100);
    }else {
     healButtons[0].draw();
    }
    
    if (!(healSkillsE[1].getType() == 0)){
      healButtons[1].hoverAnim();
      int base1X = (int)((width/1.5)/2), base1Y = (int)(height/1.55);
      healButtons[1].draw();
      healTextLabels[2][0][0].draw();
      healTextLabels[0][2][0].draw();
      healTextLabels[0][0][2].draw();
      image(healButtonIcons[1],base1X+60,base1Y+5,100,100);
    }else {
     healButtons[1].draw();
    }
    
    if (!(healSkillsE[2].getType() == 0)){
      healButtons[2].hoverAnim();
      int base1X = 0, base1Y = (int)(height/1.55)+(int)((height/3.5)/2);
      healButtons[2].draw();
      healTextLabels[3][0][0].draw();
      healTextLabels[0][3][0].draw();
      healTextLabels[0][0][3].draw();
      image(healButtonIcons[2],base1X+60,base1Y+5,100,100);
    }else {
     healButtons[2].draw();
    }
    
    if (!(healSkillsE[3].getType() == 0)){
      healButtons[3].hoverAnim();
      int base1X = (int)((width/1.5)/2), base1Y = (int)(height/1.55)+(int)((height/3.5)/2);
      healButtons[3].draw();
      healTextLabels[4][0][0].draw();
      healTextLabels[0][4][0].draw();
      healTextLabels[0][0][4].draw();
      image(healButtonIcons[3],base1X+60,base1Y+5,100,100);
    }else {
     healButtons[3].draw();
    }
    
  }
  
  if (foundEnemy == true && attackinProgress == true) {
    questionUI();
    background1.draw();
    background2.draw();
    Pstat.draw();
    Estat.draw();
    bottomBar.draw();
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
    
    options[0].hoverAnim();
    options[1].hoverAnim();
    options[2].hoverAnim();
    options[3].hoverAnim();
    submitAnswer.hoverAnim();
    
    question.draw();
    options[0].draw();
    options[1].draw();
    options[2].draw();
    options[3].draw();
    answers[0].drawLeft();
    answers[1].drawLeft();
    answers[2].drawLeft();
    answers[3].drawLeft();
    submitAnswer.draw();
  }
  
}


public void questionUI() {
  if (attackinProgress == true) {
    question = new TextLabels(""+currentQ.getQuestion(),0,(int)(height/1.75),width,height/7,#FFFFFF,20);
    options[0] = new ButtonUI(50,(int)(height/1.5),25,25,selectedX[0],#808080,1,#FF0000);
    answers[0] = new TextLabels(""+currentQ.getOption1(),80,(int)(height/1.47),width,height/7,#FFFFFF,20);
    options[1] = new ButtonUI(50,(int)(height/1.34),25,25,selectedX[1],#808080,1,#FF0000);
    answers[1] = new TextLabels(""+currentQ.getOption2(),80,(int)(height/1.32),width,height/7,#FFFFFF,20);
    options[2] = new ButtonUI(50,(int)(height/1.24),25,25,selectedX[2],#808080,1,#FF0000);
    answers[2] = new TextLabels(""+currentQ.getOption3(),80,(int)(height/1.22),width,height/7,#FFFFFF,20);
    options[3] = new ButtonUI(50,(int)(height/1.14),25,25,selectedX[3],#808080,1,#FF0000);
    answers[3] = new TextLabels(""+currentQ.getOption4(),80,(int)(height/1.12),width,height/7,#FFFFFF,20);
    submitAnswer = new ButtonUI((int)(width/2.2),(int)(height/1.08),100,50,"Submit",#808080,1,#FF0000);
  }
}

public void refreshStats() {
  Pstat = new ButtonUI(0,0,300,100,"Player "+"Lvl: "+Player1.getLvl()+"\n\n\n",#00b300,3,#000000);
  Estat = new ButtonUI(width-350,0,350,100,currentEnemy.getName()+" "+"Lvl: "+currentEnemy.getLvl()+"\n\n\n",#e60000,2,#000000);
  PlayerXP = new progressBar("XP: "+Player1.getCXP()+"/"+Player1.getMXP(),1,new int[] {Player1.getCXP(),Player1.getMXP()},75,25,225,25,#FFFF00);
  PlayerHP = new progressBar("Health: "+Player1.getCHP()+"/"+Player1.getMHP(),1,new int[] {Player1.getCHP(),Player1.getMHP()},75,50,225,25,#FF0000);
  PlayerStamina = new progressBar("Stamina: "+Player1.getStamC()+"/"+Player1.getStamM(),1,new int[] {Player1.getStamC(),Player1.getStamM()},15,75,285,25,#00FF00);
  EnemyXP = new progressBar("XP: "+currentEnemy.getCXP()+"/"+currentEnemy.getMXP(),2,new int[] {currentEnemy.getCXP(),currentEnemy.getMXP()},width-300,25,225,25,#FFFF00);
  EnemyHP = new progressBar("Health: "+currentEnemy.getCHP()+"/"+currentEnemy.getMHP(),2,new int[] {currentEnemy.getCHP(),currentEnemy.getMHP()},width-300,50,225,25,#FF0000);
}

public void combatUI(EnemyMob enemy) {
  Pstat = new ButtonUI(0,0,300,100,"Player "+"Lvl: "+Player1.getLvl()+"\n\n\n",#00b300,3,#000000);
  Estat = new ButtonUI(width-350,0,350,100,enemy.getName()+" "+"Lvl: "+enemy.getLvl()+"\n\n\n",#e60000,2,#000000);
  background1 = new ButtonUI(0,0,width/2,height,"",#4dff4d,1,#000000);
  background2 = new ButtonUI(width-(width/2),0,width/2,height,"",#ff4d4d,1,#000000);
  Player = loadImage("CarbotMarineDR.png" , "png");
  Enemy = loadImage(enemy.getImage(), "png");
  bottomBar = new ButtonUI(0,(int)(height/1.75),width,height/2,"",#000000,1,#000000);
  attackButton = new ButtonUI(width-(int)(width/3),(int)(height/1.55),(int)(width/6),(int)(height/7),"Attack",#FF00FF,1,#000000);
  healButton = new ButtonUI(width-(int)(width/6),(int)(height/1.55),(int)(width/6),(int)(height/7),"Rejuvenators",#00b300,1,#000000);
  runButton = new ButtonUI(width-(int)(width/3),(int)(height/1.27),(int)(width/3),(int)(height/7),"Run",#e60000,1,#000000);
  hoverText = new ButtonUI(0,(int)(height/1.55),(int)(width/1.5),(int)(height/3.5),currentHoverText,#FFFFFF,1,#000000);
  playerPortrait = loadImage(Player1.getBorder(), "png");
  PortraitImages = loadImage("CarbotMarinePortrait.png" , "png");
  enemyPortrait = loadImage(enemy.getBorder(), "png");
  enemyPortraitImages = loadImage(enemy.findBorder(), "png");
  PlayerXP = new progressBar("XP: "+Player1.getCXP()+"/"+Player1.getMXP(),1,new int[] {Player1.getCXP(),Player1.getMXP()},75,25,225,25,#FFFF00);
  PlayerHP = new progressBar("Health: "+Player1.getCHP()+"/"+Player1.getMHP(),1,new int[] {Player1.getCHP(),Player1.getMHP()},75,50,225,25,#FF0000);
  PlayerStamina = new progressBar("Stamina: "+Player1.getStamC()+"/"+Player1.getStamM(),1,new int[] {Player1.getStamC(),Player1.getStamM()},15,75,285,25,#00FF00);
  EnemyXP = new progressBar("XP: "+enemy.getCXP()+"/"+enemy.getMXP(),2,new int[] {enemy.getCXP(),enemy.getMXP()},width-300,25,225,25,#FFFF00);
  EnemyHP = new progressBar("Health: "+enemy.getCHP()+"/"+enemy.getMHP(),2,new int[] {enemy.getCHP(),enemy.getMHP()},width-300,50,225,25,#FF0000);
  
  if (!(damageSkillsE[0].getType() == 0)){
  int base1X = 0, base1Y = (int)(height/1.55), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
  damageButtons[0] = new ButtonUI(0,(int)(height/1.55),(int)((width/1.5)/2),(int)((height/3.5)/2),"",#FFFFFF,1,#000000);
  damageTextLabels[1][0][0] = new TextLabels("Lvl: "+damageSkillsE[0].getLvl(),base1X,base1Y,(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,20);
  damageTextLabels[0][1][0] = new TextLabels("Damage: "+damageSkillsE[0].getDamage()+"\nStamina Cost: "+damageSkillsE[0].getStaminaCost(),(int)(base1X+225),(int)(base1Y+60),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,15);
  damageTextLabels[0][0][1] = new TextLabels(""+damageSkillsE[0].getskillName(),(int)(base1X+200),(int)(base1Y),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,25);
  damageButtonIcons[0] = loadImage(damageSkillsE[0].getIcon(), "png");
  } else {
  damageButtons[0] = new ButtonUI(0,(int)(height/1.55),(int)((width/1.5)/2),(int)((height/3.5)/2),"EMPTY SKILL SLOT",#FFFFFF,1,#000000);
  }
  if (!(damageSkillsE[1].getType() == 0)){
  int base1X = (int)((width/1.5)/2), base1Y = (int)(height/1.55), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
  damageButtons[1] = new ButtonUI((int)((width/1.5)/2),(int)(height/1.55),(int)((width/1.5)/2),(int)((height/3.5)/2),"",#FFFFFF,1,#000000);
  damageTextLabels[2][0][0] = new TextLabels("Lvl: "+damageSkillsE[1].getLvl(),base1X,base1Y,(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,20);
  damageTextLabels[0][2][0] = new TextLabels("Damage: "+damageSkillsE[1].getDamage()+"\nStamina Cost: "+damageSkillsE[1].getStaminaCost(),(int)(base1X+225),(int)(base1Y+60),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,15);
  damageTextLabels[0][0][2] = new TextLabels(""+damageSkillsE[1].getskillName(),(int)(base1X+200),(int)(base1Y),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,25);
  damageButtonIcons[1] = loadImage(damageSkillsE[1].getIcon(), "png");
  } else {
  damageButtons[1] = new ButtonUI((int)((width/1.5)/2),(int)(height/1.55),(int)((width/1.5)/2),(int)((height/3.5)/2),"EMPTY SKILL SLOT",#FFFFFF,1,#000000);
  }
  
  if (!(damageSkillsE[2].getType() == 0)){
  int base1X = 0, base1Y = (int)(height/1.55)+(int)((height/3.5)/2), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
  damageButtons[2] = new ButtonUI(0,(int)(height/1.55)+(int)((height/3.5)/2),(int)((width/1.5)/2),(int)((height/3.5)/2),"",#FFFFFF,1,#000000);
  damageTextLabels[3][0][0] = new TextLabels("Lvl: "+damageSkillsE[2].getLvl(),base1X,base1Y,(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,20);
  damageTextLabels[0][3][0] = new TextLabels("Damage: "+damageSkillsE[2].getDamage()+"\nStamina Cost: "+damageSkillsE[2].getStaminaCost(),(int)(base1X+225),(int)(base1Y+60),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,15);
  damageTextLabels[0][0][3] = new TextLabels(""+damageSkillsE[2].getskillName(),(int)(base1X+200),(int)(base1Y),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,25);
  damageButtonIcons[2] = loadImage(damageSkillsE[2].getIcon(), "png");
  } else {
  damageButtons[2] = new ButtonUI(0,(int)(height/1.55)+(int)((height/3.5)/2),(int)((width/1.5)/2),(int)((height/3.5)/2),"EMPTY SKILL SLOT",#FFFFFF,1,#000000);
  }
  
  if (!(damageSkillsE[3].getType() == 0)){
  int base1X = (int)((width/1.5)/2), base1Y = (int)(height/1.55)+(int)((height/3.5)/2), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
  damageButtons[3] = new ButtonUI((int)((width/1.5)/2),(int)(height/1.55)+(int)((height/3.5)/2),(int)((width/1.5)/2),(int)((height/3.5)/2),"",#FFFFFF,1,#000000);
  damageTextLabels[4][0][0] = new TextLabels("Lvl: "+damageSkillsE[3].getLvl(),base1X,base1Y,(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,20);
  damageTextLabels[0][4][0] = new TextLabels("Damage: "+damageSkillsE[3].getDamage()+"\nStamina Cost: "+damageSkillsE[3].getStaminaCost(),(int)(base1X+225),(int)(base1Y+60),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,15);
  damageTextLabels[0][0][4] = new TextLabels(""+damageSkillsE[3].getskillName(),(int)(base1X+200),(int)(base1Y),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,25);
  damageButtonIcons[3] = loadImage(damageSkillsE[3].getIcon(), "png");
  } else {
  damageButtons[3] = new ButtonUI((int)((width/1.5)/2),(int)(height/1.55)+(int)((height/3.5)/2),(int)((width/1.5)/2),(int)((height/3.5)/2),"EMPTY SKILL SLOT",#FFFFFF,1,#000000);
  }
  
  // seperate healing from attack buttons
  // seperate healing from attack buttons
  
  if (!(healSkillsE[0].getType() == 0)){
    if (healSkillsE[0].getType() == 2) {
      int base1X = 0, base1Y = (int)(height/1.55), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
      healButtons[0] = new ButtonUI(base1X,base1Y,baseSize1X,baseSize1Y,"",#FFFFFF,1,#000000);
      healTextLabels[1][0][0] = new TextLabels("Lvl: "+healSkillsE[0].getLvl(),base1X,base1Y,(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,20);
      healTextLabels[0][1][0] = new TextLabels("Heal Amount: "+healSkillsE[0].getDamage()+"\nStamina Cost: "+healSkillsE[0].getStaminaCost(),(int)(base1X+225),(int)(base1Y+60),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,15);
      healTextLabels[0][0][1] = new TextLabels(""+healSkillsE[0].getskillName(),(int)(base1X+200),(int)(base1Y),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,25);
      healButtonIcons[0] = loadImage(healSkillsE[0].getIcon(), "png");
    } else if (healSkillsE[0].getType() == 3) {
      int base1X = 0, base1Y = (int)(height/1.55), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
      healButtons[0] = new ButtonUI(base1X,base1Y,baseSize1X,baseSize1Y,"",#FFFFFF,1,#000000);
      healTextLabels[1][0][0] = new TextLabels("Lvl: "+healSkillsE[0].getLvl(),base1X,base1Y,(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,20);
      healTextLabels[0][1][0] = new TextLabels("Stamina: "+healSkillsE[0].getDamage()+"\nStamina Cost: "+healSkillsE[0].getStaminaCost(),(int)(base1X+225),(int)(base1Y+60),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,15);
      healTextLabels[0][0][1] = new TextLabels(""+healSkillsE[0].getskillName(),(int)(base1X+200),(int)(base1Y),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,25);
      healButtonIcons[0] = loadImage(healSkillsE[0].getIcon(), "png");
    }
  } else {
      int base1X = 0, base1Y = (int)(height/1.55), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
      healButtons[0] = new ButtonUI(base1X,base1Y,baseSize1X,baseSize1Y,"EMPTY SKILL SLOT",#FFFFFF,1,#000000);
  }
  
  if (!(healSkillsE[1].getType() == 0)){
    if (healSkillsE[1].getType() == 2) {
      int base1X = (int)((width/1.5)/2), base1Y = (int)(height/1.55), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
      healButtons[1] = new ButtonUI(base1X,base1Y,baseSize1X,baseSize1Y,"",#FFFFFF,1,#000000);
      healTextLabels[2][0][0] = new TextLabels("Lvl: "+healSkillsE[1].getLvl(),base1X,base1Y,(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,20);
      healTextLabels[0][2][0] = new TextLabels("Heal Amount: "+healSkillsE[1].getDamage()+"\nStamina Cost: "+healSkillsE[1].getStaminaCost(),(int)(base1X+225),(int)(base1Y+60),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,15);
      healTextLabels[0][0][2] = new TextLabels(""+healSkillsE[1].getskillName(),(int)(base1X+200),(int)(base1Y),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,25);
      healButtonIcons[1] = loadImage(healSkillsE[1].getIcon(), "png");
    } else if (healSkillsE[1].getType() == 3) {
      int base1X = (int)((width/1.5)/2), base1Y = (int)(height/1.55), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
      healButtons[1] = new ButtonUI(base1X,base1Y,baseSize1X,baseSize1Y,"",#FFFFFF,1,#000000);
      healTextLabels[2][0][0] = new TextLabels("Lvl: "+healSkillsE[1].getLvl(),base1X,base1Y,(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,20);
      healTextLabels[0][2][0] = new TextLabels("Stamina: "+healSkillsE[1].getDamage()+"\nStamina Cost: "+healSkillsE[1].getStaminaCost(),(int)(base1X+225),(int)(base1Y+60),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,15);
      healTextLabels[0][0][2] = new TextLabels(""+healSkillsE[1].getskillName(),(int)(base1X+200),(int)(base1Y),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,25);
      healButtonIcons[1] = loadImage(healSkillsE[1].getIcon(), "png");
    }
  } else {
      int base1X = (int)((width/1.5)/2), base1Y = (int)(height/1.55), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
      healButtons[1] = new ButtonUI(base1X,base1Y,baseSize1X,baseSize1Y,"EMPTY SKILL SLOT",#FFFFFF,1,#000000);
  }
  
  if (!(healSkillsE[2].getType() == 0)){
    if (healSkillsE[2].getType() == 2) {
      int base1X = 0, base1Y = (int)(height/1.55)+(int)((height/3.5)/2), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
      healButtons[2] = new ButtonUI(base1X,base1Y,baseSize1X,baseSize1Y,"",#FFFFFF,1,#000000);
      healTextLabels[3][0][0] = new TextLabels("Lvl: "+healSkillsE[2].getLvl(),base1X,base1Y,(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,20);
      healTextLabels[0][3][0] = new TextLabels("Heal Amount: "+healSkillsE[2].getDamage()+"\nStamina Cost: "+healSkillsE[2].getStaminaCost(),(int)(base1X+225),(int)(base1Y+60),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,15);
      healTextLabels[0][0][3] = new TextLabels(""+healSkillsE[2].getskillName(),(int)(base1X+200),(int)(base1Y),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,25);
      healButtonIcons[2] = loadImage(healSkillsE[2].getIcon(), "png");
    } else if (healSkillsE[2].getType() == 3) {
      int base1X = 0, base1Y = (int)(height/1.55)+(int)((height/3.5)/2), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
      healButtons[2] = new ButtonUI(base1X,base1Y,baseSize1X,baseSize1Y,"",#FFFFFF,1,#000000);
      healTextLabels[3][0][0] = new TextLabels("Lvl: "+healSkillsE[2].getLvl(),base1X,base1Y,(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,20);
      healTextLabels[0][3][0] = new TextLabels("Stamina: "+healSkillsE[2].getDamage()+"\nStamina Cost: "+healSkillsE[2].getStaminaCost(),(int)(base1X+225),(int)(base1Y+60),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,15);
      healTextLabels[0][0][3] = new TextLabels(""+healSkillsE[2].getskillName(),(int)(base1X+200),(int)(base1Y),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,25);
      healButtonIcons[2] = loadImage(healSkillsE[2].getIcon(), "png");
    }
  } else {
      int base1X = 0, base1Y = (int)(height/1.55)+(int)((height/3.5)/2), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
      healButtons[2] = new ButtonUI(base1X,base1Y,baseSize1X,baseSize1Y,"EMPTY SKILL SLOT",#FFFFFF,1,#000000);
  }
  
  if (!(healSkillsE[3].getType() == 0)){
    if (healSkillsE[3].getType() == 2) {
      int base1X = (int)((width/1.5)/2), base1Y = (int)(height/1.55)+(int)((height/3.5)/2), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
      healButtons[3] = new ButtonUI(base1X,base1Y,baseSize1X,baseSize1Y,"",#FFFFFF,1,#000000);
      healTextLabels[4][0][0] = new TextLabels("Lvl: "+healSkillsE[3].getLvl(),base1X,base1Y,(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,20);
      healTextLabels[0][4][0] = new TextLabels("Heal Amount: "+healSkillsE[3].getDamage()+"\nStamina Cost: "+healSkillsE[3].getStaminaCost(),(int)(base1X+225),(int)(base1Y+60),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,15);
      healTextLabels[0][0][4] = new TextLabels(""+healSkillsE[3].getskillName(),(int)(base1X+200),(int)(base1Y),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,25);
      healButtonIcons[3] = loadImage(healSkillsE[3].getIcon(), "png");
    } else if (healSkillsE[3].getType() == 3) {
      int base1X = (int)((width/1.5)/2), base1Y = (int)(height/1.55)+(int)((height/3.5)/2), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
      healButtons[3] = new ButtonUI(base1X,base1Y,baseSize1X,baseSize1Y,"",#FFFFFF,1,#000000);
      healTextLabels[4][0][0] = new TextLabels("Lvl: "+healSkillsE[3].getLvl(),base1X,base1Y,(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,20);
      healTextLabels[0][4][0] = new TextLabels("Stamina: "+healSkillsE[3].getDamage()+"\nStamina Cost: "+healSkillsE[3].getStaminaCost(),(int)(base1X+225),(int)(base1Y+60),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,15);
      healTextLabels[0][0][4] = new TextLabels(""+healSkillsE[3].getskillName(),(int)(base1X+200),(int)(base1Y),(int)(baseSize1X/5),(int)(baseSize1Y/4),#000000,25);
      healButtonIcons[3] = loadImage(healSkillsE[3].getIcon(), "png");
    }
  } else {
      int base1X = (int)((width/1.5)/2), base1Y = (int)(height/1.55)+(int)((height/3.5)/2), baseSize1X = (int)((width/1.5)/2), baseSize1Y = (int)((height/3.5)/2);
      healButtons[3] = new ButtonUI(base1X,base1Y,baseSize1X,baseSize1Y,"EMPTY SKILL SLOT",#FFFFFF,1,#000000);
  }
  
  //options[]
  
  
  battleUILoaded = true;
}

public void playerUI() {
  playerStats = new ButtonUI(0,0,300,100,"Player "+"Lvl: "+Player1.getLvl()+"\nXp: "+Player1.getCXP()+"/"+Player1.getMXP()+"\nHealth: "+Player1.getCHP()+"/"+Player1.getMHP()+"\nStamina: "+Player1.getStamC()+"/"+Player1.getStamM(),#964B00,3,#000000);
  attributeMenu = new ButtonUI(0,100,150,25,"Attributes",#00b300,3,#000000);
  skillMenu = new ButtonUI(150,100,150,25,"Manage Skills",#008080,3,#000000);
  pauseButton = new ButtonUI(0,125,300,25,pauseText,#00b300,3,#000000);
  playerPortrait = loadImage(Player1.getBorder(), "png");
  PortraitImages = loadImage("CarbotMarinePortrait.png" , "png");
  PlayerXP = new progressBar("XP: "+Player1.getCXP()+"/"+Player1.getMXP(),1,new int[] {Player1.getCXP(),Player1.getMXP()},75,25,225,25,#FFFF00);
  PlayerHP = new progressBar("Health: "+Player1.getCHP()+"/"+Player1.getMHP(),1,new int[] {Player1.getCHP(),Player1.getMHP()},75,50,225,25,#FF0000);
  PlayerStamina = new progressBar("Stamina: "+Player1.getStamC()+"/"+Player1.getStamM(),1,new int[] {Player1.getStamC(),Player1.getStamM()},15,75,285,25,#00FF00);
}



public void attributesUI() {
  backGroundA = new ButtonUI(width/4,height/4,width/2,height/2,"",#C0C0C0,3,#000000);
  healthA = new ButtonUI((int)(width/1.48),height/3,60,60,"+",#00b300,3,#000000);
  staminaA = new ButtonUI((int)(width/1.48),(int)(height/2.25),60,60,"+",#00b300,3,#000000);
  damageA = new ButtonUI((int)(width/1.48),(int)(height/1.80),60,60,"+",#00b300,3,#000000);
  speedA = new ButtonUI((int)(width/1.48),(int)(height/1.5),60,60,"+",#00b300,3,#000000);
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
  backgroundSM = new ButtonUI((int) (width/9.75),height/4,(int) (width/1.25),height/2,"",#C0C0C0,3,#000000);
  detailBorders[0] = new ButtonUI((int) (width/9.75),height/4,250,(int) (height/2.25),"",#C0C0C0,3,#000000);
  skillTypeNames[0] = new TextLabels("Math",(int) (width/6),(int) (height/3.5),120,40,#0000FF,35);
  skillTypeIcons[0] = loadImage("MathLogo.png", "png");
  skillLevelText[0] = new TextLabels(skillCategories[0].getLvl()+"",(int) (width/6),(int) (height/2.25),120,40,#FFFF00,60);
  mathLvlBar = new progressBar("XP: "+skillCategories[0].getXPC()+"/"+skillCategories[0].getXPM(),1,new int[] {skillCategories[0].getXPC(),skillCategories[0].getXPM()},(int) (width/9.75),(int) (height/1.68),250,40,#FFFF00);
  skillTypeButton[0] = new ButtonUI((int) (width/9.75),(int) (height/1.54),250,75,"Select",#C0C0C0,3,#000000);
  // math
  detailBorders[1] = new ButtonUI((int) (width/2.83),height/4,250,(int) (height/2.25),"",#C0C0C0,3,#000000);
  skillTypeNames[1] = new TextLabels("Science",(int) (width/2.4),(int) (height/3.5),120,40,#FF0000,35);
  skillTypeIcons[1] = loadImage("ScienceLogo.png", "png");
  skillLevelText[1] = new TextLabels(skillCategories[1].getLvl()+"",(int) (width/2.4),(int) (height/2.25),120,40,#FFFF00,60);
  scienceLvlBar = new progressBar("XP: "+skillCategories[1].getXPC()+"/"+skillCategories[1].getXPM(),1,new int[] {skillCategories[1].getXPC(),skillCategories[1].getXPM()},(int) (width/2.83),(int) (height/1.68),250,40,#FFFF00);
  skillTypeButton[1] = new ButtonUI((int) (width/2.83),(int) (height/1.54),250,75,"Select",#C0C0C0,3,#000000);
  // science
  detailBorders[2] = new ButtonUI((int) (width/1.657),height/4,250,(int) (height/2.25),"",#C0C0C0,3,#000000);
  skillTypeNames[2] = new TextLabels("Social Studies",(int) (width/1.487),(int) (height/3.5),120,40,#964B00,35);
  skillTypeIcons[2] = loadImage("socialStudiesLogo.png", "png");
  skillLevelText[2] = new TextLabels(skillCategories[2].getLvl()+"",(int) (width/1.487),(int) (height/2.25),120,40,#FFFF00,60);
  socialStudiesLvlBar = new progressBar("XP: "+skillCategories[2].getXPC()+"/"+skillCategories[2].getXPM(),1,new int[] {skillCategories[2].getXPC(),skillCategories[2].getXPM()},(int) (width/1.657),(int) (height/1.68),250,40,#FFFF00);
  skillTypeButton[2] = new ButtonUI((int) (width/1.657),(int) (height/1.54),250,75,"Select",#C0C0C0,3,#000000);
  // right and left tabs
  sideColumS = new ButtonUI((int) (width/1.171),height/4,50,(int) (height/2),"",#FF0000,3,#000000);
  leftArrowS = new ButtonUI((int) (width/1.171),height/4,50,50,"<",#FF0000,3,#000000);
  rightArrowS = new ButtonUI((int) (width/1.171),(int) (height/1.467),50,50,">",#FF0000,3,#000000);
  currentPage = new TextLabels(pageNumber+"",(int) (width/1.171),height/4,50,(int) (height/2),#FFFFFF,60);
  //English
  detailBorders[3] = new ButtonUI((int) (width/9.75),height/4,250,(int) (height/2.25),"",#C0C0C0,3,#000000);
  skillTypeNames[3] = new TextLabels("English",(int) (width/6),(int) (height/3.5),120,40,#0000FF,35);
  skillTypeIcons[3] = loadImage("EnglishIcon.png", "png");
  skillLevelText[3] = new TextLabels(skillCategories[3].getLvl()+"",(int) (width/6),(int) (height/2.25),120,40,#FFFF00,60);
  englishLvlBar = new progressBar("XP: "+skillCategories[3].getXPC()+"/"+skillCategories[3].getXPM(),1,new int[] {skillCategories[3].getXPC(),skillCategories[3].getXPM()},(int) (width/9.75),(int) (height/1.68),250,40,#FFFF00);
  skillTypeButton[3] = new ButtonUI((int) (width/9.75),(int) (height/1.54),250,75,"Select",#C0C0C0,3,#000000);
  manageSkillsMenuLoaded = true;
}

public void skillSelection() {
  skillTierIconQA[0] = loadImage("Tier0Icon.png", "png");
  skillTierIconQA[1] = loadImage("Tier1Icon.png", "png");
  skillTierIconQA[2] = loadImage("Tier2Icon.png", "png");
  skillTierIconQA[3] = loadImage("Tier3Icon.png", "png");
  backgroundQA = new ButtonUI((int) (width/9.75),height/4,(int) (width/1.2),height/2,"",#C0C0C0,3,#000000); 
  SideColumnQA = new ButtonUI((int) (width/1.129),height/4,50,(int) (height/2),"",#FF0000,3,#000000);
  leftArrowQA = new ButtonUI((int) (width/1.129),height/4,50,50,"<",#FF0000,3,#000000);
  rightArrowQA = new ButtonUI((int) (width/1.129),(int) (height/1.467),50,50,">",#FF0000,3,#000000);
  tabQANumber = new TextLabels(SkillPageNumber+"",(int) (width/1.129),height/4,50,(int) (height/2),#FFFFFF,60);
  sectionQA1 = new ButtonUI((int) (width/9.75),height/4,(int)(((int) (width/1.25))/4),(int) (height/2.25),"",#C0C0C0,3,#000000);
  sectionQA2 = new ButtonUI((int) (width/3.33),height/4,(int)(((int) (width/1.25))/4),(int) (height/2.25),"",#C0C0C0,3,#000000);
  sectionQA3 = new ButtonUI((int) (width/2),height/4,(int)(((int) (width/1.25))/4),(int) (height/2.25),"",#C0C0C0,3,#000000);
  sectionQA4 = new ButtonUI((int) (width/1.44),height/4,(int)(((int) (width/1.25))/4),(int) (height/2.25),"",#C0C0C0,3,#000000);
  buttonQA1 = new ButtonUI((int) (width/9.75),(int)(height/1.626),(int)(((int) (width/1.25))/4),50,"Equip",#008080,3,#00FF00);
  LevelQA = new ButtonUI((int) (width/9.75),(int) (height/1.464),100,50,"Lvl: "+skillCategories[currentTopic].getLvl(),#C0C0C0,3,#0BFFFF);
  closeButton = new ButtonUI((int) (width/1.129),(int)(height/5.45),50,50,"X",#FF0000,3,#FFFFFF);
  
  xpbarQA = new progressBar("XP: "+skillCategories[currentTopic].getXPC()+"/"+skillCategories[currentTopic].getXPM(),1,new int[] {skillCategories[currentTopic].getXPC(),skillCategories[currentTopic].getXPM()},(int) (width/4.95),(int) (height/1.464),(int) (width/1.45),50,#FFFF00);
    if (skillCategories[currentTopic].getLvl() >= 5) {
    buttonQA2 = new ButtonUI((int) (width/3.33),(int)(height/1.626),(int)(((int) (width/1.25))/4),50,"Equip",#39FFFF,3,#00FF00);
    }else {
    buttonQA2 = new ButtonUI((int) (width/3.33),(int)(height/1.626),(int)(((int) (width/1.25))/4),50,"Locked",#008080,3,#FF0000);
    }
    if (skillCategories[currentTopic].getLvl() >= 10) {
    buttonQA3 = new ButtonUI((int) (width/2),(int)(height/1.626),(int)(((int) (width/1.25))/4),50,"Equip",#39FFFF,3,#00FF00);
    }else {
    buttonQA3 = new ButtonUI((int) (width/2),(int)(height/1.626),(int)(((int) (width/1.25))/4),50,"Locked",#008080,3,#FF0000);
    }
    if (skillCategories[currentTopic].getLvl() >= 15) {
    buttonQA4 = new ButtonUI((int) (width/1.44),(int)(height/1.626),(int)(((int) (width/1.25))/4),50,"Equip",#39FFFF,3,#00FF00);
    }else {
    buttonQA4 = new ButtonUI((int) (width/1.44),(int)(height/1.626),(int)(((int) (width/1.25))/4),50,"Locked",#008080,3,#FF0000);
    }
  
  if (currentTopic == 0) {
  
  skillName1 = new TextLabels("Addition",(int) (width/9.75),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  skillName2 = new TextLabels("Multiplication",(int) (width/3.33),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  skillName3 = new TextLabels("Division",(int) (width/2),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  skillName4 = new TextLabels("PEMDAS",(int) (width/1.44),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  
  skillDesc1 = new TextLabels("Level: 0\nDamage: 20\nStamina Cost: 10",(int) (width/9.75),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  skillDesc2 = new TextLabels("Level: 5\nDamage: 35\nStamina Cost: 15",(int) (width/3.33),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  skillDesc3 = new TextLabels("Level: 10\nDamage: 50\nStamina Cost: 25",(int) (width/2),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  skillDesc4 = new TextLabels("Level: 15\nDamage: 100\nStamina Cost: 35",(int) (width/1.44),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);

  skillSectionEquipLoaded = true;
  } else if (currentTopic == 1) {
  
  skillName1 = new TextLabels("Cells",(int) (width/9.75),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  skillName2 = new TextLabels("DNA",(int) (width/3.33),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  skillName3 = new TextLabels("Planets",(int) (width/2),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  skillName4 = new TextLabels("Elements",(int) (width/1.44),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  
  skillDesc1 = new TextLabels("Level: 0\nHeal Amount: 20\nStamina Cost: 10",(int) (width/9.75),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  skillDesc2 = new TextLabels("Level: 5\nHeal Amount: 35\nStamina Cost: 15",(int) (width/3.33),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  skillDesc3 = new TextLabels("Level: 10\nHeal Amount: 50\nStamina Cost: 25",(int) (width/2),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  skillDesc4 = new TextLabels("Level: 15\nHeal Amount: 100\nStamina Cost: 35",(int) (width/1.44),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  
  skillSectionEquipLoaded = true;
  } else if (currentTopic == 2) {
  
  skillName1 = new TextLabels("Presidents",(int) (width/9.75),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  skillName2 = new TextLabels("States",(int) (width/3.33),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  skillName3 = new TextLabels("Dates",(int) (width/2),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  skillName4 = new TextLabels("Dictators",(int) (width/1.44),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  
  skillDesc1 = new TextLabels("Level: 0\nStamina: 20\nStamina Cost: 10",(int) (width/9.75),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  skillDesc2 = new TextLabels("Level: 5\nStamina: 35\nStamina Cost: 15",(int) (width/3.33),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  skillDesc3 = new TextLabels("Level: 10\nStamina: 50\nStamina Cost: 25",(int) (width/2),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  skillDesc4 = new TextLabels("Level: 15\nStamina: 100\nStamina Cost: 35",(int) (width/1.44),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  
  skillSectionEquipLoaded = true;
  } else if (currentTopic == 3) {
  
  skillName1 = new TextLabels("Grammar",(int) (width/9.75),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  skillName2 = new TextLabels("Vocab",(int) (width/3.33),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  skillName3 = new TextLabels("Figurative Language",(int) (width/2),height/4,(int)(((int) (width/1.25))/4),50,#000000,20);
  skillName4 = new TextLabels("Characters",(int) (width/1.44),height/4,(int)(((int) (width/1.25))/4),50,#000000,25);
  
  skillDesc1 = new TextLabels("Level: 0\nDamage: 20\nStamina Cost: 10",(int) (width/9.75),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  skillDesc2 = new TextLabels("Level: 5\nDamage: 35\nStamina Cost: 15",(int) (width/3.33),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  skillDesc3 = new TextLabels("Level: 10\nDamage: 50\nStamina Cost: 25",(int) (width/2),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  skillDesc4 = new TextLabels("Level: 15\nDamage: 100\nStamina Cost: 35",(int) (width/1.44),height/2,(int)(((int) (width/1.25))/4),50,#000000,20);
  
  skillSectionEquipLoaded = true;
  }
}

public void skillSlotSelection(int x, int y) {
  backgroundSSS = new ButtonUI(x,y,200,100,"",#C0C0C0,3,#000000);
  SkillSlotS1 = new ButtonUI(x,y,100,50,"Slot 1",#C0C0C0,3,#000000);
  SkillSlotS2 = new ButtonUI(x+100,y,100,50,"Slot 2",#C0C0C0,3,#000000);
  SkillSlotS3 = new ButtonUI(x,y+50,100,50,"Slot 3",#C0C0C0,3,#000000);
  SkillSlotS4 = new ButtonUI(x+100,y+50,100,50,"Slot 4",#C0C0C0,3,#000000);
}

public void getQuestionStatistics() {
  if (healSkill == false) {
  correctAnswer = (int) random(0,4);
  currentQ = new QuestionPool(damageSkillsE[currentDSkill].getIcon(),damageSkillsE[currentDSkill].getLvl());
  currentQ.questionAnswer(correctAnswer);
  } else {
  correctAnswer = (int) random(0,4);
  currentQ = new QuestionPool(healSkillsE[currentDSkill].getIcon(),healSkillsE[currentDSkill].getLvl()); 
  currentQ.questionAnswer(correctAnswer);
  }
}

public void mouseReleased() {
  if (battleUILoaded == true && foundEnemy == true) {
  if (battleUILoaded == true && attackinProgress == false && runButton.isClicked()) {
    //add other conditions so you cant click the button when its hidden
    foundEnemy = false;
    healSkills = false;
    attackSkills = false;
    currentEnemy.setAlive(false);
    currentEnemy.setDeathTime(minute());
    battleUILoaded = false;
  }
    if (battleUILoaded == true && attackinProgress == false && attackButton.isClicked()) {
      healSkills = false;
      attackSkills = true;
    }
    if (battleUILoaded == true && attackinProgress == false && healButton.isClicked()) {
      attackSkills = false;
      healSkills = true;
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
    if (gamePaused == false && playerdied == false) {
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
    skillSectionEquipVis = true;
    currentTopic = 0;
    
  }
  if (manageSkillsMenuVis == true && manageSkillsMenuLoaded == true && skillTypeButton[1].isClicked() && foundEnemy == false && pageNumber == 1) {
    manageSkillsMenuLoaded = false;
    manageSkillsMenuVis = false;
    skillSectionEquipVis = true;
    currentTopic = 1;
  }
  if (manageSkillsMenuVis == true && manageSkillsMenuLoaded == true && foundEnemy == false && skillTypeButton[2].isClicked() && pageNumber == 1) {
    manageSkillsMenuLoaded = false;
    manageSkillsMenuVis = false;
    skillSectionEquipVis = true;
    currentTopic = 2;
  }
  if (manageSkillsMenuVis == true && manageSkillsMenuLoaded == true && foundEnemy == false && skillTypeButton[3].isClicked() && pageNumber == 2) {
    manageSkillsMenuLoaded = false;
    manageSkillsMenuVis = false;
    skillSectionEquipVis = true;
    currentTopic = 3;
  }
  if (skillSectionEquipVis == true && skillSectionEquipLoaded == true && foundEnemy == false && closeButton.isClicked()) {
    skillSectionEquipVis = false;
    skillSectionEquipLoaded = false;
    slotSelectionActive = false;
    slotSelectionLoaded = false;
  }
  //skill slot stuff
  if (skillSectionEquipVis == true && skillSectionEquipLoaded == true && foundEnemy == false && buttonQA1.isClicked()) {
    slotSelectionLoaded = false;
    skillSlotSelection(mouseX,mouseY);
    clickTime = millis();
    slotSelectionActive = true;
    currentSkillSelected = 1;
  }
  if (skillSectionEquipVis == true && skillSectionEquipLoaded == true && foundEnemy == false && skillCategories[currentTopic].getLvl() >= 5 && buttonQA2.isClicked()) {
    slotSelectionLoaded = false;
    skillSlotSelection(mouseX,mouseY);
    clickTime = millis();
    slotSelectionActive = true;
    currentSkillSelected = 2;
  }
  if (skillSectionEquipVis == true && skillSectionEquipLoaded == true && foundEnemy == false && skillCategories[currentTopic].getLvl() >= 10 && buttonQA2.isClicked()) {
    slotSelectionLoaded = false;
    skillSlotSelection(mouseX,mouseY);
    clickTime = millis();
    slotSelectionActive = true;
    currentSkillSelected = 3;
  }
  if (skillSectionEquipVis == true && skillSectionEquipLoaded == true && foundEnemy == false && skillCategories[currentTopic].getLvl() >= 15 && buttonQA2.isClicked()) {
    slotSelectionLoaded = false;
    skillSlotSelection(mouseX,mouseY);
    clickTime = millis();
    slotSelectionActive = true;
    currentSkillSelected = 4;
  }
  //select skill menu topic button
  
  //skill slot select
  if (skillSectionEquipVis == true && skillSectionEquipLoaded == true && foundEnemy == false && slotSelectionLoaded == true && SkillSlotS1.isClicked()) {
    System.out.println("test");
    slotSelectionActive = false;
    slotSelectionLoaded = false;
   if (currentTopic == 0 || currentTopic == 3) {
     damageSkillsE[0].equipSkill(currentTopic,currentSkillSelected);
   } else if (currentTopic == 1 || currentTopic == 2) {
     healSkillsE[0].equipSkill(currentTopic,currentSkillSelected);
   }
  }
  if (skillSectionEquipVis == true && skillSectionEquipLoaded == true && foundEnemy == false && slotSelectionLoaded == true && SkillSlotS2.isClicked()) {
    slotSelectionActive = false;
    slotSelectionLoaded = false;
   if (currentTopic == 0 || currentTopic == 3) {
     damageSkillsE[1].equipSkill(currentTopic,currentSkillSelected);
   } else if (currentTopic == 1 || currentTopic == 2) {
     healSkillsE[1].equipSkill(currentTopic,currentSkillSelected);
   }
  }
  if (skillSectionEquipVis == true && skillSectionEquipLoaded == true && foundEnemy == false && slotSelectionLoaded == true && SkillSlotS3.isClicked()) {
    slotSelectionActive = false;
    slotSelectionLoaded = false;
   if (currentTopic == 0 || currentTopic == 3) {
     damageSkillsE[2].equipSkill(currentTopic,currentSkillSelected);
   } else if (currentTopic == 1 || currentTopic == 2) {
     healSkillsE[2].equipSkill(currentTopic,currentSkillSelected);
   }
  }
  if (skillSectionEquipVis == true && skillSectionEquipLoaded == true && foundEnemy == false && slotSelectionLoaded == true && SkillSlotS4.isClicked()) {
    slotSelectionActive = false;
    slotSelectionLoaded = false;
   if (currentTopic == 0 || currentTopic == 3) {
     damageSkillsE[3].equipSkill(currentTopic,currentSkillSelected);
   } else if (currentTopic == 1 || currentTopic == 2) {
     healSkillsE[3].equipSkill(currentTopic,currentSkillSelected);
   }
  }
  //skill slot select
  
  //use skills
  //use skills
  
  if (attackinProgress == true && options[0].isClicked() == true) {
   selectedX[0] = "X";
   selectedX[1] = "";
   selectedX[2] = "";
   selectedX[3] = "";
   currentSelected = 0;
  }
  if (attackinProgress == true && options[1].isClicked() == true) {
   selectedX[0] = "";
   selectedX[1] = "X";
   selectedX[2] = "";
   selectedX[3] = "";
   currentSelected = 1;
  }
  if (attackinProgress == true && options[2].isClicked() == true) {
   selectedX[0] = "";
   selectedX[1] = "";
   selectedX[2] = "X";
   selectedX[3] = "";
   currentSelected = 2;
  }
  if (attackinProgress == true && options[3].isClicked() == true) {
   selectedX[0] = "";
   selectedX[1] = "";
   selectedX[2] = "";
   selectedX[3] = "X";
   currentSelected = 3;
  }
  if (attackinProgress == true && submitAnswer.isClicked()) {
    if (currentSelected == correctAnswer) {
      attackinProgress = false;
      Player1.damageEnemy(currentEnemy,damageSkillsE[currentDSkill]);
      refreshStats();
      damageSkillsE[currentDSkill].giveXP(skillCategories);
      skillCategories[damageSkillsE[currentDSkill].getskillType()].levelUp();
      if (currentEnemy.getCHP() <= 0) {
        foundEnemy = false;
        healSkills = false;
        attackSkills = false;
        currentEnemy.setAlive(false);
        currentEnemy.setDeathTime(minute());
        battleUILoaded = false;
        Player1.setXP(10);
      }
    }else {
      attackinProgress = false;
      Player1.damageplayer(damageSkillsE[currentDSkill]);
      refreshStats();
      damageSkillsE[currentDSkill].giveXP(skillCategories);
      skillCategories[damageSkillsE[currentDSkill].getskillType()].levelUp();
     if (Player1.getCHP() <= 0) {
        foundEnemy = false;
        healSkills = false;
        attackSkills = false;
        currentEnemy.setAlive(false);
        currentEnemy.setDeathTime(minute());
        //Player1.setAlive(false);
        //Player1.setDeathTime(minute());
        battleUILoaded = false;
        playerdied = true;
     }
    }
  }
  
  if (attackinProgress == false && attackSkills == true && battleUILoaded == true && !(damageSkillsE[0].getType() == 0) && damageButtons[0].isClicked()) {
    currentDSkill = 0;
    healSkill = false;
    getQuestionStatistics();
    attackinProgress = true;
  }
  if (attackinProgress == false && attackSkills == true && battleUILoaded == true && !(damageSkillsE[1].getType() == 0) && damageButtons[1].isClicked()) {
    currentDSkill = 1;
    healSkill = false;
    getQuestionStatistics();
    attackinProgress = true;
  }
  if (attackinProgress == false && attackSkills == true && battleUILoaded == true && !(damageSkillsE[2].getType() == 0) && damageButtons[2].isClicked()) {
    currentDSkill = 2;
    healSkill = false;
    getQuestionStatistics();
    attackinProgress = true;
  }
  if (attackinProgress == false && attackSkills == true && battleUILoaded == true && !(damageSkillsE[3].getType() == 0) && damageButtons[3].isClicked()) {
    currentDSkill = 3;
    healSkill = false;
    getQuestionStatistics();
    attackinProgress = true;
  }
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
