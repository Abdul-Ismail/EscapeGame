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
 float rectXcenter;
 float rectYcenter;
     
     boolean inPositionX;
     boolean inPositionY;
     
   
   
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
   if (alive){
        
      if (type == 1) rect(x,y,blockSize,blockSize);
      if (type == 2) arrow();
      
   }else if (!alive && !touching && left == false && right == false && up == false && down == false){
      tempY = y;
        if (!doOnce) {
            type = int(random(1,3));
            doOnce = true;

        }
        
      if (tempX < x){
        if (type == 1) rect(tempX, tempY, blockSize, blockSize);
        if (type == 2) arrow();
        tempX += 10;
        regenerating = true;
       }else{ 
         alive = true;  
         regenerating = false;
         key = 'l';
       }
   }
   
  

}

void playerInBlock(){
  boolean inBlock = withinBlock(xPlayer, yPlayer);
  if (inBlock){
     alive = false;
     doOnce = false;
     touching = true;


     
     
       if (type == 2 && triangleRotation2 == 1 && (yPlayer < rectYcenter + 1 && yPlayer > rectYcenter - 1) && (xPlayer < rectXcenter +1 && xPlayer > rectXcenter - 1)){
          right = true; down = false; up = false; left = false;
          type = 0;   
          inPositionY = false;
       }else if (type == 2 && triangleRotation2 == 2 && (xPlayer < rectXcenter +1 && xPlayer > rectXcenter - 1) && (yPlayer < rectYcenter + 1 && yPlayer > rectYcenter - 1) ){
          down = true; right = false; up = false; left = false;
          type = 0;  
          inPositionX = false;
       } else if (type == 2 && triangleRotation2 == 3 && (yPlayer < rectYcenter + 1 && yPlayer > rectYcenter - 1) && (xPlayer < rectXcenter +1 && xPlayer > rectXcenter - 1)){
          left = true; right = false; up = false; down = false;
          type = 0;  
          inPositionY = false;
       }else if (type == 2 && triangleRotation2 == 4 && (yPlayer < rectYcenter + 1 && yPlayer > rectYcenter - 1) && (xPlayer < rectXcenter +1 && xPlayer > rectXcenter - 1)){
          up = true; right = false; down = false; left = false;
          type = 0; 
          inPositionX = false;
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
  
  float [] randomCords(){
    float[] PostiontionForPlayerToReposition = new float[2];
    PostiontionForPlayerToReposition[0] =  rectXcenter;
    PostiontionForPlayerToReposition[1] =  rectYcenter;
    return PostiontionForPlayerToReposition;
    
  }
  


}