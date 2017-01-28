class Block{
     
   float x,y;
   boolean alive = true;
   
   Block(float passedX, float passedY){
     x = passedX;
     y = passedY;
    
   }
  


 void drawBlock(){
   if (alive){
       rect(x,y,70,70);
   }
  
 }
 
}