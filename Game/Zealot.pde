public class Zealot extends Unit {
  
  public Zealot(Deck newDeck) {
    super(2, 1, 1, newDeck);
    name = "Zealot";
  }

  public PImage getImage() {
    return loadImage("zealot.jpg");
  }

  public String getDescription() {
    return "";
  }
  
}
