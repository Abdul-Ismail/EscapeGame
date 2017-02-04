class mouseDrop{
  
  int blockSize = 70;
  int playerSize = 25;
  boolean mouseInBlock;
  float[] dropPosition = new float[2];
  boolean pickedArrows;

  
  void selectPackage(){
    
    if (pickedArrows){
         ellipse(mouseX, mouseY, 30, 30);
    }
    

    
  }
  
  void mouseClickedOnBlock(){
 
       if (pickedArrows){      
        for(int  i = 0; i < blocks.size(); i++)
          {
            Block block = blocks.get(i);
             mouseInBlock = block.overBlock(); 
                if (mouseInBlock){
                    dropPosition = block.randomCords();
                    block.swapWithPackage(2);   
                    pickedArrows = false;
                  }
          } 
       }
          
          
          if (!pickedArrows){
       float d = dist(500, 30, mouseX, mouseY);
         if (d < 25){
              pickedArrows = true;
         }       
  }
  
}
}