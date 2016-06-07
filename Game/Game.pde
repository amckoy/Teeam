Player p1;
Player p2;

void setup() {
  size(1024, 720);
  background(0);
  
  
}

void draw() {
  translate(width/2, height);
  rotate(PI);
  fill(24, 134, 45);
  arc(0, 0, 200, 200, 0, hpPercent(p2));
  //instead of pi, we use health left % * pi, and fill with green
  
  translate(0, height);
  rotate(PI);
  fill(24, 134, 45);
  arc(0, 0, 200, 200, 0, hpPercent(p1));
}

float hpPercent(Player p) {
  int hp = p.getHealth();
  float hpPercent = ((float)(hp)) / ((float)(100));
  return hpPercent * PI;
}
