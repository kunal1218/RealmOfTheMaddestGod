public class Bullet {
int pX = 517;
int pY = 389;
int dx;
int dy;
PVector v;

Bullet(int xPos, int yPos){
dx = pX;
dy = pY;
v = new PVector(xPos - pX, yPos - pY);
v.normalize();
v.mult(10);

}
  
void update(){
dx += v.x;
dy += v.y;
}

void drawBullet(){
//fill(#EA1C1C);
noStroke();
circle(dx, dy, 20);

}

boolean timer(){
if(dx - pX > 500 || pX - dx > 500 || pY - dy > 500 || dy - pY > 500 ){
  return true;
  }
  
else{
  return false;
  }
}
}
