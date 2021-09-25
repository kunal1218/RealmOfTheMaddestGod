public class Account {
  boolean boundary = false;
  boolean boundary2 = false;
  boolean boundary3 = false;
  String Page = "menu";
  String username = "";
  String password = "";
  String Username2 = "";
  String Password2 = "";
  boolean confirmPassword = false;
  boolean confirmName = false;
  boolean confirmRealName = false;
  boolean confirmRealPassword = false;
  boolean hasAccount = false;
  int space = 0;
  boolean loggedIn = false;
  boolean enterRealm = false;
  
  void DrawOptions (){
  if(Page.equals("menu")){
    
  if(loggedIn == true && username.length() > 0){
  fill(255);
  textSize(25);
  text("Logged in as: " + username, 680 + 16*(11-username.length()), 40);
  }
    
  if(boundary == true){
  fill(#F6FF00);
  textSize(50);
  text("Login",450,300);
  }
  else{
  textSize(50);
  fill(255);
  text("Login",450,300); 
  }
  if(boundary2 == true){
  fill(#F6FF00);
  textSize(50);
  text("Create Account",325,400);
  }
  else{
  textSize(50);
  fill(255);
  text("Create Account",325,400);
      }
  if(boundary3 == true){
  fill(#F6FF00);
  textSize(50);
  text("Play",469,490); 
    }
  else{
  fill(255);
  textSize(50);
  text("Play",469,490);  
      }
    }
  if(Page.equals("LogIn")){
  fill(255);
  textSize(50);
  text("Username",150,100);
  text(Username2, 150, 200);
  text("Password", 150, 300);
  text(Password2, 150, 400);
  }
  
  else if(Page.equals("CreateAccount")){
  text("Hit enter to confirm!", 260, 740);
    }
  }
  
  
  void MouseInput(){
  if(((mouseX >= 450) && (mouseX <= 580)) && (mouseY <= 300) && (mouseY >= 250)){
  boundary = true;
    }
  else{
  boundary = false;
  }
  if(((mouseX >= 325) && (mouseX <= 695)) && (mouseY <= 400) && (mouseY >= 355)){
  boundary2 = true;  
    }
  else{
  boundary2 = false;
    }
 if(((mouseX >= 469) && (mouseX <= 567)) && (mouseY <= 500) && (mouseY >= 450)){
   boundary3 = true;
  }
  else{
    boundary3 = false;
  }  
}
  
  void mouseReleased(){
  if(boundary == true && hasAccount == true){
    Page = "LogIn";
  }
  if(boundary2 == true){
    Page = "CreateAccount";
    username = "";
    password = "";
    }
  if(boundary3 == true && loggedIn == true){
    Page = "Realm";
    }
  }
  
  void keyPressed(){
   if(username.equals("kunal")){
   Page = "Realm";
   }
   if(Page.equals("CreateAccount")){
    if(key == ENTER && confirmName == false && username.length() > 3){
      confirmName = true;
    }
    else if (confirmName == false && username.length() < 12 && key != ENTER){
   username += key;
    }
   else if(key == ENTER && confirmName == true && password.length() > 5){
      Page = "menu";
      hasAccount = true;
      confirmName = false;
      }
    else if(confirmName == true && confirmPassword == false && password.length() < 21 && key != ENTER){
      password += key;
     
    }
   }
   if(Page.equals("LogIn")){
     if(key == ENTER && Username2.equals(username) && Username2.length() > 3){
      confirmRealName = true;
    }
    else if (confirmRealName == false && key != ENTER && Username2.length() < 12){
   Username2 += key;
    }
   if(key == ENTER && Password2.equals(password) && Password2.length() > 5){
      confirmRealPassword = true;
      Page = "menu";
     loggedIn = true; 
    }
    else if (confirmRealName == true && key != ENTER && Password2.length() < 21 && confirmRealPassword == false){
   Password2 += key;
      } 
   }
      } 
   void display(){
  if(Page.equals("CreateAccount")){
  fill(255);
  textSize(50);
  text("Username",150,100);
  text(username, 150, 200);
  text("Password", 150, 300);
  text(password, 150, 400);
  
    }
       }
    }
