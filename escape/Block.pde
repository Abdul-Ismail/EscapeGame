class Block{
     
   float x,y;
   boolean alive = true;
   int blockSize = 70;
   int playerSize = 25;
   
   Block(float passedX, float passedY){
     x = passedX;
     y = passedY;
    
   }
  


 void drawBlock(){
   if (alive){
       rect(x,y,blockSize,blockSize);
       playerInBlock();
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
     println("SSSS");
}



}
}