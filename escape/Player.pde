class Player{
  
  boolean notMoving = true;
  boolean wallTouched;
  boolean UP, DOWN, LEFT, RIGHT;
  boolean a;
  
 Player(){
   for (int i = 0; i <7; i++){
     xPositions[i] = 80 + ( i * 70); 
   }
   
   for (int i = 0; i <7; i++){
     yPositions[i] = 115 + ( i * 70); 
   }
 }

 void drawPlayer(){
   println(mouseY);
      for (int i = 0; i <7; i++){
     //ellipse(xPositions[i], 50, 50,50);
   }
   
   ellipse(xPlayer, yPlayer, 50, 50);
   if (!regenerating) updatePlayer();
 }
 
 void updatePlayer(){
   
   
   if (key == 'a' && !right && !up && !down) left = true;
   if (key == 'w' && !down && !left && !right) up = true;
   if (key == 's' && !up && !left && !right) down = true;
   if (key == 'd' && !left && !up && !down) right = true; 
   
   int xLocation = (xPositions[(int(random(2,6)))]);
   int yLocation = (yPositions[(int(random(2,6)))]);
   
 
   if (right && !left && !up && !down){
     if (xPlayer < width- 70 && !wallTouched){
       playerMoving = true;
       xPlayer +=10;
       wallTouched = false;
       
     }else wallTouched = true;
     
        if ( wallTouched && xPlayer > xLocation){
          xPlayer -= 10;
          println(xPlayer);
        }else if (wallTouched){
            playerMoving = false;
            wallTouched = false;
            right = false;
            key = 'f';
        }
        
 }
   
       if (down){
         if (yPlayer < height - 5 && !wallTouched){
           playerMoving = true;
           yPlayer +=10;
           wallTouched = false;
       
       }else wallTouched = true;
     
          if ( wallTouched && yPlayer > yLocation){
              yPlayer -= 10;
          }else if (wallTouched){
               playerMoving = false;
               wallTouched = false;
               down = false;
               key = 'f';
        }
     
   }
   
   if (left){
     println("DDD");
     if (xPlayer > 19 && !wallTouched){
       playerMoving = true;
       xPlayer -=10;
       wallTouched = false;
       
     }else wallTouched = true;
     
        if ( wallTouched && xPlayer <  xLocation){
          xPlayer += 10;
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
     
        if ( wallTouched && yPlayer < yLocation){
          yPlayer += 10;
        }else if (wallTouched){
            playerMoving = false;
            wallTouched = false;
            up = false;
            key = 'f';
        }
        
 }
}
}