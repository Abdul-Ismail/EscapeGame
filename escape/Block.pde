class Block{
     
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
   
   
   Block(float passedX, float passedY){
     x = passedX;
     y = passedY;
    
   }
  


 void drawBlock(){
   playerInBlock();
   if (alive){
      if (type == 1) rect(x,y,blockSize,blockSize);
      if (type == 2) arrow();
   }else if (!alive && !playerMoving && !touching){
      tempY = y;
        if (!doOnce) {
            type = int(random(1,3));
            doOnce = true;
               println(type);
        }
        
      if (tempX < x){
        if (type == 1) rect(tempX, tempY, blockSize, blockSize);
        if (type == 2) arrow();
        tempX += 10;
       }else alive = true;   
   }
  

}

void playerInBlock(){
  boolean inBlock = withinBlock(xPlayer, yPlayer);
  if (inBlock){
     alive = false;
     doOnce = false;
     touching = true;

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
    if (doneRotatingTriangle){
      triangleRotation2 = triangleRotation2 % 4 + 1;
      triangleRotation = triangleRotation2 * 90 - 90;
    }
  }
  


}