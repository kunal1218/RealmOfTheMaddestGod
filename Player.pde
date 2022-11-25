public class player {
   PImage imgF;
   PImage imgL;
   PImage imgR;
   PImage imgB;
   PImage imgSR;
   PImage imgSL;
   PImage imgR2;
   PImage imgL2;
   PImage imgB2;
   PImage imgB3;
   PImage imgF2;
   PImage imgF3;
   PImage currentImage;
   boolean up = false;
   boolean left = false;
   boolean right = false;
   boolean down = false;
   int x = 520;
   int y = 319;
   int totalRight = 0;
   int posX = 0;
   int posY = 0;
   int mil;
   int speed = 5;
   int imageNum = 0;
   boolean m = false;
   PImage[] leftImages;
   PImage[] rightImages;
   PImage[] backImages;
   PImage[] frontImages;
   int xMove = 0;
   int yMove = 0;
   int tS;
   
   void setup(){
     mil = millis();
     tS = 0;
     currentImage = loadImage("Wizard Front.png");
     imgF = loadImage("Wizard Front.png");
     imgL = loadImage("Wizard Left.png");
     imgR = loadImage("Wizard Right.png");
     imgB = loadImage("Wizard Back.png");
     imgB2 = loadImage("WizardBack2.png");
     imgB3 = loadImage("WizardBack3.png");
     imgF2 = loadImage("WizardFront2.png");
     imgF3 = loadImage("WizardFront3.png");
     imgL2 = loadImage("WizardLeft2.png");
     imgR2 = loadImage("WizardRight2.png");
   //  imgSR = loadImage("Obama.png");
   //  imgSL = loadImage("Obama3.png");
     leftImages = new PImage[2];
     leftImages[0] = imgL;
     leftImages[1] = imgL2;
     rightImages = new PImage[2];
     rightImages[0] = imgR;
     rightImages[1] = imgR2;
     backImages = new PImage[2];
     backImages[1] = imgB3;
     backImages[0] = imgB2;
     frontImages = new PImage[2];
     frontImages[0] = imgF3;
     frontImages[1] = imgF2;     
   }
   
   void totalMovement(){     
   }
   
   void mousePressed(){
   m = true;
   }
   
   void mouseReleased(){
   m = false;  
   }
   
   void displayPlayer(int bulletTimer) {
     mil = millis();
      if(mil > tS + 400){
        imageNum += 1;
        imageNum %= 2;
        tS = mil;
      }
      
   //  fill(255); 
   //  rect(990,660,30,30);   
     image(currentImage, x,y);
     
     
   //  System.out.println(posY);
   //  System.out.println(posX);
    
     xMove = 0;
     yMove = 0;
     
     if(up == true){
       currentImage = backImages[imageNum];
       yMove += speed; 
     }
     if(down == true){
       currentImage = frontImages[imageNum];
       yMove -= speed;  
     }
     if(left == true){
      currentImage = leftImages[imageNum];
       xMove += speed;
     }
     if(right == true){
       currentImage = rightImages[imageNum];
       xMove -= speed;
       }
    
    posY += yMove;
    posX += xMove;
       
    if(m == true){
      if(mouseX > 545){
         if(bulletTimer < 6){
           currentImage = imgR; 
            
        }
     else{
        currentImage = imgSR;
      }
    }
    if(mouseY > 510){
      currentImage = imgF;
    }
    if(mouseY <= 237){
      currentImage = imgB;
    }
    
    if(mouseX <= 480){
      if(bulletTimer < 6){
       currentImage = imgL;  
        }
     else{
       currentImage = imgSL;
      // x = x - 33;
      }                                                                                                              
    }
  } 
}
   
   void keyPressed() {
   if(key == 'w'){
     up = true;
   //  down = false;
   }
   if(key == 'a'){
     left = true;
   //  right = false;
   }
   if(key == 'd'){
    right = true; 
   // left = false;
   }
   if(key == 's'){
    down = true;
   // up = false;
     }
   }
   
   void keyReleased(){
   if(key == 'w'){
     up = false;
   }
   
   if(key == 'a'){
   left = false;
   }
   
   if(key == 'd'){
   right = false;
   }
   
   if(key == 's'){
    down = false;
   }
   
  }
}
