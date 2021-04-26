import java.awt.Rectangle;

public class ButtonUI {
  public int x, y, w, h,align;
  public int strokeA = 153;
  public color c,old;
  public boolean hovered;
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
    stroke(strokeA);
    fill(c);
    rect(x,y,w,h);
    fill(0);
    if (this.align == 1) {
    textAlign(CENTER,CENTER);
    } else if (this.align == 2) {
    textAlign(CENTER,CENTER);
    }else if (this.align == 3) {
    textAlign(CENTER,CENTER);
    }
    textSize(15);
    text(title,x+w/2,y+h/2);
  }
  
  public void drawL(String hover) {
    fill(c);
    rect(x,y,w,h);
    
    fill(0);
    if (this.align == 1) {
    textAlign(CENTER,CENTER);
    } else if (this.align == 2) {
    textAlign(CENTER,CENTER);
    }else if (this.align == 3) {
    textAlign(CENTER,CENTER);
    }
    textSize(20);
    text(hover,x+w/2,y+h/2);
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
  
  public void hoverAnim() {
  if (mouseX >= this.x && mouseX <= this.x+this.w && mouseY >= this.y && mouseY <= this.y+this.h) {
     if (this.hovered == false) {
       this.old = this.c;
       this.strokeA = 255;
     }
     this.hovered = true;
     this.c = #808080;
   }else if (this.hovered == true) {
    this.hovered = false;
    this.c = this.old;
    this.strokeA = 153;
   }
}
  
  public boolean hoverOver() {
   if (mouseX >= this.x && mouseX <= this.x+this.w && mouseY >= this.y && mouseY <= this.y+this.h) {
     return true;
   }
   return false;
  }
  
  public boolean isClicked() {
    return this.clickArea.contains(mouseX,mouseY);
  }
}
