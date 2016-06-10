Player p1;
Player p2;
Deck ayy;

void setup() {
  size(1024, 720);
  background(255);
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
  // fill(24, 134, 45);
  // arc(width / 2, 0, 225, 225, 0, PI);
  // arc(width / 2, height, 225, 225, -PI, 0);

  // //remove health
  // fill(0);
  // arc(width / 2, 0, 225, 225, 0, PI - p2.hpPercent());
  // arc(width / 2, height, 225, 225, p1.hpPercent() - PI, 0);
  translate(width / 2, height / 2);
    fill(149, 75, 0);
    beginShape();
    for (int i=0; i<=1; i+= 0.01) {
      float angle = i*360;
      float x = cos(angle) * 200;
      float y = sin(angle) * 200;
      vertex(x, y);
    }
    endShape();
  
  //player 2 image
  // noFill();
  // beginShape();
  // //  texture(whichClass(p2));
  // curveVertex((width / 2) - 200, 0);
  // curveVertex((width / 2), 200);
  // endShape();
  // //player 1 image
  // beginShape();
  // //  texture(whichClass(p1));

  // endShape();
  
  //testing tool
  if (mousePressed) {
    p1.setHealth(p1.getHealth() - 1);
    p2.setHealth(p2.getHealth() - 1);
    System.out.println(p1.getHealth());
  }
  noFill();

  
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
