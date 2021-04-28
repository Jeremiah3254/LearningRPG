boolean gamePaused = false;
String pauseText = "Pause Game";
boolean foundEnemy = false, battleUILoaded = false, attackSkills = false, healSkills = false;
boolean attributesMenuVis = false, attributesLoaded = false, manageSkillsMenuVis = false;
String currentHoverText = "";
EnemyMob currentEnemy;
boolean[] movement = new boolean[4];
//CarbotMarine.png
//BossImage.png
//EnemySprite.png
Player Player1;
// player ui
ButtonUI playerStats, attributeMenu, skillMenu, pauseButton;
ButtonUI backGroundA, healthA, staminaA, damageA, speedA;
TextLabels attributeTitle, currentPoints, healthD, staminaD, damageD, speedD;
// player ui
// combat ui
ButtonUI Pstat,Estat,background1,background2,bottomBar,attackButton,healButton,runButton,hoverText;
// combat ui
EnemyMob[] Enemies = new EnemyMob[2000];
PImage background,Player,Enemy;


public void setup() {
  frameRate(60);
  //fullScreen();
  size(1000,750);
  System.out.println(width/2);
  System.out.println(height/2);
  background = loadImage("Ground.png", "png");
  //Check
  Player1 = new Player(new int[] {100,10},new int[] {100,100},new int[] {100,100},1,0,width/2-30,height/2-30,25);
  //Check
  for (int i = 0; i<Enemies.length; i++) {
    Enemies[i] = new EnemyMob("Spider",1,new int[] {0,10},new int[] {100,100},(int) random(-width,width)*10,(int) random(-height,height)*10);
  }
  //fullScreen();
}

public void draw() {
  //background(loadImage("Ground2.png"));
  //background(200);
  image(background,0,0,width,height);
  int x = (width/2)-30;
  int y = (height/2)-30;

  //translate(x-Player1.getX(),y-Player1.getY()); 
  
  for (EnemyMob Enemy : Enemies) {
    int boundsLeft = Player1.getX() - (width/2)-30;
    int boundsRight = Player1.getX() + (width/2)+30;
    int boundsTop = Player1.getY() - (height/2)-30;
    int boundsBottom = Player1.getY() + (height/2)+30;
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
  //b1.move(movement);
  //b2.move(movement);
  if (Player1.isAlive() == true) {
    //Player1.move(movement);
    if (gamePaused == false) {
    Player1.move(movement);
    }
    Player1.draw();
    Player1.levelUp();
  }
  
  if (foundEnemy == false && attackSkills == false && healSkills == false) {
    playerUI();
    attributeMenu.hoverAnim();
    skillMenu.hoverAnim();
    pauseButton.hoverAnim();
    pauseButton.draw();
    playerStats.draw();
    attributeMenu.draw();
    skillMenu.draw();
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
  hoverText.drawL(currentHoverText);
  image(Player,0+25,200,150,150);
  image(Enemy,width-175,200,150,150);
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
  image(Player,0+25,200,150,150);
  image(Enemy,width-175,200,150,150);
  }
  
}


public void combatUI(EnemyMob enemy) {
  Pstat = new ButtonUI(0,0,300,125,"Player "+"Lvl: "+Player1.getLvl()+"\nXp: "+Player1.getCXP()+"/"+Player1.getMXP()+"\nHealth: "+Player1.getCHP()+"/"+Player1.getMHP()+"\nStamina: "+Player1.getStamC()+"/"+Player1.getStamM(),#00b300,3);
  Estat = new ButtonUI(width-300,0,300,125,"Enemy "+"Lvl: "+enemy.getLvl()+"\nXp: "+enemy.getCXP()+"/"+enemy.getMXP()+"\nHealth: "+enemy.getCHP()+"/"+enemy.getMHP(),#e60000,2);
  background1 = new ButtonUI(0,0,width/2,height,"",#4dff4d,1);
  background2 = new ButtonUI(width-(width/2),0,width/2,height,"",#ff4d4d,1);
  Player = loadImage("CarbotMarineDR.png" , "png");
  Enemy = loadImage(enemy.getImage(), "png");
  bottomBar = new ButtonUI(0,(int)(height/1.75),width,height/2,"",#000000,1);
  attackButton = new ButtonUI(width-(int)(width/3),(int)(height/1.55),(int)(width/6),(int)(height/7),"Attack",#FF00FF,1);
  healButton = new ButtonUI(width-(int)(width/6),(int)(height/1.55),(int)(width/6),(int)(height/7),"Rejuvenators",#00b300,1);
  runButton = new ButtonUI(width-(int)(width/3),(int)(height/1.27),(int)(width/3),(int)(height/7),"Run",#e60000,1);
  hoverText = new ButtonUI(0,(int)(height/1.55),(int)(width/1.5),(int)(height/3.5),currentHoverText,#FFFFFF,1);
  battleUILoaded = true;
}

public void playerUI() {
  playerStats = new ButtonUI(0,0,300,100,"Player "+"Lvl: "+Player1.getLvl()+"\nXp: "+Player1.getCXP()+"/"+Player1.getMXP()+"\nHealth: "+Player1.getCHP()+"/"+Player1.getMHP()+"\nStamina: "+Player1.getStamC()+"/"+Player1.getStamM(),#964B00,3);
  attributeMenu = new ButtonUI(0,100,150,25,"Attributes",#00b300,3);
  skillMenu = new ButtonUI(150,100,150,25,"Manage Skills",#008080,3);
  pauseButton = new ButtonUI(0,125,300,25,pauseText,#00b300,3);
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
  attributesLoaded = true;
}

public void mouseReleased() {
  if (foundEnemy == true && battleUILoaded == true) {
  if (runButton.isClicked()) {
    //add other conditions so you cant click the button when its hidden
    foundEnemy = false;
    attackSkills = false;
    currentEnemy.setAlive(false);
    battleUILoaded = false;
  }
    if (attackButton.isClicked()) {
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
