
Player player;
int x,y;
static boolean right, left, up, down;

void setup(){
  size(600, 600);
  player = new Player();
}

void draw(){
  background(0);
  player.drawPlayer();
  player.movePlayer();
}



void keyPressed(){
  if (keyCode == RIGHT)   right = true; 
  if (keyCode == LEFT)   left = true; 
  if (keyCode == UP)   up = true; 
  if (keyCode == DOWN)   down = true; 

}

void keyReleased(){
  if (keyCode == RIGHT)   right = false; 
  if (keyCode == LEFT)   left = false; 
  if (keyCode == UP)   up = false; 
  if (keyCode == DOWN)   down = false; 
}