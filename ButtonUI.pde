import java.awt.Rectangle;

public class ButtonUI {
  public int x, y, w, h,align;
  public color c;
  public String title, text;
  public Rectangle clickArea;
  
  public ButtonUI(int x, int y, int w, int h, String title, color c, int align) {
    this.align = align;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.title = title;
    this.c = c;
    this.clickArea = new Rectangle(x,y,w,h);
  }
  
  public void setText(String text) {
    this.text = text;
  }
  
  public void draw() {
    fill(c);
    rect(x,y,w,h);
    
    fill(0);
    if (this.align == 1) {
    textAlign(CENTER,CENTER);
    } else if (this.align == 2) {
    textAlign(CENTER,LEFT);
    }else if (this.align == 3) {
    textAlign(CENTER,RIGHT);
    }
    text(title,x+w/2,y+h/2);
  }
  
  public void move(boolean[] direction) {
    if (direction[0] == true) {
      this.y = y-25; 
    }
    if (direction[1] == true) {
      this.x = x-25;
    }
    if (direction[2] == true) {
      this.y = y+25;
    }
    if (direction[3] == true) {
      this.x = x+25;
    }
  }
  
  public boolean isClicked() {
    return this.clickArea.contains(mouseX,mouseY);
  }
}
