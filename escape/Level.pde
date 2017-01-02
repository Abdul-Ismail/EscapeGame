class Level{
  
  float fixedXDoor = 400;
  float fixedYDoor = 300;
  float xDoor, yDoor;
  boolean levelComplete;

 void createLevel(){
   if (levelComplete && !reset){
       gaurds.clear();
       fixedXDoor = random(400, 1024);
       fixedYDoor = random(400, 1024);
       for (int i = 0; i <6; i++){
       gaurds.add(new Gaurd());
       }
       levelComplete = false;
   }
 }
 
 void enteredDoor(){
   xDoor = fixedXDoor - xBG;
   yDoor = fixedYDoor - yBG;
   ellipse(xDoor,yDoor,50,50);
   float d = dist(xPlayer + Player.imgSize/2, yPlayer + Player.imgSize/2, xDoor, yDoor);
   //ellipse(xPlayer + Player.imgSize/2, yPlayer + Player.imgSize/2, 40,40);
   if (d < 25){
     Player.level++;
     levelComplete = true;
     reset = true;
   }
  
 }
 
 
}