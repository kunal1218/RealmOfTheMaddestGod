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
   int x = 485;
   int y = 357;
   int totalRight = 0;
   int posX = 0;
   int posY = 0;
   int xPos;
   int yPos;
   int mil;
   int imageNum = 0;
   boolean m = false;
   PImage[] leftImages;
   PImage[] rightImages;
   PImage[] backImages;
   PImage[] frontImages;
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
     imgSR = loadImage("WizardRightShoot.png");
     imgSL = loadImage("WizardLeftShoot.png");
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
      
     rect(480,357,5,5);
     
     
     image(currentImage, x,y);
     x = 485;
     if(up == true){
       currentImage = backImages[imageNum];
       posY += 5;
     }
     if(down == true){
       currentImage = frontImages[imageNum];
       posY -= 5;  
     }
     if(left == true){
      currentImage = leftImages[imageNum];
       posX += 5;
     }
     if(right == true){
       currentImage = rightImages[imageNum];
       posX -= 5;
       }
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
       x = x - 33;
       
      }
    }
  }
}
   
   void keyPressed() {
   if(key == 'w'){
     up = true;
     down = false;
   }
   if(key == 'a'){
     left = true;
     right = false;
   }
   if(key == 'd'){
    right = true; 
    left = false;
   }
   if(key == 's'){
    down = true;
    up = false;
     }
   }
   
   void keyReleased(){
   if(key == 'w'){
     currentImage = imgB;
     up = false;
     
     }
   if(key == 'a'){
   currentImage = imgL;
   left = false;
   }
   if(key == 'd'){
   currentImage = imgR;
   right = false;
     }
   if(key == 's'){
    currentImage = imgF;
    down = false;
   }
   }
}
