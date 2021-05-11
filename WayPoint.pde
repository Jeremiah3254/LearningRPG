public class WayPoint {
 float segLength;
 float x = (width/2), y = (height/2);
 int red,green,blue;
 String biomeName;
 public WayPoint(String biomeName,float segL,int r,int g, int b) {
 this.biomeName = biomeName;
 this.segLength = segL;
 this.red = r;
 this.green = g;
 this.blue = b;
 }
 
 public void draw(Biome b,float x2, float y2) {
   float dx = (b.getX()+750) - this.x;
   float dy = (b.getY()+750) - this.y;
   float angle1 = atan2(dy,dx);
   
   float tx = (b.getX()+750) - cos(angle1) * segLength;
   float ty = (b.getY()+750) - sin(angle1) * segLength;
   dx = tx - x2;
   dy = ty - y2;
   
   segment(x, y, angle1);
   
 }
 
 public void segment(float x, float y, float a) {
  pushMatrix(); 
  translate(x,y);
  rotate(a);
  stroke(this.red,this.green,this.blue);
  fill(0,0,0);
  textSize(15);
  text(this.biomeName,75,-10);
  line(0, 0, this.segLength,0);
  popMatrix();
 }
  
}
