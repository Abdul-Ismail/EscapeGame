class Bullet{
  float xBullet;
  float yBullet;
  float bulletSpeed;
  boolean shotRequested;
  float playerRotationWhenShotFired;
  
  Bullet(){
    
  }
  
  void bulletCords(float x, float y, float r){
   xBullet = x;
   yBullet = y;
   playerRotationWhenShotFired = r;
  }
  
   void drawBullet(){
     ellipse(xBullet, yBullet, 30,30);

         if (playerRotationWhenShotFired == 1.6){
              xBullet += 15;
         }else if (playerRotationWhenShotFired == 0){
              yBullet -= 15;
         }else if (playerRotationWhenShotFired == 3.2){
              yBullet += 15;
         }else if (playerRotationWhenShotFired == 4.7){
              xBullet -= 15;
         }else if (playerRotationWhenShotFired == 1.2){
              xBullet += 15;
              yBullet -= 5;
         }else if (playerRotationWhenShotFired == 5.2){
              xBullet -= 15;
              yBullet -= 5;
         }else if (playerRotationWhenShotFired == 2.2){
              xBullet += 15;
              yBullet += 5;
         }else if (playerRotationWhenShotFired == 4.2){
              xBullet -= 15;
              yBullet += 5;
         }   
         
      }
}