public class Realm {
   int m = 0;
   int col = 10000 + m;
   int row = 10000 + m;
   Tile [][] myArray = new Tile[row][col]; 
   HashMap<String, PImage> map = new HashMap<String,PImage>();
   ArrayList<Enemy> e = new ArrayList<Enemy>(); 
   PImage img;
   PImage img2;
   PImage img3;
   PImage img4;
   PImage img5; 
   PImage img7;
   PImage img8;
   PImage img6;
   PImage img9;
   PImage img10;
   PImage img11;
   PImage img12;
   PImage img13; 
   PImage img14;
   PImage img15;
   PImage img16;
   int edge = 0;
   int r; 
   int px1 = 4990;
   int px2 = 5010;
   int py1 = 4990;
   int py2 = 5010;
   int currentTile = 1;
   int biomeCounter = 10;
   float noiseScale = 0.03;
   
   void setup(){
     Biomes("");
   } 
     
   void displayBeach(){
   if(a1.Page.equals("Realm")){
     for(int i = px1; i < px2;i++){
         for(int j = py1; j < py2; j++){         
           image(myArray[i][j].images,(-4995+i)*64+p1.posX,(-4995+j)*65+p1.posY); 
          } 
         }
       }
     } 
 
  void Biomes(String direction){
     //Left = new Biome
     img = loadImage("Tile.png"); 
     img2 = loadImage("Tile2.png"); 
     img3 = loadImage("Tile3.png"); 
     img4 = loadImage("Tile5.png"); 
     img5 = loadImage("Tile6.png"); 
     img6 = loadImage("Tile7.png"); 
     img7 = loadImage("Tile8.png");
     img8 = loadImage("Tile9.png");
     img9 = loadImage("Tile10.png");
     img10 = loadImage("Tile11.png");
     img11 = loadImage("Tile12.png");
     img12 = loadImage("Tile13.png");
     img13 = loadImage("Tile14.png");
     img14 = loadImage("Tile15.png");
     img15 = loadImage("Tile16.png");
     img16 = loadImage("Tile17.png");
     map.put("Sand", img);
     map.put("Forest", img2);
     map.put("Stone", img9);
     map.put("ForestSandLR", img3);
     map.put("SandForestLR", img4);
     map.put("ForestSandUD", img5);
     map.put("SandForestUD", img6);
     map.put("SandStoneUD", img7);
     map.put("StoneSandUD", img8);
     map.put("SandStoneLR", img10);
     map.put("StoneSandLR", img11);
     map.put("ForestSandRD", img12);
     map.put("StoneSandRD", img13);
     map.put("SandForestRD", img15);
     map.put("SandStoneRD", img16);
     map.put("SandForestLD", img14); 
    
     for(int i = px1; i < px2; i++){
       for(int j = py1; j < py2; j++){ 
          if(myArray[i][j] == null){
            myArray[i][j] = new Tile();
           float noiseVal = noise((i)*noiseScale, j*noiseScale);
           //System.out.println(direction);
           if(noiseVal < 0.3){
            myArray[i][j].images = img9; 
            myArray[i][j].Biome = "Stone";
           }
           else if(noiseVal < 0.5 && noiseVal >= 0.3){
            myArray[i][j].images = img; 
            myArray[i][j].Biome = "Sand";
           }
           else{
            myArray[i][j].images = img2; 
            myArray[i][j].Biome = "Forest";
           }
          
           if(direction.equals("right")){
    /*         if(myArray[i][j-1] != null && myArray[i-1][j] != null &&  myArray[i-1][j].Biome.equals("border") && myArray[i][j-1].Biome.equals("border")){
               myArray[i][j].images = map.get(myArray[i-1][j-1].Biome + myArray[i][j].Biome + "RD");
                myArray[i][j].Biome = "cornerBorder";
             }
      */     
           if(myArray[i][j].Biome != myArray[i-1][j].Biome && !myArray[i-1][j].Biome.equals("border")){
            myArray[i][j].images = map.get(myArray[i-1][j].Biome + myArray[i][j].Biome + "LR");
            myArray[i][j].Biome = "border";
             }
             
           if(myArray[i][j-1] != null && !myArray[i][j-1].Biome.equals("border") && myArray[i][j].Biome != myArray[i][j-1].Biome && !myArray[i][j].Biome.equals("border")){
               myArray[i][j].images = map.get(myArray[i][j-1].Biome + myArray[i][j].Biome + "UD");
               myArray[i][j].Biome = "border";
             }
         }
          else if(direction.equals("left")){
            if(myArray[i][j].Biome != myArray[i+1][j].Biome && !myArray[i+1][j].Biome.equals("border") && !myArray[i][j].Biome.equals("border")){
            myArray[i][j].images = map.get(myArray[i][j].Biome + myArray[i+1][j].Biome + "LR");
            myArray[i][j].Biome = "border";
            }
            if(myArray[i][j-1] != null && !myArray[i][j-1].Biome.equals("border") && myArray[i][j].Biome != myArray[i][j-1].Biome && !myArray[i][j].Biome.equals("border")){
               myArray[i][j].images = map.get(myArray[i][j-1].Biome + myArray[i][j].Biome + "UD");
               myArray[i][j].Biome = "border";
             }
           float r = random(30);
           int newInt = int(r); 
           if(newInt == 1){
               if(myArray[i][j].Biome == "Sand"){
                e.add(new Pirate((-4995 + i) * 64, (-4995 + j) * 65, direction));
                System.out.println("pirate");
             }   
          }
               else{
                // System.out.println("no"); 
          }
           }
          else if(direction.equals("up")){
            if(myArray[i][j].Biome != myArray[i][j+1].Biome && !myArray[i][j+1].Biome.equals("border") && !myArray[i][j].Biome.equals("border")){
            myArray[i][j].images = map.get(myArray[i][j].Biome + myArray[i][j+1].Biome + "UD");
            myArray[i][j].Biome = "border";
            }
           if(myArray[i-1][j] != null && myArray[i][j].Biome != myArray[i-1][j].Biome && !myArray[i-1][j].Biome.equals("border") && !myArray[i][j].Biome.equals("border")){
                myArray[i][j].images = map.get(myArray[i-1][j].Biome + myArray[i][j].Biome + "LR");
                myArray[i][j].Biome = "border";
             }  
         }
         else if(direction.equals("down")){
           if(myArray[i][j].Biome != myArray[i][j-1].Biome && !myArray[i][j].Biome.equals("border") && !myArray[i][j-1].Biome.equals("border")){
            myArray[i][j].images = map.get(myArray[i][j-1].Biome + myArray[i][j].Biome + "UD");
            myArray[i][j].Biome = "border";
           }
            if(myArray[i-1][j] != null && myArray[i][j].Biome != myArray[i-1][j].Biome && !myArray[i-1][j].Biome.equals("border") && !myArray[i][j].Biome.equals("border")){
                myArray[i][j].images = map.get(myArray[i-1][j].Biome + myArray[i][j].Biome + "LR");
                myArray[i][j].Biome = "border";
             }
           }
          }
       }
     }
   }   
   
   void pushBack(){ //generates more
 
   
   if(-p1.posX/64 + 5000 > px2 - 12){
     
     px2 += 1;
     Biomes("right");
     }
    if(-p1.posX/64 + 5000 < px1 + 6){
    
     px1 -= 1;
     Biomes("left");
     }
     if(-p1.posY/64 + 5000 > py2 - 12){
   
     py2 += 1;
     Biomes("down");
     }
     if(-p1.posY/64 + 5000 < py1 + 6){
     
     py1 -= 1;
     Biomes("up");
     }  
   }
   
   int[] GetPlayerPos() {
     int[] Parray = {-p1.posX/64 + 5000, -p1.posY/64 + 5000};  
     return Parray;
   }  
    
}
