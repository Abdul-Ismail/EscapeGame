class Gaurd{
    float xGaurd;
    float yGaurd; 
    float change;
    float speed;
    float gaurdWalkDistance;
    float gaurdRange;
    float r =3.9;
    int direction;
 
  Gaurd(){
    xGaurd = 300;
    yGaurd = 300;
    speed = random(1,10);
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
     
     if (r > 6){
      r = 0; 
     }
         
      //3.9 up
      //5.4 right
      //0.75 down
      //2.3 left

//arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI);
  }



  void updateGaurd(){
     
    if (direction == 0){
      
          if (change < gaurdWalkDistance){
              if (r > 5.4  && r < 5.6){
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
              if (r > 3.9  && r < 4.4){
                 yGaurd -= speed;
                 change += speed;
              }else r+=0.1;
          
        }else if (change < gaurdWalkDistance*2 ){
               if( r > 0.75 && r < 1.6){
               yGaurd += speed;
               change += speed;
               }else r += 0.1;
          }else change = 0;

  }
  }
}