class Gaurd{
    float xGaurd;
    float yGaurd; 
    float change;
    float speed = 2;
    float gaurdDistance = 100;
    float gaurdRange = 300;
    float r =3.9;
 
  Gaurd(){
    xGaurd = 300;
    yGaurd = 300;
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
       
    if (change < gaurdDistance){
        if (r > 5.4  && r < 5.6){
           xGaurd += speed;
           change += speed;
        }else r+=0.1;
    
  }else if (change < gaurdDistance*2){
         if( r > 2.3 && r < 2.6){
         xGaurd -= speed;
         change += speed;
         }else r += 0.1;
    }else change = 0;
    }
  
}