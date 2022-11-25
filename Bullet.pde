public class Bullet {
int pX = 567;
int pY = 339;
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

void drawBullet(int xMove, int yMove){
fill(#F251D8);
noStroke();
circle(dx, dy, 20);
this.dx += xMove;
this.dy += yMove;

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
