class Player{
  
  boolean notMoving = true;
  boolean wallTouched;
  boolean UP, DOWN, LEFT, RIGHT;
  boolean a;
  


 void drawPlayer(){
   ellipse(xPlayer, yPlayer, 50, 50);
   updatePlayer();
 }
 
 void updatePlayer(){
   
   
   if (key == 'a' && !RIGHT && !UP && !DOWN) LEFT = true;
   if (key == 'w' && !DOWN && !LEFT && !RIGHT) UP = true;
   if (key == 's' && !UP && !LEFT && !RIGHT) DOWN = true;
   if (key == 'd' && !LEFT && !UP && !DOWN) RIGHT = true; 
   

   
   
   if (RIGHT && !LEFT && !UP && !DOWN){
     if (xPlayer < width- 19 && !wallTouched){
       playerMoving = true;
       xPlayer +=10;
       wallTouched = false;
       
     }else wallTouched = true;
     
        if ( wallTouched && xPlayer > width - 19 - (2*70)){
          xPlayer -= 13;
        }else if (wallTouched){
            playerMoving = false;
            wallTouched = false;
            RIGHT = false;
            key = 'f';
        }
        
 }
   
       if (DOWN){
         if (yPlayer < height - 5 && !wallTouched){
           playerMoving = true;
           yPlayer +=10;
           wallTouched = false;
       
       }else wallTouched = true;
     
          if ( wallTouched && yPlayer > height - 5 - (2*70)){
              yPlayer -= 13;
          }else if (wallTouched){
               playerMoving = false;
               wallTouched = false;
               DOWN = false;
               key = 'f';
        }
     
   }
   
   if (LEFT){
     if (xPlayer > 19 && !wallTouched){
       playerMoving = true;
       xPlayer -=10;
       wallTouched = false;
       
     }else wallTouched = true;
     
        if ( wallTouched && xPlayer < 19 + (2*70)){
          xPlayer += 13;
        }else if (wallTouched){
            playerMoving = false;
            wallTouched = false;
            LEFT = false;
            key = 'f';
        }
        
 }
 
    if (UP){
     if (yPlayer > 19 && !wallTouched){
       playerMoving = true;
       yPlayer -=10;
       wallTouched = false;
       
     }else wallTouched = true;
     
        if ( wallTouched && yPlayer < 19 + (2*70)){
          yPlayer += 13;
        }else if (wallTouched){
            playerMoving = false;
            wallTouched = false;
            UP = false;
            key = 'f';
        }
        
 }
}
}