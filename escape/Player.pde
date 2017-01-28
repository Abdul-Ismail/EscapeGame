class Player{
  
  boolean notMoving = true;
  boolean wallTouched;
  


 void drawPlayer(){
   ellipse(xPlayer, yPlayer, 50, 50);
   updatePlayer();
 }
 
 void updatePlayer(){
   if (key == 'd'){
     if (xPlayer < width- 20 && !wallTouched){
       xPlayer +=10;
       wallTouched = false;
       playerMoving = true;
     }else wallTouched = true;
     
        if ( wallTouched && xPlayer > width - 20 - (2*70)){
          xPlayer -= 13;
        }else if (wallTouched){
            playerMoving = false;
           key = 't';
        }
     
   }
 }
 
}