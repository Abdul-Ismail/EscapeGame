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
  
  float[] getBulletCords(){  
    float cords[] = new  float[2];
     cords[0] = xBullet;
     cords[1] = yBullet;
    
   return cords;
       
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
      
    void checkBulletState(int i){
         if (xBullet > width || xBullet < 0 || yBullet < 0 || yBullet > height){
            bullets.remove(i);
         }
    }
}