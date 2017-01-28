ArrayList<Block> blocks = new ArrayList<Block>();

void setup(){
  size(600,600);
    for (int i = 0; i < 5; i++){
      blocks.add(new Block(10, 10));
    }
}

void draw(){
  
   for(int i = 0; i < blocks.size(); i++)
    {
      Block block = blocks.get(0);
      block.drawBlock();
    }
}