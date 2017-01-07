class Level{
  
  float fixedXDoor = 800;
  float fixedYDoor = 200;
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
   
   for (int i = 0; i < 7; i ++){
            fill(2 + (i * 8), 2 + (i * 8), 2 + (i * 8));
            rect(xDoor-(i * 10), yDoor + (i * 10), 40+(i*20), 10);
            noFill();
   }
   float d = dist(xPlayer + Player.imgSize/2, yPlayer + Player.imgSize/2, xDoor, yDoor);
   //ellipse(xPlayer + Player.imgSize/2, yPlayer + Player.imgSize/2, 40,40);
   if (d < 25){
     Player.level++;
     levelComplete = true;
     reset = true;
   }
  
 }
 
 
}