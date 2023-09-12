class Effect1
{
  //
  //All credit for this effect goes to Reinhard Langner 
  //http://www.openprocessing.org/sketch/100965
   
   
  private Ball[] aBall;
  private int MAX_BALL = 300;
  private int MAX_BALL_AGE = 150;
  private float MAX_BALL_SIZE = 30;
  
  public Effect1()
  { 
    
    aBall = new Ball[MAX_BALL];
    for (int i=0; i<MAX_BALL; i++) {
      aBall[i] = new Ball(i, i);
    }
  } 
   
  public class Ball {
    PVector pos;
    PVector vel;
    int age;
    float size;
    float sizeVel;
    float sizeMax;
    color BallColor;
     
    Ball(float x, float y) {
      pos = new PVector(x, y, 0);
      vel = new PVector(random(-1,1), random(-1,1));
      age = int(random(20, MAX_BALL_AGE));
      size = 0;
      sizeMax = random(10,MAX_BALL_SIZE);
      sizeVel = sizeMax / (age/2);
       
      int r = (int)random(0,255);
      int g = (int)random(0,255);
      int b = (int)random(0,255);
      BallColor = color( r,g,b, random(0,255) );
       
    }
   
    boolean update() {
      pos.add(vel);
       
      // reflect at the edges
      if (pos.x < size) {
        vel.x = -vel.x;
        pos.x = size;
      }
      if (pos.x > (width-size)) {
        vel.x = -vel.x;
        pos.x = width-size;
      }
      if (pos.y < size) {
        vel.y = -vel.y;
        pos.y = size;
      }
      if (pos.y > (height-size)) {
        vel.y = -vel.y;
        pos.y = height-size;
      }   
       
      size += sizeVel;
      if (size > sizeMax) {
         sizeVel = -sizeVel;
         size = sizeMax;
      }
      age--;
      return age > 0;
    }
   
    void draw() {
      fill(BallColor);
      stroke(255);
      strokeWeight(1);
      ellipse(pos.x, pos.y, size, size);
    }
     
  }
   
  public void  draw()
  {  
    // update balls
    int idxBall = -1;
    for (int i=0; i<MAX_BALL; i++) {
      if (aBall[i].update() == false) {
        idxBall = i;
        aBall[i] = new Ball(random(0,width), random(0,height));
      }
    }  
      
    for (int i=0; i<MAX_BALL; i++) {
      aBall[i].draw();
    }
  }
}
