class Player{
  
  boolean notMoving = true;
  boolean wallTouched;
  boolean UP, DOWN, LEFT, RIGHT;
  boolean a;
  


 void drawPlayer(){
   ellipse(xPlayer, yPlayer, 50, 50);
   if (!regenerating) updatePlayer();
 }
 
 void updatePlayer(){
   
   
   if (key == 'a' && !right && !up && !down) left = true;
   if (key == 'w' && !down && !left && !right) up = true;
   if (key == 's' && !up && !left && !right) down = true;
   if (key == 'd' && !left && !up && !down) right = true; 
   

   
   
   if (right && !left && !up && !down){
     if (xPlayer < width- 70 && !wallTouched){
       playerMoving = true;
       xPlayer +=10;
       wallTouched = false;
       
     }else wallTouched = true;
     
        if ( wallTouched && xPlayer > width - 85 - (int(random(2,6)*70))){
          xPlayer -= 13;
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
     
          if ( wallTouched && yPlayer > height - 5 - (int(random(2,6)*70))){
              yPlayer -= 13;
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
     
        if ( wallTouched && xPlayer < 19 + (int(random(2,6))*70)){
          xPlayer += 13;
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
     
        if ( wallTouched && yPlayer < 19 + (int(random(2,6)*70))){
          yPlayer += 13;
        }else if (wallTouched){
            playerMoving = false;
            wallTouched = false;
            up = false;
            key = 'f';
        }
        
 }
}
}