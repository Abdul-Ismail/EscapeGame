class Gaurd{
    float xGaurd;
    float yGaurd; 
    float fixedXGaurd;
    float fixedYGaurd;
    float change;
    float speed = 1;
    float gaurdWalkDistance;
    float gaurdRange;
    float r;
    int direction;
    boolean playerCaught;
    boolean gaurdUp, gaurdDown, gaurdLeft, gaurdRight;
    
float mouseRadians ;
float newAngle;
float x1, y1;
float newArc;
float angle = HALF_PI;
float newXGaurd;
float newYGaurd;
 PImage characterr;
 
  Gaurd(){
    fixedXGaurd = random(200, 1024);
    fixedYGaurd = random(200, 1024);
    gaurdWalkDistance = random(50,400);
    gaurdRange = random(50,300);
    direction = 1;//int(random(0,1));
    characterr = loadImage("player.png");
  }
  
  void drawGaurd(){
    

     
      fill(0);
     xGaurd = fixedXGaurd - xBG;
     yGaurd = fixedYGaurd - yBG;
     pushMatrix();
     translate(xGaurd, yGaurd);
      rotate(r);
     //rect(0, 0, 30, 30);
     translate(-Player.imgSize/2, -Player.imgSize/2);
     image(characterr, 0, 0, Player.imgSize, Player.imgSize);
     noFill();
     popMatrix();
     updateGaurd();
     
     if ( r > 6.3){
      r = 0; 
     }
     
         
      //3.9 up     -2.3
      //5.4 right  -0.8
      //0.75 down   0.8
      //2.3 left    2.3 

//arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI);
  }



  void updateGaurd(){
    
     int yDifference = int(yGaurd - yPlayer); //the difference is used in order to stop the small movement from up and down when it is between both
     int xDifference = int(xGaurd - xPlayer);
       if (xGaurd > xPlayer  && (xDifference >  3  || xDifference <  0 )){
              fixedXGaurd -=speed; 
              gaurdLeft = true;
         }else gaurdLeft = false;
         
         if (xGaurd < xPlayer  && (xDifference >  3  || xDifference <  0 )){
              fixedXGaurd +=speed; 
              gaurdRight = true;
         }else gaurdRight = false;
         if (yGaurd < yPlayer &&  (yDifference >  3 || yDifference < 0 )){
              fixedYGaurd +=speed;;
              gaurdDown = true;
         }else gaurdDown = false;
         if (yGaurd > yPlayer && ( yDifference >  3 || yDifference < 0 )){
              fixedYGaurd -=speed;;
              gaurdUp = true;
         }else gaurdUp = false;
         
         println(yGaurd, yPlayer, yDifference);
               //0 up
      //1.2 right up
      //1.6 right
      //2.2 down right
      //3.2 down
      //4.2 down left
      //4.7 left
      //5.2 left up 
         
        // if (gaurdLeft && (r < 4.6 || r > 4.7) && !gaurdRight && !gaurdUp) r+=0.2; 
         //if (gaurdRight && (r < 1.5 || r > 1.7) && !gaurdLeft && !gaurdUp) r+=0.2;
         
       if (gaurdRight && (r < 1.5 || r > 1.7) && !gaurdUp && !gaurdDown){    r+=0.2;
         }else if (gaurdLeft && (r < 4.6 || r > 4.7) && !gaurdUp && !gaurdDown){    r+=0.2;
           }else if (gaurdUp && (r < 0 || r > 0.4) && !gaurdLeft && !gaurdRight){    r+=0.2;
             }else if (gaurdDown && (r < 3.1 || r > 3.3) && !gaurdLeft && !gaurdRight){    r+=0.2;
               }else if(gaurdUp && gaurdRight && (r < 1.1 || r > 1.3)){   r+=0.2;
                  }else if (gaurdDown && gaurdRight && (r < 2.1 || r > 2.3)){   r+=0.2;
                     }else if (gaurdDown && gaurdLeft && (r < 4.1 || r > 4.3)){   r+=0.2;
                       }else if (gaurdUp && gaurdLeft && (r < 5.1 || r > 5.3)){   r+=0.2;
                         }
         /*if (gaurdUp &&  r > 0.4){
             r+=0.2;
         }else if (gaurdDown && r < 3.1 || r > 3.3){
             r+=0.2;
         }else if (gaurdRight && (r < 1.5 || r > 1.7) ){ 
            r+=0.2;
         }//else if (gaurdLeft && (r < 4.6 || r > 4.7) ) r+=0.2; 
         */
         //println(r);
  }
  
   void gaurdHit(float x, float y, int j, int i){
        float d = dist(xGaurd, yGaurd, x, y);
        if (d <20){
          gaurds.remove(j);
          bullets.remove(i);
        }
 }
 
 
 /*
 void gaurdCaughtPlayer(){
     
mouseRadians = atan2(yPlayer - yGaurd, xPlayer - xGaurd) -  r; 

   
     //if the arc is between the two angles which reset
     if (r > 1.7 && r < 3.2 )
     {
           if (mouseRadians + r > -3.2 && mouseRadians + r < -1.6 ){
              newAngle = -3.2  +(r - 1.5);
                       
              x1 = xGaurd + 150 * cos(newAngle);
              y1 = yGaurd + 150 * sin(newAngle) ;    
              
              PVector v1 = new PVector(50, 209);
              PVector v2 = new PVector(x1, y1); 
              newArc = PVector.angleBetween(v1, v2) + 0.5;
             angle = newArc;
               mouseRadians = atan2(yPlayer - yGaurd, xPlayer - xGaurd) -  -3.2; 
           }else{
              angle = HALF_PI;
           }
     }

    if ((playerCaught == true)&&(mouseRadians  >0)&&(mouseRadians < angle)){
       ellipse(50,50,100,100);
       //Player.reposition();
       Player.lives--;
       playerCaught = false;

      }else fill(255);

    if ((sq(xPlayer - (xGaurd - (gaurdRange * 0.35))) + sq(yPlayer - (yGaurd - (gaurdRange * 0.35)))) <= sq(gaurdRange)){
     playerCaught = true;
      } else {
     playerCaught = false;
} 


 }
 */
}