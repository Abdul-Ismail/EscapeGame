class background_bg{
  PImage fullBG;
  int x,y;
  background_bg(){
        fullBG = loadImage("bg.png");
        bg = fullBG.get(x , y, 600, 600);
  }
  
  
  void updateBG(){
    if (right && x < 424 && xPlayer > 400){
    x++;
     bg = fullBG.get(x , y, 600, 600);
     println(x);
    }else if (left && x > 0 && xPlayer < 50){
      x--;
     bg = fullBG.get(x , y, 600, 600);
     println(x);
    }
  }
}