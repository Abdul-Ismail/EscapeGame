class background_bg{
  PImage fullBG;
  background_bg(){
        fullBG = loadImage("bg.png");
        bg = fullBG.get(xBG , yBG, 600, 600);
  }
  
  
  void updateBG(){
    if (right && xBG < 424 && xPlayer > 490){
    xBG= xBG+3;
     bg = fullBG.get(xBG , yBG, 600, 600);
     println(x);
    }if (left && xBG > 0 && xPlayer < 60){
      xBG = xBG-3;
     bg = fullBG.get(xBG , yBG, 600, 600);
     println(x);
    }if (down && yBG < 424 && yPlayer > 490){
    yBG= yBG+3;
     bg = fullBG.get(xBG , yBG, 600, 600);
     println(x);
    }if (up && yBG > 0 && yPlayer < 60){
      yBG = yBG - 3;
     bg = fullBG.get(xBG , yBG, 600, 600);
     println(x);
    }
  }
}