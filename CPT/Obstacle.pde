public class Obstacle extends Object {
  private int l = 20;
  private int w = 50;
  
  public Obstacle (PVector loc, PVector speed) {
    super(loc, speed);
  }
  
  void draw() {
    noStroke();
    fill(0);
    rect(getXLoc(), getYLoc(), l, w);
  }
}