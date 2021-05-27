public class QuestionPool {
  int tier, correctAnswer, placeholder;
  String question = "";
  String topic;
  String[] options = new String[4];
  String[][] MathTierQ = new String [10][10];
  String[][] MathTierA = new String [10][10];

  public QuestionPool (String topic, int tier) {
    this.topic = topic;
    this.tier = tier;
  }


  public void questionAnswer(int correctAnswer) {
    //this.InitializeVariables();
    int num1, num2, num3, num4, num5, num6;
    int decision1, decision2, decision3, decision4, decision5;
    if (this.topic == "MathLogo.png") {
      if (this.tier == 0) {
        num1 = (int) random(-9999, 9999);
        num2 = (int) random(-9999, 9999);
        question = "what is "+num1+" + "+num2+".";
        this.placeholder = num1+num2;
        for (int i = 0; i<4; i++) {
          this.options[i] = ""+(int) random(-9999, 9999);
        }
        int answer = num1+num2;
        this.options[correctAnswer] = ""+answer;
      } else if (this.tier == 5) {
        num1 = (int) (random(-500, 500));
        num2 = (int) (random(-700, 700));
        question = "what is "+num1+" * "+num2+".";
        this.placeholder = num1*num2;
        for (int i = 0; i<4; i++) {
          this.options[i] = ""+(int) random(-9999, 9999);
        }
        int answer = num1*num2;
        this.options[correctAnswer] = ""+answer;
      } else if (this.tier == 10) {
        num1 = (int) random(-999999, 999999);
        num2 = (int) random(-999999, 999999);
        question = "what is "+num1+" / "+num2+".";
        this.placeholder = num1/num2;
        for (int i = 0; i<4; i++) {
          this.options[i] = ""+(int) random(-9999, 9999);
        }
        int answer = num1/num2;
        this.options[correctAnswer] = ""+answer;
      } else if (this.tier == 15) {
        decision1 = (int) (random(0, 3));
        String[] type = new String[4];
        type[0] = "+";
        type[1] = "-";
        type[2] = "*";
        type[3] = "/";
        decision2 = (int) (random(0, 3));
        decision3 = (int) (random(0, 3));
        decision4 = (int) (random(0, 3));
        decision5 = (int) (random(0, 3));
        num1 = (int) (random(500, 500));
        num2 = (int) (random(500, 500));
        num3 = (int) (random(500, 500));
        if (decision1 == 1) {
          question = "what is "+num1+" "+type[decision2]+" "+num2+" "+type[decision3]+" "+num3;
          this.placeholder = (int) num1*num2;
        }
      }
    } else if (this.topic == "ScienceLogo.png") {
      if (this.tier == 0) {
      }
    } else if (this.topic == "socialStudiesLogo.png") {
      if (this.tier == 0) {
      }
    } else if (this.topic == "EnglishIcon.png") {
      if (this.tier == 0) {
        int questionLA = (int) random(0, 6);
        String[] QList = new String[7];
        String[] AList = new String[7];
        QList[0] = "What does a comma do?";
        QList[1] = "What does a semicolon do?";
        QList[2] = "What does a period indicate?";
        QList[3] = "When do you indent a paragraph?";
        QList[4] = "How do you greet someone in a letter?";
        QList[5] = "How are apostrophes used?";
        QList[6] = "What are slashes used for?";

        AList[0] = "Separates words, phrases, or idea in order to prevent someone misreading.";
        AList[1] = "Link two independent clauses";
        AList[2] = "The ending of a sentence";
        AList[3] = "At the beginning";
        AList[4] = "To Whom it may Concern";
        AList[5] = "Used for omission of letters";
        AList[6] = "Used for separation";
        this.question = QList[questionLA];
        for (int i = 0; i<4; i++) {
          int[] randomS = new int[4];
          randomS[0] = (int) random(0, 6);
          randomS[1] = (int) random(0, 6);
          randomS[2] = (int) random(0, 6);
          randomS[3] = (int) random(0, 6);
          for (int q = 0; q<4; q++) {
             while (randomS[q] == questionLA) {
              randomS[q] = (int) random(0, 6);
            }
          }

          this.options[i] = AList[randomS[i]];
        }
        this.options[correctAnswer] = AList[questionLA];
      }
    } else if (this.tier == 5) {
      int questionLA = (int) random(0, 6);
      String[] QList = new String[7];
      String[] AList = new String[7];
      QList[0] = "What is the definition of cahoots?"; 
      QList[1] = "What is the definition of unpunctual?";
      QList[2] = "What is the definition of redolent?";
      QList[3] = "What is the definition of amorphous?";
      QList[4] = "What is the definition of provincial?";
      QList[5] = "What is the definition of addenda?";
      QList[6] = "What is the definition of expostulation?";

      AList[0] = "a secret partnership.";
      AList[1] = "not happening or doing something at the agreed or proper time.";
      AList[2] = "strongly reminiscent or suggestive of.";
      AList[3] = "without a clearly defined shape or form.";
      AList[4] = "limited in outlook; unsophisticated.";
      AList[5] = "an item of additional material, typically omissions, added at the end of a book or other publication.";
      AList[6] = "to reason earnestly with a person for purposes of dissuasion or remonstrance.";
      this.question = QList[questionLA];
      for (int i = 0; i<4; i++) {
        int[] randomS = new int[4];
        randomS[0] = (int) random(0, 6);
        randomS[1] = (int) random(0, 6);
        randomS[2] = (int) random(0, 6);
        randomS[3] = (int) random(0, 6);
        for (int q = 0; q<4; q++) {
          while (randomS[q] == questionLA) {
            randomS[q] = (int) random(0, 6);
          }
        }

        this.options[i] = AList[randomS[i]];
      }
      this.options[correctAnswer] = AList[questionLA];
    
  } else if (this.tier == 10) {
  int questionLA = (int) random(0, 6);
  String[] QList = new String[7];
  String[] AList = new String[7];
  QList[0] = "What is a simile?";
  QList[1] = "What is a metaphor?";
  QList[2] = "What is a hyperbole?";
  QList[3] = "What is alliteration?";
  QList[4] = "What is dramatic irony?";
  QList[5] = "What is diction?";
  QList[6] = "What is onomatopoeia?";

  AList[0] = "comparison of one thing with another thing of a different kind.";
  AList[1] = "word or phrase is applied to an object or action to which it is not literally applicable.";
  AList[2] = "exaggerated statements or claims not meant to be taken literally.";
  AList[3] = "the occurrence of the same letter or sound at the beginning.";
  AList[4] = "the full significance of a character's words or actions are clear to the audience or reader although unknown to the character.";
  AList[5] = "the choice and use of words and phrases in speech or writing.";
  AList[6] = "the formation of a word from a sound associated with what is named (e.g. cuckoo, sizzle ).";
  this.question = QList[questionLA];
  for (int i = 0; i<4; i++) {
    int[] randomS = new int[4];
    randomS[0] = (int) random(0, 6);
    randomS[1] = (int) random(0, 6);
    randomS[2] = (int) random(0, 6);
    randomS[3] = (int) random(0, 6);
    for (int q = 0; q<4; q++) {
      while (randomS[q] == questionLA) {
        randomS[q] = (int) random(0, 6);
      }
    }

    this.options[i] = AList[randomS[i]];
  }
  
  this.options[correctAnswer] = AList[questionLA];

} else if (this.tier == 15) {
  int questionLA = (int) random(0, 6);
  String[] QList = new String[7];
  String[] AList = new String[7];
  QList[0] = "Who is Tom’s enemy? (Tom & Jerry Show)";
  QList[1] = "Who is the most religious person in The Things They Carried?";
  QList[2] = "Who is the main character of the Cat in the Hat?";
  QList[3] = "Who dies first in The Things They Carried.";
  QList[4] = "Who is the narrator of the Great Gatsby?";
  QList[5] = "Who wins the Hunger Games?";
  QList[6] = "Which character dies first in the Hunger Games?";

  AList[0] = "Jerry";
  AList[1] = "Kiowa";
  AList[2] = "The Cat";
  AList[3] = "Ted Lavender";
  AList[4] = "Nick Carraway";
  AList[5] = "Katniss and Peeta";
  AList[6] = "Amber";
  this.question = QList[questionLA];
  for (int i = 0; i<4; i++) {
    int[] randomS = new int[4];
    randomS[0] = (int) random(0, 6);
    randomS[1] = (int) random(0, 6);
    randomS[2] = (int) random(0, 6);
    randomS[3] = (int) random(0, 6);
    for (int q = 0; q<4; q++) {
      while (randomS[q] == questionLA) {
        randomS[q] = (int) random(0, 6);
      }
    }

    this.options[i] = AList[randomS[i]];
  }
  this.options[correctAnswer] = AList[questionLA];
}
}


public void solveLongProblem(int length, int[] num, String[] sign) {

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

public String getQuestion() {
  return this.question;
}

public String getOption1() {
  return this.options[0];
}

public String getOption2() {
  return this.options[1];
}

public String getOption3() {
  return this.options[2];
}

public String getOption4() {
  return this.options[3];
}
//public void InitializeVariables() {
// <Topic> ~Math

//Questions

// <Topic> ~Science
//}

}
