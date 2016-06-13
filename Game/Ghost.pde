public class Ghost extends Unit {

  public Ghost(Deck newDeck) {
    super(3, 3, 3, 3, newDeck);
    name = "Ghost";
    isAerial = false;
    isCloaked = true;
    isDetector = false;
  }

  public PImage getImage() {
    return loadImage("ghost.jpg");
  }

  public String getDescription() {
    return "Kills a damaged unit, but dies in return.";
  }

  public void ability(Unit target) {
    if (target.getHealth() == target.getMaxHealth()) {
      return;
    }
    else if (target.getHealth() < target.getMaxHealth()) {
      target.setHealth(0);
      this.setHealth(0);
    }
  }
  
}
