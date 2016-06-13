public class Firebat extends Unit {

  public Firebat(Deck newDeck) {
    super(2, 0, 3, 2, newDeck);
    name = "Firebat";
    isAerial = false;
    isCloaked = false;
    isDetector = false;
  }

  public PImage getImage() {
    return loadImage("firebat.jpg");
  }

  public String getDescription() {
    return "";
  }
  
}
