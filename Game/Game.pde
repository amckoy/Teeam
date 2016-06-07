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
  if (p1.isDead()) {
    p1.setHealth(30);
  }
  else if (p2.isDead()) {
    p2.setHealth(30);
  }
  fill(24, 134, 45);
  arc(width / 2, 0, 200, 200, 0, PI); 
  fill(24, 134, 45);
  arc(width / 2, height, 200, 200, -PI, 0);

  fill(0);
  arc(width / 2, 0, 200, 200, 0, PI - hpPercent(p2));
  fill(0);
  arc(width / 2, height, 200, 200, hpPercent(p1) - PI, 0);
  
  if (mousePressed) {
    p1.setHealth(p1.getHealth() - 1);
    p2.setHealth(p2.getHealth() - 1);
    System.out.println(p1.getHealth());
  }
  
}

float hpPercent(Player p) {
  int hp = p.getHealth();
  float hpPercent = ((float)(hp)) / ((float)(30));
  return hpPercent * PI;
}
