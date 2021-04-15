public class ButtonUI {
  int x,y,sizeX,sizeY;
  String picture,buttonText;
  public ButtonUI(String buttonText,int x,int y,int sizeX,int sizeY,String picture) {
    this.buttonText = buttonText;
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.picture = picture;
  }
  
  public boolean interactClick() {
    boolean result = false
    if (mouseX >= this.x && mouseX <= this.x+this.sizeX && mouseY >= this.y && mouseY <= this.y+this.sizeY) {
     result = true;
    }
    return result;
  }
  
  public void draw() {
    image(loadImage(this.picture, "png"),x,y,this.sizeX,this.sizeY); 
    textSize(32);
    text(buttonText, x+sizeX/2, y+sizeY/2);
  }
}
