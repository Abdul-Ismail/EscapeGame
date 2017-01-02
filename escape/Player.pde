static class Player{
  
  static PImage character;
  //static float r = 0;
  static int imgSize = 100;
  static float playerSpeed = 10;
  static int lives = 13;
  static int bullets = 15;
  static int level = 1;
  
  static float playerRotationWhenShotFired;
  
  Player(){
  
  }
  
  static void reposition(){
     if (reset){
            xPlayer = 0 - xBG;
            yPlayer =  942 - yBG;
   if (xBG > 0)
     {
        xBG = xBG - 3;
     }if (yBG < 424){
      yBG = yBG + 3;
    }else if (xBG <3) {
           reset = false;
     }
  }
  
  }
  

  
  
 
 
       

}