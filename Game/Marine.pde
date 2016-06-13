public class Marine extends Unit {

  public Marine(Deck newDeck) {
    super(1, 2, 1, newDeck);
    name = "Marine";
  }

  public PImage getImage() {
    return loadImage("marine.jpg");
  }

  public String getDescription() {
    return "";
  }
  
}
