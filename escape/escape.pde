ArrayList<Block> blocks = new ArrayList<Block>();
Player player;

static float xPlayer = 75;
static float yPlayer = 115;
static boolean playerMoving = false;
static boolean up, down, left, right;
static boolean regenerating;
static int[] xPositions = new int[7];
static int[] yPositions = new int[7];

void setup(){
  size(600,600);
  player = new Player();
    for (int i = 0; i < 7; i++){
      for (int j = 0; j < 7; j++){
        blocks.add(new Block(50+(j*70), 80+(i*70)));
      }
    }

}

void draw(){

   background(0);
   for(int i = 0; i < blocks.size(); i++)
    {
      Block block = blocks.get(i);
      block.drawBlock();
    }
    
    player.drawPlayer();
}

void keyPressed(){

}

void mouseClicked(){

 for(int i = 0; i < blocks.size(); i++)
    {
      Block block = blocks.get(i);
      block.updateArrow();;
    } 
  
}