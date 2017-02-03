class miniTriangles{
  
  float miniX;
  float miniY;
  float r;
  float changeR;
  float collectionX;
  float collectionY;
  boolean collected = false;
  float relocationXSpeed;
  float relocationYSpeed;
  int moveX;
  int moveY;
  
  miniTriangles(float x, float y, float x2, float y2){
     miniX = x;
     miniY = y;
     collectionX = x2;
     collectionY = y2;
     moveX += int(random(20,50));
     moveY += int(random(20,50));
     //miniX += int(random(20,50));
     //miniY += int(random(20,50));
     relocationYSpeed = random(1,4);
     relocationXSpeed = random(1,4);
     changeR = random(0.3, 1);
     
  }
  
  void drawMiniT(float miniX, float miniY){
     miniX += moveX;
     miniY += moveY;
    
     pushMatrix();
     translate(miniX , miniY );
     rotate(radians(r));
     triangle(-10, 10, 0, -10, 10, 10); 
     popMatrix();   

     if (!collected) r += changeR;
     
     if (r > 20 || r < -20 && !collected){
        changeR *= -1;
     }
     
     if (collected){
         if (miniX < collectionX + 10){
            miniX+=relocationXSpeed;
         }
         if (miniY > collectionY + 10){
            miniY-= relocationYSpeed;
         }
         
         if (r < 90){
            r++; 
         }
         
         if (miniX > (collectionX + 10)-5 && miniX < (collectionX + 10) + 5 && miniY > (collectionY + 10) -5 && miniY < (collectionY+ 10) + 5){
           println("SS");
           //miniTs.remove(this);
         }
                
     }
     
     
        
  }


 void collectedCall(boolean call){
   collected = call;
   println(collected);
 }
 
}