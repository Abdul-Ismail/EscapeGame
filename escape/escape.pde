ArrayList<Block> blocks = new ArrayList<Block>();
Player player;

void setup(){
  size(600,600);
  player = new Player();
    for (int i = 0; i < 7; i++){
      for (int j = 0; j < 7; j++){
        blocks.add(new Block(10+(j*70), 10+(i*70)));
      }
    }

}

void draw(){
  
   for(int i = 0; i < blocks.size(); i++)
    {
      Block block = blocks.get(i);
      block.drawBlock();
    }
    
    player.drawPlayer();
}