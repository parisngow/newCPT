class GameOver {
  private int currentScore;
  
  public void roundScore(int score) {
    currentScore = score;
  }
  
  void draw() {
    background(0);
    
    fill(#EC7063);
    textSize(60);
    text("GAME OVER", 120, 290);
    
    fill(#FFFFFF);
    textSize(20);
    text("YOUR SCORE: " + currentScore, 215, 330);
    
    text("PRESS BACKSPACE TO RETURN TO MENU", 100, 400);
  }
}