  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  ArrayList<Gaurd> gaurds = new ArrayList<Gaurd>();
  
movePlayer playerMove;
background_bg Background;
Level level;
int x,y;
static boolean right, left, up, down;
static float xPlayer = 200;
static float yPlayer = 300;
static float rotate;
static PImage bg;
static int xBG;
static int yBG = 424;
static boolean reset = false;

  void setup(){
      size(600, 600);
      Player.character = loadImage("player.png");
      playerMove = new movePlayer();
      Background = new background_bg();
      level = new Level();
      gaurds.add(new Gaurd());

  }

  void draw(){
      background(bg);
      
      Player.reposition();

      playerMove.drawPlayer();
      playerMove.movePlayer();
      drawBulletinDraw();
      Background.updateBG();
      Background.statBar();
      level.enteredDoor();
      level.createLevel();

  
  
         for(int i = 0; i <gaurds.size(); i++){
            Gaurd gaurd = gaurds.get(i);
            gaurd.drawGaurd(); //draw the gaurd
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
                float cords[] = new  float[2]; //to stores bullet cords from getCords method
     
                Bullet bullet = bullets.get(i);
                bullet.drawBullet();
                cords = bullet.getBulletCords(); //getting bullet cords
                  
                  //checks if the bullet has hit the gaurd
                  for(int j = 0; j <gaurds.size(); j++){
                      Gaurd gaurd = gaurds.get(j);
                      gaurd.gaurdHit(cords[0], cords[1], j, i); //bullet cords passed
                    }
  
            bullet.checkBulletState(i);//if bullet is gona outside screen, arraylist is removed
        }
    }
 }

 //called when bullet button is pressed
 void shootPressed(){
       if (Player.bullets > 0){
       bullets.add(new Bullet()); //adds bullet by adding arraylist
       Bullet bullet = bullets.get(bullets.size()-1); //get the most recent bullet from list
       float playerRotationWhenShotFired = rotate; //pass current player rotate position when bullet was fired to know which way bullet will go
       bullet.bulletCords(xPlayer, yPlayer, playerRotationWhenShotFired); //bullet cords at start is based from the players position
       Player.bullets--;
       }
       
 }