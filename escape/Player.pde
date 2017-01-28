class Player{
  
  boolean notMoving = true;
  boolean wallTouched;
  


 void drawPlayer(){
   ellipse(xPlayer, yPlayer, 50, 50);
   updatePlayer();
 }
 
 void updatePlayer(){
   if (key == 'd'){
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
           key = 't';
        }
        
 }
   
           if (key == 's'){
          println("SS");
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
           key = 't';
        }
     
   }
   
   if (key == 'a'){
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
           key = 't';
        }
        
 }
 
    if (key == 'w'){
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
           key = 't';
        }
        
 }
}
}