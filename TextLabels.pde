import java.awt.Rectangle;
public class TextLabels {
  int x,y,w,h,scale;
  color c;
  String textTitle;
  public TextLabels(String textTitle, int x, int y, int w, int h, color c,int scale) {
    this.textTitle = textTitle;
    this.scale = scale;
    this.c = c;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void draw() {
    //rect(x,y,w,h);
    textAlign(CENTER,CENTER);
    textSize(scale);
    fill(c);
    text(textTitle,x+w/2,y+h/2);
  }
  
  public void drawLeft() {
    //rect(x,y,w,h);
    textAlign(LEFT,CENTER);
    textSize(scale);
    fill(c);
    text(textTitle,x,y);
  }
  
}
