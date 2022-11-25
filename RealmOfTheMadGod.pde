ArrayList<Bullet> b = new ArrayList<Bullet>(); 
ArrayList<EnemyBullet> a = new ArrayList<EnemyBullet>();
ArrayList<Loot> m = new ArrayList<Loot>();
Account a1 = new Account(); 
player p1 = new player();
Realm r1 = new Realm();
Menu m1 = new Menu();
int Wsize = 50;
int growth = 1;
int xPos;
int yPos;
int bulletTimer = 0;
Loot nearestLoot = null;

void setup(){
  size(1285,725); //1225, 775
  p1.setup();
  r1.setup();
  m1.setup();
  DropTable.fillTable();
}

void draw(){
  frameRate(60);
  background(0);
//System.out.println(p1.posX);
//System.out.println(p1.posY);
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
  r1.pushBack();
  r1.displayBeach();
  nearestLoot = null;
  for(int r = 0; r < m.size(); r++){
    m.get(r).Itype();
    m.get(r).displayLoot(p1.posX, p1.posY);
    if(Math.abs(485 - (m.get(r).X) + 16) < 50){
       if(Math.abs(387 - (m.get(r).Y) - 20) < 50){
         nearestLoot = m.get(r);
         
      }
    }
  }
  p1.displayPlayer(bulletTimer);
  
 
  
  for(int x = 0; x < b.size(); x++){ //bullet display
    b.get(x).update();
    b.get(x).drawBullet(p1.xMove, p1.yMove); 
  if(b.get(x).timer() == true){
    b.remove(x);
    x--;
      }
    }
    
  for(int x = 0; x < r1.e.size(); x++){ //enemy display
      r1.e.get(x).displayEnemy(p1.posX, p1.posY);  
      r1.e.get(x).moveEnemy();
      
     if(r1.e.get(x).enemyAttack()){ // enemy bullets; get x and direction (+- 5 up, down, left, right, based on players current movement)
       EnemyBullet a1 = new EnemyBullet(r1.e.get(x).x1, r1.e.get(x).y1, p1.posX, p1.posY); 
       a.add(a1);
     }
      
   for(int j = 0; j < b.size(); j++){ //bullet enemy collision
      PVector v = new PVector((b.get(j).dx) - (r1.e.get(x).x1 + 32), (b.get(j).dy) - (r1.e.get(x).y1 + 32));  
      if(v.mag() < 32){
          b.remove(j);
          Loot l = r1.e.get(x).dropLoot();
        if(l != null){
          m.add(l);
        }
          r1.e.remove(x);
          break;
        }
      }
    }
    
    for(int q = 0; q < a.size(); q++){ //enemy bullet display
        a.get(q).drawBullet(p1.xMove, p1.yMove);
        a.get(q).update();
        if(a.get(q).timer() == true){
          a.remove(q);
          q--;
        }   
      }
  m1.DisplayMenu(); 
  if(nearestLoot != null){
    nearestLoot.displayBagMenu();
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
