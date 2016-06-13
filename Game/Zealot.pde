public class Zealot extends Unit {
  
  public Zealot(Deck newDeck) {
    super(2, 1, 1, newDeck);
    name = "Zealot";
    isAerial = false;
    isCloaked = false;
    isDetector = false;

  }

  public PImage getImage() {
    return loadImage("zealot.jpg");
  }

  public String getDescription() {
    return "";
  }
  
}
