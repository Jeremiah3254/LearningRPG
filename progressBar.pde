public class progressBar {
int type;
int x,y,w,h;
int[] progress = new int[2];
String textTitle;
color c;
public progressBar(String textTitle, int type, int[] progress, int x, int y, int w, int h,color c) {
  this.progress = progress;
  this.type = type;
  this.textTitle = textTitle;
  this.c = c;
  this.x = x;
  this.y = y;
  this.w = w;
  this.h = h;
}
 public void updateProgress(int[] p) {
  this.progress = p;

 }

 public void draw() {
  double calculatePercent = (((float)this.w/100.0)*(((float)progress[0]/(float)progress[1])*100.0));
  double calculateSpacing = ((float)this.w-calculatePercent);
  if (this.type == 1) {
  stroke(0);
  fill(255,255,255);
  rect(this.x,this.y,this.w,this.h);
  fill(this.c);
  rect(this.x,this.y,(int)calculatePercent,this.h);
  
  fill(0,0,0);
  textAlign(CENTER,CENTER);
  textSize(15);
  text(this.textTitle,this.x+this.w/2,this.y+this.h/2);
  } else if (this.type == 2) {
  stroke(0);
  fill(255,255,255);
  rect(this.x,this.y,this.w,this.h);
  fill(this.c);
  rect(this.x+(int)calculateSpacing,this.y,(int)calculatePercent,this.h);
  
  fill(0,0,0);
  textAlign(CENTER,CENTER);
  textSize(15);
  text(this.textTitle,this.x+this.w/2,this.y+this.h/2);
  }
}


}
