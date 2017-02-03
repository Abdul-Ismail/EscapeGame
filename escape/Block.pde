class Block{
     
   ArrayList<miniTriangles> miniTs = new ArrayList<miniTriangles>();
  
   float x,y;
   boolean alive = true;
   boolean touching;
   int blockSize = 70;
   int playerSize = 25;
   float tempX = 0;
   float tempY = 0;
   boolean doOnce;
   int type = 1;
   float triangleRotation;
   boolean clicked;
   int triangleRotation2;
   boolean doneRotatingTriangle = true;
   float rectXcenter;
   float rectYcenter;
   boolean enemyPresent;
   float topTriangleX = 500;
   float topTriangleY = 30;
   boolean trianglePackageOnce;
   boolean trianglePackageCollected;
   boolean doneCollecting = false;
     
   
   
   Block(float passedX, float passedY){
     x = passedX;
     y = passedY;
     triangleRotation2 = int(random(1,5));
     rectXcenter = x + blockSize/2;
     rectYcenter = y + blockSize/2;
    
   }
  


 void drawBlock(){
   
   fill(255,43,56);
   playerInBlock();
     triangle(topTriangleX, topTriangleY, topTriangleX, topTriangleY + 20, topTriangleX + 20, topTriangleY + 10 );
      if (trianglePackageCollected) arrowPackage();
      
   if (alive && !enemyPresent){
        
      if (type == 1) rect(x,y,blockSize,blockSize);
      if (type == 2) arrow();
      if (type == 3) arrowPackage();
      
   }else if (!alive && !touching && left == false && right == false && up == false && down == false){
      tempY = y;
        if (!doOnce) {
            type = int(random(1,4));
            if (type == 3) trianglePackageOnce = false;
            doOnce = true;
               tempX = 0;
            

        }
        
    // if (x < 300){   
      if (tempX < x){
        if (type == 1) rect(tempX, tempY, blockSize, blockSize);
        if (type == 2) arrow();
        if (type == 3) arrowPackage();
        tempX += 10;
        regenerating = true;
           if (triangleRotation < 90 * triangleRotation2){   
       //triangleRotation += 30;
           }
       }else{ 
         alive = true;  
         regenerating = false;
         key = 'l';
       }
     }
  // }
   
  

}

void playerInBlock(){
  boolean inBlock = withinBlock(xPlayer, yPlayer); //checks if player is within block
  if (inBlock){
     alive = false;
     doOnce = false;
     touching = true;

       if (type == 2 && triangleRotation2 == 1 && (yPlayer < rectYcenter + 1 && yPlayer > rectYcenter - 1) && (xPlayer < rectXcenter +1 && xPlayer > rectXcenter - 1) ){
          right = true; down = false; up = false; left = false;
          type = 0;   
          pickCordsOnce = false;
       }else if (type == 2 && triangleRotation2 == 2 && (xPlayer < rectXcenter +1 && xPlayer > rectXcenter - 1) && (yPlayer < rectYcenter + 1 && yPlayer > rectYcenter - 1) ){
          down = true; right = false; up = false; left = false;
          type = 0;  
          pickCordsOnce = false;
       } else if (type == 2 && triangleRotation2 == 3 && (yPlayer < rectYcenter + 1 && yPlayer > rectYcenter - 1) && (xPlayer < rectXcenter +1 && xPlayer > rectXcenter - 1) ){
          left = true; right = false; up = false; down = false;
          type = 0;  
          pickCordsOnce = false;
       }else if (type == 2 && triangleRotation2 == 4 && (yPlayer < rectYcenter + 1 && yPlayer > rectYcenter - 1) && (xPlayer < rectXcenter +1 && xPlayer > rectXcenter - 1) ){
          up = true; right = false; down = false; left = false;
          type = 0; 
          pickCordsOnce = false; 
       }
    
       
              if (type == 3 && (yPlayer < rectYcenter + 1 && yPlayer > rectYcenter - 1) && (xPlayer < rectXcenter +1 && xPlayer > rectXcenter - 1)){
                  
                  
                         for(int i = 0; i < miniTs.size(); i++)
                            {
                              miniTriangles miniT = miniTs.get(i);
                              miniT.collectedCall(true);
                            }
                    trianglePackageCollected = true;
                    type = 0 ;
                  
              }

                           
}else touching = false;

  

}

  boolean withinBlock(float xPassed, float yPassed){
    
      if (xPlayer >= x && xPlayer <= x+blockSize && 
      yPassed >= y && yPassed <= y+blockSize ||
      xPassed + playerSize >= x && xPassed + playerSize <= x+blockSize && 
      yPassed + playerSize >= y && yPassed + playerSize <= y+blockSize ||  
      xPassed + playerSize >= x && xPassed + playerSize <= x+blockSize && 
      yPassed >= y && yPassed  <= y+blockSize ||  
      xPassed >= x && xPassed <= x+blockSize && 
      yPassed + playerSize >= y && yPassed + playerSize <= y+blockSize) {
    
        return true;
  }else return false;

}

void arrow(){
  
     pushMatrix();
     translate(tempX + 35, tempY +30);
     rotate(radians(triangleRotation));
     triangle(-30, 30, 0, -30, 30, 30); 
     popMatrix();   
 
    if (triangleRotation < 90 * triangleRotation2){   
       triangleRotation += 2;
       doneRotatingTriangle = false;
    }else doneRotatingTriangle = true;
}
  
  void updateArrow(){
     boolean inBlock = withinBlock(mouseX, mouseY);
    if (doneRotatingTriangle && inBlock){
      triangleRotation2 = triangleRotation2 % 4 + 1;
      triangleRotation = triangleRotation2 * 90 - 90;
    }
  }
  
  float [] randomCords(boolean enemyPresentPassed){
    enemyPresent = enemyPresentPassed;
    float[] PostiontionForPlayerToReposition = new float[2];
    PostiontionForPlayerToReposition[0] =  rectXcenter;
    PostiontionForPlayerToReposition[1] =  rectYcenter;
    return PostiontionForPlayerToReposition;
    
  }
  
  void arrowPackage(){
    //println(trianglePackageOnce);
   if (!trianglePackageOnce){
    for (int i = 0; i < 5; i++){
        miniTs.add(new miniTriangles(tempX,tempY, topTriangleX, topTriangleY));
    }
    trianglePackageOnce = true;
   }
        for(int i = 0; i < miniTs.size(); i++)
    {
        miniTriangles miniT = miniTs.get(i);
        doneCollecting = miniT.drawMiniT(tempX, tempY);
    
    
              if (doneCollecting){
              //trianglePackageCollected = false;
              //trianglePackageOnce = false;
                            doneCollecting = false;
              //println(miniTs.size());
              miniTs.remove(i);

          }
    }
  }
  


}