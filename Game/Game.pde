<<<<<<< HEAD
Player p1;
Player p2;
Deck ayy;

void setup() {
  size(1024, 720);
  background(0);
  p1 = new Player(0, ayy);
  p2 = new Player(1, ayy);

}

void draw() {
  //more testing, it should do something besides autoreset
  if (p1.isDead()) {
    p1.setHealth(30);
  }
  else if (p2.isDead()) {
    p2.setHealth(30);
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
  }
  else if (p.getRace() == 1) {
    return loadImage("zerg.jpg");
  }
  else {
    return loadImage("protoss.jpg");
  }
}
=======
import java.util.Queue;

// Attributes
Player p1;
Player p2;
Queue turnOrder;
Deck p1Deck;
Deck p2Deck;

void setup() {
  size(1000, 720);
  background(0);
  p1 = new Player(0, p1Deck);
  p2 = new Player(1, p2Deck);
  for ( int i = 0; i < p1.units.length+5; i++ ) {
    rect( width / (p1.units.length + 2) * (i+1), height/4 * 3, 50, 50);
  }
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
>>>>>>> c72c97cc65088a045fa009a9cf73bf0348d7c810
