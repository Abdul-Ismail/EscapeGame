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
    boolean playerCaught;
    boolean gaurdUp, gaurdDown, gaurdLeft, gaurdRight;
    boolean touchingLeft, touchingRight, touchingBottom, touchingTop;
    int size = 100;
    boolean touching;
    float[] gaurdCords2 = new float[2];
    int direction;
    int m;
    
          float newfixedYGaurd;
      float newfixedXGaurd;
    
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
    characterr = loadImage("player.png");
  }
  
  void drawGaurd(){
    

     
      fill(0);
     xGaurd = fixedXGaurd - xBG;
     yGaurd = fixedYGaurd - yBG;
     pushMatrix();
     translate(xGaurd, yGaurd);
      rotate(r);
    
     //translate(-Player.imgSize/2, -Player.imgSize/2);
          translate(-100/2, -100/2);
      rect(0, 0, 100, 100);
     //image(characterr, 0, 0, Player.imgSize, Player.imgSize);
     noFill();
     popMatrix();
    m = millis();
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
   
                  
              gaurdTouching(100,100);
     int yDifference = int(yGaurd - yPlayer); //the difference is used in order to stop the small movement from up and down when it is between both
     int xDifference = int(xGaurd - xPlayer);
     //if (!touching){
       if (xGaurd > xPlayer  && (xDifference >  3  || xDifference <  0 ) && !touchingRight){
              fixedXGaurd -= speed; 
              gaurdLeft = true;
         }else gaurdLeft = false;
         
         if (xGaurd < xPlayer  && (xDifference >  3  || xDifference <  0 ) && !touchingLeft){
              fixedXGaurd += speed; 
              gaurdRight = true;
         }else gaurdRight = false;
         if (yGaurd < yPlayer &&  (yDifference >  3 || yDifference < 0 ) && !touchingTop){
               fixedYGaurd += speed;
              gaurdDown = true;
         }else gaurdDown = false;
         if (yGaurd > yPlayer && ( yDifference >  3 || yDifference < 0 ) && !touchingBottom ){
              fixedYGaurd -= speed;;
              gaurdUp = true;
         }else gaurdUp = false;
    // }

       if (gaurdRight && (r < 1.5 || r > 1.7) && !gaurdUp && !gaurdDown){    r+=0.2;
         }else if (gaurdLeft && (r < 4.6 || r > 4.7) && !gaurdUp && !gaurdDown){    r+=0.2;
           }else if (gaurdUp && (r < 0 || r > 0.4) && !gaurdLeft && !gaurdRight){    r+=0.2;
             }else if (gaurdDown && (r < 3.1 || r > 3.3) && !gaurdLeft && !gaurdRight){    r+=0.2;
               }else if(gaurdUp && gaurdRight && (r < 1.1 || r > 1.3)){   r+=0.2;
                  }else if (gaurdDown && gaurdRight && (r < 2.1 || r > 2.3)){   r+=0.2;
                     }else if (gaurdDown && gaurdLeft && (r < 4.1 || r > 4.3)){   r+=0.2;
                       }else if (gaurdUp && gaurdLeft && (r < 5.1 || r > 5.3)){   r+=0.2;
                         }

    
  }
  
   void gaurdHit(float x, float y, int j, int i){
        float d = dist(xGaurd, yGaurd, x, y);
        if (d <20){
          gaurds.remove(j);
          bullets.remove(i);
        }
 }
 
 void gaurdTouching(int width, int height)  {
   
   for(int j = 0; j <gaurds.size();j++){
                 Gaurd gaurd2 = gaurds.get(j);
                gaurdCords2 = gaurd2.gaurdCords();
                    float xGaurd2 = gaurdCords2[0];
                    float yGaurd2 = gaurdCords2[1];

println("SSS");
if (xGaurd != xGaurd2 && yGaurd != yGaurd2){
  if (xGaurd >= xGaurd2 && xGaurd <= xGaurd2+width && 
      yGaurd >= yGaurd2 && yGaurd <= yGaurd2+height ||
      xGaurd + size >= xGaurd2 && xGaurd + size <= xGaurd2+width && 
      yGaurd + size >= yGaurd2 && yGaurd + size <= yGaurd2+height ||  
      xGaurd + size >= xGaurd2 && xGaurd + size <= xGaurd2+width && 
      yGaurd >= yGaurd2 && yGaurd  <= yGaurd2+height ||  
      xGaurd >= xGaurd2 && xGaurd <= xGaurd2+width && 
      yGaurd + size >= yGaurd2 && yGaurd + size <= yGaurd2+height) {
     touching = true;
     
      if (xGaurd > xGaurd2){
               //touchingRight = true;
               //touchingLeft = false;
               fixedXGaurd+=5;
      }if (xGaurd < xGaurd2){
               //touchingLeft = true;
               //touchingRight = false;
      }       fixedXGaurd-=5;
      if (yGaurd < yGaurd2){
               ///touchingTop = true;
               //touchingBottom = false;
                fixedYGaurd-=5;
      }if (yGaurd > yGaurd2){
               //touchingBottom = true;
               //touchingTop = false;
               fixedYGaurd+=5;
      }
 
  } else {


  }
  
   }
   }
   
  
}

   float[] gaurdCords(){
     float[] gaurdCords = new float[2];
      gaurdCords[0] = xGaurd;
      gaurdCords[1] = yGaurd;
    return gaurdCords;
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