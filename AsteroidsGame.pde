
SpaceShip bob;
stars bling;
boolean isAccel = false;
boolean isRotatingLeft = false;
boolean isRotatingRight = false;
boolean isHyperSpace = false;
ArrayList<Asteroid> rocks = new ArrayList<Asteroid>();
public void setup() 
{
  size(500, 500);
  bob = new SpaceShip();
  bling = new stars();
  for(int i = 0; i < 10; i++)
  {
    rocks.add(new Asteroid());
  }
}
public void draw() 
{
  background(0);
  bling.show();
  bob.move();
  for(int i = 0; i < rocks.size(); i++)
  {
    rocks.get(i).show();
    rocks.get(i).move();
  }
  if(isHyperSpace == false) {bob.show();}
  if(isAccel == true) {
    bob.accelerate(0.07);
  }
  if(isRotatingLeft == true) {bob.rotate(-5);}
  if(isRotatingRight == true) {bob.rotate(5);}
  if(isHyperSpace == true)
  {
    bob.setX((int)(Math.random() * 500));
    bob.setY((int)(Math.random() * 500));
    bob.setPointDirection((int)(Math.random() * 361));
    bob.setDirectionX(0);
    bob.setDirectionY(0);
  }
}
public void keyPressed()
{
  if(key == 'w') {isAccel = true;}
  if(key == 'a') {isRotatingLeft = true;}
  if(key == 'd') {isRotatingRight = true;}
  if(key == 'e') {isHyperSpace = true;}

}
public void keyReleased()
{
  if(key == 'w') {isAccel = false;}
  if(key == 'a') {isRotatingLeft = false;}
  if(key == 'd') {isRotatingRight = false;}
  if(key == 'e') {isHyperSpace = false;}
}
public class stars
{
  int x[];
  int y[];
  int size[];
  int rgb[];
  public stars()
  {
    x = new int[300];
    y = new int[300];
    size = new int[300];
    rgb = new int[300];
    for(int i = 0; i < 300; i++)
    {
      x[i] = (int)(Math.random() * 500);
      y[i] = (int)(Math.random() * 500);
      size[i] = (int)(Math.random() * 4) + 1;
      rgb[i] = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    }
  }
  public void show()
  {
    for(int i = 0; i< 300; i++)
    {
      stroke(rgb[i]);
      strokeWeight(size[i]);
      point(x[i],y[i]);
    }
    strokeWeight(1);
  }
}
class SpaceShip extends Floater  
{   
    public SpaceShip(){
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = -2;
      yCorners[3] =  0;
      myColor = color(0,255,0);
      myCenterX = 250;
      myCenterY = 250;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
    }
    public void setX(int x) {myCenterX = x;}
    public int getX() {return (int)myCenterX;}
    public void setY(int y) {myCenterY = y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) {myDirectionX = x;}
    public double getDirectionX() {return myDirectionX;}
    public void setDirectionY(double y) {myDirectionY = y;}
    public double getDirectionY() {return myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}
}
class Asteroid extends Floater
{
  protected int rotSpeed;
  protected int rocksIndex;
  public Asteroid()
  {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;
    yCorners[0] = -8;
    xCorners[1] = 7;
    yCorners[1] = -8;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] = -11;
    yCorners[4] = 8;
    xCorners[5] = -5;
    yCorners[5] = 0;
    myColor = color(255);
    myCenterX = (int)(Math.random() * width) + 1;
    myCenterY = (int)(Math.random() * height) + 1;
    myDirectionX = (int)(Math.random() * 5) - 2;
    myDirectionY = (int)(Math.random() * 5) - 2;
    rotSpeed = (int)(Math.random() * 3) + 1;
  }
  public void move()
  {
    for(int i = 0; i < rocks.size(); i++)
    {
      if(dist((float)rocks.get(i).getX(), (float)rocks.get(i).getY(), (float)bob.getX(), (float)bob.getY()) <= 20)
      {
        rocks.remove(i);
      }
    } 
      rotate(rotSpeed);
      myCenterX += myDirectionX;    
      myCenterY += myDirectionY;     

      if(myCenterX >width)
      {     
        myCenterX = 0;    
      }    
      else if (myCenterX<0)
      {     
        myCenterX = width;    
      }    
      if(myCenterY >height)
      {    
        myCenterY = 0;    
      }
      else if (myCenterY < 0)
      {     
        myCenterY = height;    
      }   
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
  public void setrotSpeed(int x) {rotSpeed = x;}
  public int getrotSpeed() {return rotSpeed;}
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();
  abstract public void setY(int y);  
  abstract public int getY();
  abstract public void setDirectionX(double x);
  abstract public double getDirectionX();
  abstract public void setDirectionY(double y);  
  abstract public double getDirectionY();
  abstract public void setPointDirection(int degrees);
  abstract public double getPointDirection();

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //Fixes bug where ship goes to fast
    if(myDirectionX >= 500 || myDirectionY >= 500)
    {
      myDirectionX = 5;
      myDirectionY = 5;
      myCenterX = 250;
      myCenterY = 250;
    }
    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
}