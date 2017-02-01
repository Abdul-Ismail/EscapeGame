class Enemy{
   float[] enemyPosition = new float[2];
   int numberOfEnemies;
   int currentEnemies;
   boolean doneOnce;
   int cordsAt;
   
   Enemy(){
      numberOfEnemies = 5;
      cordsAt = int(random(1,49));
    }
  
  void drawEnemy(){
     if (!doneOnce){
     Block block = blocks.get(cordsAt);
           enemyPosition = block.randomCords(true);
           doneOnce = true;
     }
          
    currentEnemies++;
             fill(56,45,89);
             if(xPlayer == enemyPosition[0] && yPlayer == enemyPosition[1] ){
               Block block = blocks.get(cordsAt);
               block.randomCords(false);
                enemies.remove(0);
             }
             ellipse(enemyPosition[0], enemyPosition[1], 60, 60);
  }
}