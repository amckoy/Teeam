import java.util.Queue;

// Attributes
Queue turnOrder;
Player p1;
Player p2;

void setup() {
  size(1024, 720);
  background(0);
  // for( int i = 0; i < 8; i++ ){
  //   p1.getDeck().drawCard();
  //   p2.getDeck().drawCard();
  // }
  // for ( int i = 0; i < p1..length+5; i++ ) {
  //   rect( width / (p1.units.length + 2) * (i+1), height/4 * 3, 50, 50);
  // }
  // System.out.println(p1.hand[4]);
}

void draw() {
  //perform game logic FIRST

  //GAME LOGIC

  //update graphics SECOND
  String p1name = "";
  String p2name = "";
  if (keyPressed) {
    while (key != ENTER || key != RETURN) {
      textSize(32);
      text("Player 1, please enter your name: " + p1name, width / 2, height / 2);
      if (key == ESC) {
        redraw();
      }
      else if (key == BACKSPACE) {
        p1name = p1name.substring(0, p1name.length() - 1);
      }
      else if (key != ENTER && key != RETURN) {
        p1name += key;
      }
    }
    while (key != ENTER || key != RETURN) {
      textSize(32);
      text("Player 2, please enter your name: " + p2name, width / 2, height / 2);
      if (key == ESC) {
        redraw();
      }
      else if (key == BACKSPACE) {
        p2name = p2name.substring(0, p2name.length() - 1);
      }
      else if (key != ENTER && key != RETURN) {
        p2name += key;
      }
    }
  }
  
  p1 = new Player(p1name, 0, new Deck());
  p2 = new Player(p2name, 1, new Deck());
  p1.getDeck().marines();
  p2.getDeck().marines();

  if (p1.isDead()) {
    fill(0, 200);
    rect(0, 0, 1024, 720);
    textSize(32);
    text(p2.getName() + "has won!", width / 2, height / 2);
  } else if (p2.isDead()) {
    fill(0, 200);
    rect(0, 0, 1024, 720);
    textSize(32);
    text(p1.getName() + "has won!", width / 2, height / 2);
  }

  // //health
  fill(24, 134, 45);
  arc(width / 2, 0, 225, 225, 0, PI);
  arc(width / 2, height, 225, 225, -PI, 0);

  // //remove health
  fill(0);
  arc(width / 2, 0, 225, 225, 0, PI - p2.hpPercent());
  arc(width / 2, height, 225, 225, p1.hpPercent() - PI, 0);

  //testing tool
  if (mousePressed) {
    p1.setHealth(p1.getHealth() - 1);
    p2.setHealth(p2.getHealth() - 1);
    System.out.println(p1.getHealth());
  }
}

//returns the player image of whichever class they belong to
PImage whichClass(Player p) {
  if (p.getRace() == 0) {
    return loadImage("terran.jpg");
  } else if (p.getRace() == 1) {
    return loadImage("zerg.jpg");
  } else {
    return loadImage("protoss.jpg");
  }
}
