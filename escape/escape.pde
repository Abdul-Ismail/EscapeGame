  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  
Player player;
int x,y;
static boolean right, left, up, down;
static float xPlayer;
static float yPlayer;
static   float rotate;

void setup(){
  size(600, 600);
  player = new Player();
}

void draw(){
  background(255);
  player.drawPlayer();
  player.movePlayer();
  drawBulletinDraw();
}



void keyPressed(){
  if (keyCode == RIGHT)   right = true; 
  if (keyCode == LEFT)   left = true; 
  if (keyCode == UP)   up = true; 
  if (keyCode == DOWN)   down = true; 
  if (key == 'a') shootPressed();

}

void keyReleased(){
  if (keyCode == RIGHT)   right = false; 
  if (keyCode == LEFT)   left = false; 
  if (keyCode == UP)   up = false; 
  if (keyCode == DOWN)   down = false; 
}


void drawBulletinDraw(){
  if (bullets.size() > 0){
     
      for(int i = 0; i <bullets.size(); i++){
        Bullet bullet = bullets.get(i);
        bullet.drawBullet();
        bullet.checkBulletState(i);
         //if (!bulletAlive){
           //  bullets.remove(i);
         //}
      }
  }
}

 void shootPressed(){
       bullets.add(new Bullet());
       Bullet bullet = bullets.get(bullets.size()-1);
       float playerRotationWhenShotFired = rotate;
       bullet.bulletCords(xPlayer, yPlayer, playerRotationWhenShotFired);    
}