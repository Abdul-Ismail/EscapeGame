class Level{
 
  
   int level;
  
  void updateLevel(){
     if (level < 5){
               level++;
               enemies.add(new Enemy());
           }
  }


  void printLevel(){
        fill(255);
        textSize(20);
        text(level, 50, 50); 
        
  }
  
}
  
 