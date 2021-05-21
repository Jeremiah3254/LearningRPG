public class QuestionPool {
  int topic, tier, correctAnswer,placeholder;
  String question;
  String option1,option2,option3,option4;
  String[][] MathTierQ = new String [10][10];
  String[][] MathTierA = new String [10][10];
  
  public QuestionPool (int topic, int tier,int correctAnswer, String question) {
  this.question = question;
  this.correctAnswer = correctAnswer;
  this.topic = topic;
  this.tier = tier;
  }
  
  public void questionAnswer(int correctAnswer) {
    this.InitializeVariables();
    int num1,num2,num3,num4,num5,num6;
    int decision1,decision2,decision3,decision4,decision5;
    if (this.topic == 1) {
      if (this.tier == 0) {
        num1 = (int) random(-9999,9999);
        num2 = (int) random(-9999,9999);
        question = "what is "+num1+" + "+num2+".";
        this.placeholder = num1+num2;
      }else if (this.tier == 1) {
        num1 = (int) (random(-500,500));
        num2 = (int) (random(-700,700));
        question = "what is "+num1+" * "+num2+".";
        this.placeholder = num1*num2;
      }else if (this.tier == 2) {
        num1 = (int) random(-999999,999999);
        num2 = (int) random(-999999,999999);
        question = "what is "+num1+" / "+num2+".";
        this.placeholder = num1/num2;
      }else if (this.tier == 3) {
        decision1 = (int) (random(0,3));
        String[] type = new String[4];
        type[0] = "+";
        type[1] = "-";
        type[2] = "*";
        type[3] = "/";
        decision2 = (int) (random(0,3));
        decision3 = (int) (random(0,3));
        decision4 = (int) (random(0,3));
        decision5 = (int) (random(0,3));
        num1 = (int) (random(500,500));
        num2 = (int) (random(500,500));
        num3 = (int) (random(500,500));
        if (decision1 == 1) {
        question = "what is "+num1+" "+type[decision2]+" "+num2+" "+type[decision3]+" "+num3;
        this.placeholder = (int) num1*num2;
        }
      
      }
    }else if (this.topic == 2) {
      if (this.tier == 0) {
        
      }
    }
  }

public void solveLongProblem(int length,int[] num,String[] sign) {
  
  for (int i = 0; i < num.length; i++) {
    for (int q = 0; q<sign.length; q++) {
     if (sign[q] == "*" || sign[q] == "/") {
        /*if ()
     } else {
     
     }*/
    }
  }
}
}

public void InitializeVariables() {
  // <Topic> ~Math
  
  //Questions

  // <Topic> ~Science
}

}
