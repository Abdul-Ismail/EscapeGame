class Level{
  
  float xDoor = 400;
  float yDoor = 300;
  boolean levelComplete;
  
 void createLevel(){
   if (levelComplete){
       gaurds.clear();
       Player.reposition();
       gaurds.add(new Gaurd());
       gaurds.add(new Gaurd());
       gaurds.add(new Gaurd());
       gaurds.add(new Gaurd());
       gaurds.add(new Gaurd());
       gaurds.add(new Gaurd());
       gaurds.add(new Gaurd());
       levelComplete = false;
   }
 }
 
 void enteredDoor(){
   ellipse(xDoor,yDoor,50,50);
   float d = dist(xPlayer, yPlayer, xDoor, yDoor);
   if (d < 25){
     println("nigga");
     levelComplete = true;
   }
  
 }
 
 
}