public class Player {
  private PVector loc;
  private PVector speed;
  private int l = 70;  
  private int w = 60;
  private int col;
  
  public Player(PVector loc, PVector speed) {
    this.loc = loc;
    this.speed = speed;
  }
  
  public void setColor(int col) {
    this.col = col;
  }
  
  public int getColor() {
    return this.col;
  }
  
  public boolean collides(float x, float y) {
    PVector point = new PVector(x, y);
    float dist = PVector.dist(this.loc, point);
    
    return dist <= l;
  }
  
  void draw() {
    noStroke();
    fill(col);
    ellipse(loc.x, loc.y, l, w);
  }
  
  public float getXLoc() {
    return loc.x;
  }
  
  public float getYLoc() {
    return loc.y;
  }
  
  public PVector getLoc() {
    return loc;
  }
  
  public PVector getSpeed() {
    return speed;
  }
  
  public void setLoc(float x, float y) {
    loc = new PVector(x, y);
  }
  
  public void setLoc(PVector loc) {
    this.loc = loc;
  }
  
  public void setSpeed(PVector speed) {
    this.speed = speed;
  }
  
  public void move() {
    this.loc.y += speed.y;
  }
}