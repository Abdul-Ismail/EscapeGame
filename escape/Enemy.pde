class Enemy{
   float[] enemyPosition = new float[2];
   int numberOfEnemies;
   int currentEnemies;
   boolean doneOnce;
   int cordsAt;
   boolean enemyAtPickedCords;
   
   Enemy(){
      numberOfEnemies = 5;
    }
  
  void drawEnemy(){
     if (!doneOnce){
       cordsAt = int(random(1,49));
     Block block = blocks.get(cordsAt);
           enemyAtPickedCords = block.checkIfEnemyIsPresent();
            if (!enemyAtPickedCords){
           enemyPosition = block.randomCords(true);
           doneOnce = true;
            }
     }
          
    currentEnemies++;
             fill(56,45,89);
             if(xPlayer == enemyPosition[0] && yPlayer == enemyPosition[1] ){
               Block block = blocks.get(cordsAt);
               block.randomCords(false);
                enemies.remove(this);
             }
             ellipse(enemyPosition[0], enemyPosition[1], 60, 60);
  }
  
  //1 -5 normal, 10 moves
  //4 - 10, 5 moves
  //1- = 15 
}