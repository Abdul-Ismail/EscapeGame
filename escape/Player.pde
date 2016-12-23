class Player{
  float xPlayer;
  float yPlayer;
  
  Player(){
    
  }
  
  
  void drawPlayer(){
      ellipse(xPlayer,yPlayer,30,30);
  }


void movePlayer(){
    if(left){
     xPlayer--;
  }if (right){
    xPlayer++;
  }if (up){
    yPlayer--;
  }if (down){
    yPlayer++;
  }
}

}