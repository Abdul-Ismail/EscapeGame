class Player{
  
  boolean notMoving = true;
  boolean wallTouched;
  boolean UP, DOWN, LEFT, RIGHT;
  boolean a;
  boolean moveDone;
  float[] newPositions = new float[2];
  boolean doOnce;
  
 Player(){

 }

 void drawPlayer(){

   ellipse(xPlayer, yPlayer, 50, 50);
   if (!regenerating) updatePlayer();
 }
 
 void updatePlayer(){
   
   
   if (key == 'a' && !right && !up && !down) left = true;
   if (key == 'w' && !down && !left && !right) up = true;
   if (key == 's' && !up && !left && !right) down = true;
   if (key == 'd' && !left && !up && !down) right = true; 
   
   //int xLocation = (xPositions[(int(random(2,6)))]);

   if (!doOnce){
         Block block = blocks.get(int(random(2,6)));
        newPositions = block.randomCords();
        doOnce = true;
   }
       
   
 
   if (right && !left && !up && !down){
     if (xPlayer < width- 70 && !wallTouched){
       playerMoving = true;
       xPlayer +=10;
       wallTouched = false;
       
     }else wallTouched = true;
     
        if ( wallTouched && xPlayer > newPositions[0] && !moveDone){
          xPlayer -= 10;
        }else if (wallTouched && (xPlayer < newPositions[0] - 2 && xPlayer < newPositions[0] + 2)) {
           xPlayer += 1;
           moveDone = true;
        }else if (wallTouched){
            playerMoving = false;
            wallTouched = false;
            right = false;
            moveDone = false;
            doOnce = false;
            println(xPlayer, newPositions[0]);
            key = 'f';
        }
        
 }
   
       if (down){
         if (yPlayer < height - 5 && !wallTouched){
           playerMoving = true;
           yPlayer +=10;
           wallTouched = false;
       
       }else wallTouched = true;
     
          if ( wallTouched && yPlayer > newPositions[1] && !moveDone){
              yPlayer -= 10;
          }else if (wallTouched && (yPlayer < newPositions[1] - 2 && yPlayer > newPositions[1] + 2 )) {
           yPlayer += 1;
           moveDone = true;
        }else if (wallTouched){
               playerMoving = false;
               wallTouched = false;
               down = false;
               key = 'f';
        }
     
   }
   
   if (left){
     if (xPlayer > 19 && !wallTouched){
       playerMoving = true;
       xPlayer -=10;
       wallTouched = false;
       
     }else wallTouched = true;
     
        if ( wallTouched && xPlayer <  newPositions[0] && !moveDone){
          xPlayer += 10;
        }else if (wallTouched && (xPlayer < newPositions[0] - 2 && xPlayer > newPositions[0] + 2 )) {
           xPlayer += 1;
           moveDone = true;
        }else if (wallTouched){
            playerMoving = false;
            wallTouched = false;
            left = false;
            key = 'f';
        }
        
 }
 
    if (up){
     if (yPlayer > 19 && !wallTouched){
       playerMoving = true;
       yPlayer -=10;
       wallTouched = false;
       
     }else wallTouched = true;
     
        if ( wallTouched && yPlayer < newPositions[1] && !moveDone){
          yPlayer += 10;
        }else if (wallTouched && (yPlayer < newPositions[1] - 2 && yPlayer > newPositions[1] + 2 )) {
           yPlayer -= 1;
           moveDone = true;
        }else if (wallTouched){
            playerMoving = false;
            wallTouched = false;
            up = false;
            key = 'f';
        }
        
 }
}
}