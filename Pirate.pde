public class Pirate extends Enemy{
  
    public Pirate(int x, int y, String Direction){
      super(x, y, Direction);
      this.x = x;
      this.y = y;
      
      if(Direction.equals("right")){
        this.Direction = "left";
        }
        else{
        this.Direction = "right";
        }
       this.setup();
      }

    void setup(){
       this.currentImage = loadImage("PirateL.png");
       this.pL = loadImage("PirateL.png");  
       this.pR = loadImage("PirateR.png");
       this.pL2 = loadImage("PirateL2.png"); 
       this.pR2 = loadImage("PirateR2.png");    
    }
}
