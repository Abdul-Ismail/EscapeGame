class Level{
 
  
   int level;
  
  void updateLevel(){
     if (level < 5){
               level++;
               enemies.add(new Enemy());
               enemies.add(new Enemy());
               enemies.add(new Enemy());
               enemies.add(new Enemy());

           }
           
  }


  void printLevel(){
        fill(255);
        textSize(20);
        text(level, 50, 50); 
        text(moves, 100, 50); 
        text(trianglePoints, 470, 50);
        
        
  }
  
  void gameStateTrack(){
      if (moves == -1){
          gameState = 0;
      }
}
  
}
  
 