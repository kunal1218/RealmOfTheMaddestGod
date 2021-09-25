public class Enemy{
PImage pR;
PImage pL;
PImage pR2;
PImage pL2;
int x; //enemy world pos
int y;
int x1; //player world pos
int y1;
PVector v;
int pX = 517;
int pY = 389;
PImage currentImage;  
int sec = second();
String Direction;
int Timer = 0;
PImage[] leftImages;
PImage[] rightImages;

  public Enemy(int x, int y, String Direction){
    this.x = x;
    this.y = y;
    this.Direction = Direction;
    this.setup();
  }
  
  void setup(){
    currentImage = loadImage("PirateL.png");
    this.pL = loadImage("PirateL.png");  
    this.pR = loadImage("PirateR.png"); 
    this.pL2 = loadImage("PirateL2.png"); 
    this.pR2 = loadImage("PirateR2.png");     
    this.leftImages = new PImage[2];
    this.leftImages[0] = this.pL;
    this.leftImages[1] = this.pL2;
    this.rightImages = new PImage[2];
    this.rightImages[0] = this.pR;
    this.rightImages[1] = this.pR2;
    //displayEnemy(x,y);
  }
  
  void displayEnemy(int x1, int y1){
    this.x1 = x1 + x;
    this.y1 = y1 + y;
    this.Timer++;
    
    image(currentImage, this.x1, this.y1);  
    
     if((this.x1) < 485){
         if(this.Timer == 30){
          this.currentImage = this.rightImages[1];   
      }
          this.currentImage = this.rightImages[0];
    }
        else{
         if(this.Timer == 30){
          this.currentImage = this.leftImages[1];   
      }
          this.currentImage = this.leftImages[0];
    }
        
    if(this.Timer == 30){
      this.Timer = 0;
      }
    }
  
   void moveEnemy(){
     v = new PVector(pX - (x1), pY - (y1)); 
     if(v.mag() <  1000 && v.mag() > 200){
          x += v.normalize().x * 5;
          y += v.normalize().y * 5;
      }
    }
  }
