/* if gameScreen =
0, menu
1, start game
2, instructions
3, about
4, game over*/
int gameScreen = 0;

Menu menu;

Button instructions;
Instructions instr;

Button aboutButton;
About about;

Button start;
Game game;
GameOver gameOver;
Object player;
int score;
int levelScore;

void setup() {
  size(600, 600);
  
  menu = new Menu();
  gameOver = new GameOver();
  
  //initalize instructions screen and button
  instr = new Instructions();
  instructions = new Button(100, 200);
  instructions.setFunction("INSTRUCTIONS", 110, 255);
  
  //initialize about screen and button
  about = new About();
  aboutButton = new Button(350, 200);
  aboutButton.setFunction("ABOUT", 395, 245);
  
  //initalize game and button to start game
  game = new Game();
  start = new Button (225, 350);
  start.setFunction("START", 272, 408);
  
  //initalize beginning score and level for game
  score = 0;
  levelScore = 0;

  //initalize player
  PVector pLoc = new PVector(300, 500);
  PVector pSpeed = new PVector(0, 0);
  player = new Object(pLoc, pSpeed);
  
  player.setColor(#3498DB);
}

void draw() {
  if (gameScreen == 0) {
    menu.draw();
  } else if (gameScreen == 1) {
    game.draw();
  } else if (gameScreen == 2) {
    instr.draw();
  } else if (gameScreen == 3) {
    about.draw();
  } else if (gameScreen == 4) {
    gameOver.draw();
  }
}

void mouseClicked() {
  if (mouseX > instructions.getX() && mouseX < instructions.getX() + instructions.getLength() 
      && mouseY > instructions.getY() && mouseY < instructions.getY() + instructions.getWidth()) {
    System.out.println("instructions");
    gameScreen = 2;
  }
  
  if (mouseX > aboutButton.getX() && mouseX < aboutButton.getX() + aboutButton.getLength() && mouseY > aboutButton.getY()
      && mouseY < aboutButton.getY() + aboutButton.getWidth()) {
    System.out.println("about");
    gameScreen = 3;
  }
  
  if (mouseX > start.getX() && mouseX < start.getX() + start.getLength() && mouseY > start.getY()
      && mouseY < start.getY() + start.getWidth()) {
    System.out.println("start");
    gameScreen = 1;
  }
}

void keyReleased() {
  if (key == BACKSPACE) {
    gameScreen = 0;
    System.out.println("back");
  }
}

//move player in game according to mouse
void mouseMoved() {
  player.loc.set(mouseX, 500);
  
    if (mouseX <= player.getWidth()/2) {
    player.loc.set(player.getWidth()/2, 500);
  } else if (mouseX >= 600-(player.getWidth()/2)) {
    player.loc.set(600-player.getWidth()/2, 500);
  }
    
}