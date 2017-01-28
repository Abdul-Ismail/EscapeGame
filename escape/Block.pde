class Block{
  
     
   float x,y;
   boolean alive;
   
   Block(float passedX, float passedY){
     x = passedX;
     y = passedY;
   }
  


 void drawBlock(){
    
   rect(x,y,50,50);
 }
 
}