ArrayList<Bullet> b = new ArrayList<Bullet>(); 
Account a1 = new Account(); 
player p1 = new player();
Realm r1 = new Realm();
int Wsize = 50;
int growth = 1;
int xPos;
int yPos;
int bulletTimer = 0;

void setup () {
  size(1025,775); 
  p1.setup();
  r1.setup();
}

void draw () {
  frameRate(60);
  background(0);
//  System.out.println(p1.posX);
//  System.out.println(p1.posY);
  welcomeScreen();
  a1.DrawOptions();
  a1.MouseInput();
  a1.display();
  if(a1.Page.equals("Realm")){ 
  bulletTimer++;
  if(mousePressed && bulletTimer > 10){
   xPos = mouseX;
   yPos = mouseY;
   Bullet b1 = new Bullet(xPos, yPos);
   b.add(b1);
   bulletTimer = 0;
  }
  r1.displayBeach();
  p1.displayPlayer(bulletTimer);
  r1.pushBack();
  for(int x = 0; x < b.size(); x++){ //bullet display
  b.get(x).update();
  b.get(x).drawBullet(); 
  if(b.get(x).timer() == true){
  b.remove(x);
  x--;
      }
    }
  for(int x = 0; x < r1.e.size(); x++){ //enemy display
      //e.get(x).();
      r1.e.get(x).displayEnemy(p1.posX, p1.posY);  
      r1.e.get(x).moveEnemy();
    for(int j = 0; j < b.size(); j++){ //bullet enemy collision
      PVector v = new PVector((b.get(j).dx) - (r1.e.get(x).x1 + 32), (b.get(j).dy) - (r1.e.get(x).y1 + 32));  
      if(v.mag() < 32){
          b.remove(j);
          r1.e.remove(x);
        }
      }
    }
  }
}

void welcomeScreen () {
  if(a1.Page.equals("menu")){
  textSize(Wsize);
  fill(255);
  text("Welcome!", 500-Wsize*2, 200); 
  }
  
  if(Wsize <= 50){
  growth = 1;
  }
  if(Wsize >= 70){
  growth = -1;
  }
  Wsize += growth;
}

void mouseReleased(){
  if(a1.Page.equals("menu")){
  a1.mouseReleased();
  }
  if(a1.Page.equals("Realm")){
  p1.mouseReleased();
   }
}

void mousePressed(){
   if(a1.Page.equals("Realm")){
   p1.mousePressed();
   }
 }

void keyPressed(){
  a1.keyPressed();
  p1.keyPressed();
}

void keyReleased(){
  p1.keyReleased();
}
