class mouseDrop{
  
  int blockSize = 70;
  int playerSize = 25;
  boolean mouseInBlock;
  float[] dropPosition = new float[2];

  
  void dropPackage(){
    
    

    
  }
  
  void mouseClickedOnBlock(){
 
             
        for(int  i = 0; i < blocks.size(); i++)
          {
            Block block = blocks.get(i);
             mouseInBlock = block.withinBlock(mouseX, mouseY); 
                if (mouseInBlock){
                    dropPosition = block.randomCords();
                    block.swapWithPackage(2);                
                  }
          }  
  }
  
}