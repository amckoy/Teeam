import java.util.Queue;

// Attributes
Queue turnOrder;
Player p1;
Player p2;

void setup() {
  size(1000, 720);
  background(0);
  p1 = new Player(0, new Deck());
  p2 = new Player(1, new Deck());
  p1.getDeck().marines();
  p2.getDeck().marines();
  for( int i = 0; i < 8; i++ ){
    p1.getDeck().drawCard();
    p2.getDeck().drawCard();
  }
  for ( int i = 0; i < p1..length+5; i++ ) {
    rect( width / (p1.units.length + 2) * (i+1), height/4 * 3, 50, 50);
  }
  System.out.println(p1.hand[4]);
}

void draw() {
  //perform game logic FIRST

  //GAME LOGIC

  //update graphics SECOND

  if (p1.isDead()) {
    p1.setLife(30);
  } else if (p2.isDead()) {
    p2.setLife(30);
  }

  // //health
  fill(24, 134, 45);
  arc(width / 2, 0, 225, 225, 0, PI);
  arc(width / 2, height, 225, 225, -PI, 0);

  // //remove health
  fill(0);
  arc(width / 2, 0, 225, 225, 0, PI - p2.lifePercent());
  arc(width / 2, height, 225, 225, p1.lifePercent() - PI, 0);

  //testing tool
  if (mousePressed) {
    p1.setLife(p1.getLife() - 1);
    p2.setLife(p2.getLife() - 1);
    System.out.println(p1.getLife());
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
