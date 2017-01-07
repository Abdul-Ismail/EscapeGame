class background_bg{
  PImage fullBG;
  background_bg(){
        fullBG = loadImage("bg.png");
        bg = fullBG.get(xBG , yBG, 600, 600);
  }
  
  
  void updateBG(){

    if (right && xBG < 424 ){
    xBG= xBG+int(Player.playerSpeed);
    }if (left && xBG > 0 ){
      xBG = xBG-int(Player.playerSpeed);
    }if (down && yBG < 424){
    yBG= yBG+int(Player.playerSpeed);
    }if (up && yBG > 0 ){
      yBG = yBG - int(Player.playerSpeed);
    }
    
         bg = fullBG.get(xBG , yBG, 600, 600);
  }
  
    void statBar(){
    rect(0,0, 600, 50);
    fill(0, 102, 153);
    text("lives",10,25);
    text(Player.lives,40,25);
    text("bullets",80,25);
    text(Player.bullets,130,25);
    text("bullets",160,25);
    text(Player.level,210,25);
  }
  
  
}