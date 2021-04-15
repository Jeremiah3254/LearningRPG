public class ButtonUI {
  int x,y,sizeX,sizeY;
  String picture;
  public ButtonUI(int x,int y,int sizeX,int sizeY,String picture) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.picture = picture;
  }
  
  public boolean interactClick() {
    if (mouseX >= this.x && mouseX <= this.x+this.sizeX && mouseY >= this.y && mouseY <= this.y+this.sizeY) {
     return true;
    }
    return false;
  }
  
  public void draw() {
    image(loadImage(this.picture, "png"),x,y,this.sizeX,this.sizeY);    
  }
}
