class Gaurd{
    float xGaurd;
    float yGaurd; 
    float change;
    float speed;
    float gaurdWalkDistance;
    float gaurdRange;
    float r;
    int direction;
    boolean playerCaught;
    
float mouseRadians ;
float newAngle;
float x1, y1;
float newArc;
float angle = HALF_PI;
 
  Gaurd(){
    xGaurd = random(0, 500);
    yGaurd = random(0, 500);
    speed =  random(1,10);
    gaurdWalkDistance = random(50,400);
    gaurdRange = random(50,300);
    direction = 1;//int(random(0,1));
  }
  
  void drawGaurd(){
    

     
      fill(0);
     pushMatrix();
     translate(xGaurd, yGaurd);
      rotate(r);
     ellipse(0, 0, 30, 30);
     arc(0, 0, gaurdRange, gaurdRange, 0, HALF_PI);
     noFill();
     popMatrix();
     updateGaurd();
     
     if ( r > 3.1){
      r = -3.2; 
     }
     
     gaurdCaughtPlayer();
         
      //3.9 up     -2.3
      //5.4 right  -0.8
      //0.75 down   0.8
      //2.3 left    2.3 

//arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI);
  }



  void updateGaurd(){
     
    if (direction == 0){
      
          if (change < gaurdWalkDistance){
              if (r > -0.8  && r < -0.7){
                 xGaurd += speed;
                 change += speed;
              }else r+=0.1;
          
        }else if (change < gaurdWalkDistance*2 ){
               if( r > 2.3 && r < 2.6){
               xGaurd -= speed;
               change += speed;
               }else r += 0.1;
          }else change = 0;
          
    }else{
              if (change < gaurdWalkDistance){
              if (r > -2.4  && r < -2.2){
                 yGaurd -= speed;
                 change += speed;
              }else r+=0.1;
          
        }else if (change < gaurdWalkDistance*2 ){
               if( r < 0.8 && r > 0.7){
               yGaurd += speed;
               change += speed;
               }else r += 0.1;
          }else change = 0;

  }
  }
  
   void gaurdHit(float x, float y, int j, int i){
        float d = dist(xGaurd, yGaurd, x, y);
        if (d <20){
          gaurds.remove(j);
          bullets.remove(i);
        }
 }
 
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

      }else fill(255);

    if ((sq(xPlayer - (xGaurd - (gaurdRange * 0.35))) + sq(yPlayer - (yGaurd - (gaurdRange * 0.35)))) <= sq(gaurdRange)){
     playerCaught = true;
     Player.reposition();
     Player.lives--;
     playerCaught = false;
      } else {
     playerCaught = false;
} 


 }
}