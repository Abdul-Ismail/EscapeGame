ArrayList<Block> blocks = new ArrayList<Block>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
Player player;
Level level;

static float xPlayer = 75;
static float yPlayer = 115;
static boolean playerMoving = false;
static boolean up, down, left, right;
static boolean regenerating;
static int[] xPositions = new int[7];
static int[] yPositions = new int[7];
static boolean pickCordsOnce;
static int gameState = 1;
static int moves = 20;

void setup(){
  size(600,600);
  player = new Player();
  level = new Level();
    for (int i = 0; i < 7; i++){
      for (int j = 0; j < 7; j++){
        blocks.add(new Block(50+(j*70), 80+(i*70)));
      }
    }
    
    enemies.add(new Enemy());

}

void draw(){

   background(0);
   if (gameState == 1){
   level.gameStateTrack();
   for(int i = 0; i < blocks.size(); i++)
    {
      Block block = blocks.get(i);
      block.drawBlock();
    }
    level.printLevel();
    player.drawPlayer();
    
       for(int i = 0; i < enemies.size(); i++)
    {
        Enemy enemy = enemies.get(i);
        enemy.drawEnemy();
    }

     if (enemies.size() < 1 && !playerMoving){
             level.updateLevel();
     }

      }else if (gameState == 0){
          println("SSSSSSSSSS");
      }
}

void keyPressed(){
   if (!playerMoving){
                moves--;
   }
}

void mouseClicked(){

 for(int i = 0; i < blocks.size(); i++)
    {
      Block block = blocks.get(i);
      block.updateArrow();;
    } 
  
}