class Block{
     
   float x,y;
   boolean alive = true;
   boolean touching;
   int blockSize = 70;
   int playerSize = 25;
   float tempX = 0;
   float tempY = 0;
   
   Block(float passedX, float passedY){
     x = passedX;
     y = passedY;
    
   }
  


 void drawBlock(){
   playerInBlock();
   if (alive){
       rect(x,y,blockSize,blockSize);
   }else if (!alive && !playerMoving && !touching){
      tempY = y;
      if (tempX < x){
        rect(tempX, tempY, blockSize, blockSize);
        tempX += 10;
       }else alive = true;
      
   }
  

}

void playerInBlock(){
  if (xPlayer >= x && xPlayer <= x+blockSize && 
      yPlayer >= y && yPlayer <= y+blockSize ||
      xPlayer + playerSize >= x && xPlayer + playerSize <= x+blockSize && 
      yPlayer + playerSize >= y && yPlayer + playerSize <= y+blockSize ||  
      xPlayer + playerSize >= x && xPlayer + playerSize <= x+blockSize && 
      yPlayer >= y && yPlayer  <= y+blockSize ||  
      xPlayer >= x && xPlayer <= x+blockSize && 
      yPlayer + playerSize >= y && yPlayer + playerSize <= y+blockSize) {
     alive = false;
     touching = true;

}else touching = false;

}

}