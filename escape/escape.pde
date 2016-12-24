  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  ArrayList<Gaurd> gaurds = new ArrayList<Gaurd>();
  
Player player;
int x,y;
static boolean right, left, up, down;
static float xPlayer;
static float yPlayer;
static   float rotate;

void setup(){
  size(600, 600);
  player = new Player();
  
  gaurds.add(new Gaurd());

}

void draw(){
  background(255);
  player.drawPlayer();
  player.movePlayer();
  drawBulletinDraw();
  
  
   for(int i = 0; i <gaurds.size(); i++){
      Gaurd gaurd = gaurds.get(i);
      gaurd.drawGaurd();
   }
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
        float cords[] = new  float[2];
        
        Bullet bullet = bullets.get(i);
        bullet.drawBullet();
        cords = bullet.getBulletCords();
        
        for(int j = 0; j <gaurds.size(); j++){
        Gaurd gaurd = gaurds.get(j);
        gaurd.gaurdHit(cords[0], cords[1], j, i);
        }
  
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