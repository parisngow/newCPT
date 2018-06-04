import java.util.Random;

public class Game {
  
  ArrayList<Object> cells = new ArrayList();
  ArrayList<Obstacle> obstacles = new ArrayList();
  
  void draw() {
    background(255, 255, 255);
   
   int frameAdjust = 0;
    if (frameCount % 180 == 0) {
      generateCells();
    } else if (levelScore > 0 && levelScore == 9 && frameCount % 180 - frameAdjust == 0) {
      for (Object cell : cells) {
        PVector newSpeed = new PVector(0, 2);
        cell.update(newSpeed);
      }
      frameAdjust = levelScore + 1; 
    }
    
    if (frameCount % 200 == 0) {
      generateObstacles();
    } else if (levelScore > 0 && levelScore == 9 && frameCount % 200 - frameAdjust == 0) {
      generateObstacles();
    } 
   
    //draw and move cells
    for (Object cell : cells) {
      cell.draw();
      cell.move();
    }
    
    //draw and move obstacles 
    for (Obstacle obstacle : obstacles) {
      obstacle.draw();
      obstacle.move();
    }
     
    player.draw();
    
    //check collision && if cell passed screen boundaries
    for (int i = 0; i < cells.size(); i++) {
      if (cells.get(i).collides(player.loc.x, player.loc.y) && cells.get(i).getColor() == player.getColor()) {
        println("collision");
        cells.remove(i);
        score ++;
        levelScore ++;
        
        //change player character
        if (levelScore == 9) {
          Random rand = new Random();
          int[] colors = {
            #3498DB, //blue
            #A569BD, //purple
            #E67E22, //orange
            #28B463, //green
            #F4D03F, //yellow
          };
          player.setColor(colors[rand.nextInt(colors.length)]);
          levelScore = 0;
        }
        
      } else if (cells.get(i).collides(player.loc.x, player.loc.y) && cells.get(i).getColor() != player.getColor()) {
        println("wrong collision");
        cells.remove(i);  
        score --;
        
        if (score < 1) {
          gameScreen = 4;
          restart();
        }
        
      } else if (cells.get(i).getYLoc() >= 660) {
        println("removed cell");
        cells.remove(i);
      }
    }
    
    for (int n = 0; n < obstacles.size(); n++) {
       if (obstacles.get(n).collides(player.loc.x, player.loc.y)) {
        println("game over");
        gameScreen = 4;
        restart();
      } else if (obstacles.get(n).getYLoc() >= 600) {
        println("removed obstacle");
        obstacles.remove(n);
      }
    }
     
    fill(0);
    textSize(20);
    text("SCORE: " + score, 10,30);
  }
  
  void generateCells() {
    Random rand = new Random();
    
    int[] colors = {
      #3498DB, //blue
      #A569BD, //purple
      #E67E22, //orange
      #28B463, //green
      #F4D03F, //yellow
    };
    int colorLoc = rand.nextInt(colors.length);
    
    PVector cLoc = new PVector(random(35, width-35), 0);
    PVector cSpeed = new PVector(0, +2);
    Object newCell = new Object(cLoc, cSpeed);
    newCell.setColor(colors[colorLoc]);
    cells.add(newCell);
  }
  
  void generateObstacles() {
    PVector oLoc = new PVector(random(20, width-20), 0);
    PVector oSpeed = new PVector(0, +2);
    Obstacle newObst = new Obstacle(oLoc, oSpeed);
    obstacles.add(newObst);
  }

  void restart() {
    gameOver.roundScore(score);
    score = 0;
    cells.clear();
    obstacles.clear();
  }
}