ArrayList<Block> blocks = new ArrayList<Block>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
Player player;

static float xPlayer = 75;
static float yPlayer = 115;
static boolean playerMoving = false;
static boolean up, down, left, right;
static boolean regenerating;
static int[] xPositions = new int[7];
static int[] yPositions = new int[7];
static   boolean pickCordsOnce;

void setup(){
  size(600,600);
  player = new Player();
    for (int i = 0; i < 7; i++){
      for (int j = 0; j < 7; j++){
        blocks.add(new Block(50+(j*70), 80+(i*70)));
      }
    }
    
    enemies.add(new Enemy());

}

void draw(){

   background(0);
   for(int i = 0; i < blocks.size(); i++)
    {
      Block block = blocks.get(i);
      block.drawBlock();
    }
    
    player.drawPlayer();
    
       for(int i = 0; i < enemies.size(); i++)
    {
        Enemy enemy = enemies.get(i);
        enemy.drawEnemy();
    }
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