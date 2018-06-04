class Button {
  private int x;
  private int y;
  private int l = 150;
  private int w = 100;
  
  String text;
  int textX;
  int textY;
  
  public Button (int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public void setFunction(String text, int textX, int textY) {
    this.text = text;
    this.textX = textX;
    this.textY = textY;
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public int getLength() {
    return l;
  }
  
  public int getWidth() {
    return w;
  }
  
  void draw() {
    fill(#EC7063);
    rect(x, y, l, w, 20);
    
    fill(0);
    textSize(18);
    text(text, textX, textY);
  }
}

public class Menu {
  void draw() {
    background(#FFFFFF);
    
    noStroke();
    fill(0);
    textSize(60);
    text("GAME", 200, 150);

    instructions.draw();
    aboutButton.draw();
    text("STEM CELLS", 375, 265);
    start.draw();
  }
}