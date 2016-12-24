class Player{
  
  PImage character;
  float r = 0;
  PVector cords;
  int imgSize = 100;
  float playerSpeed = 5;
  
  float playerRotationWhenShotFired;
  
  Player(){
    character = loadImage("player.png");
  }
  
  
  void drawPlayer(){
      //ellipse(xPlayer,yPlayer,30,30);
      pushMatrix();
      translate(xPlayer + imgSize/2, yPlayer +imgSize/2);
      rotatePlayer();
      translate(-imgSize/2, -imgSize/2);
      image(character, 0, 0, imgSize, imgSize);
      popMatrix();
      r += 0.05;
      
  }
  

void movePlayer(){
    if(left){
     xPlayer -= playerSpeed;
  }if (right){
     xPlayer += playerSpeed;
  }if (up){
     yPlayer -= playerSpeed;
  }if (down){
     yPlayer += playerSpeed;
  }
  println(bullets.size());
}

 void rotatePlayer(){
   
       if (right && up){
            rotate = 1.2;
       }else if (right && down){
             rotate = 2.2;
       }else if (left && up){
              rotate = 5.2;
       }else if (left && down){
             rotate = 4.2;
       }
       else if (left){
          rotate = 4.7;
       }else if (right){
         rotate = 1.6;
       }else if (up){
         rotate = 0;
       }else if (down){
         rotate = 3.2;
       }
       rotate(rotate);
      
      //0 up
      //1.2 right up
      //1.6 right
      //2.2 down right
      //3.2 down
      //4.2 down left
      //4.7 left
      //5.2 left up 
 }
 
       

}