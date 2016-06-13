public class Medic extends Unit {

  public Medic(Deck newDeck) {
    super(3, 0, 0, 2, newDeck);
    name = "Medic";
    isAerial = false;
    isCloaked = false;
    isDetector = false;
  }

  public PImage getImage() {
    return loadImage("medic.jpg");
  }

  public String getDescription() {
    return "Heals an allied unit or player for 2.";
  }

  public void ability(Object target) {
    if (target instanceof Player) {
      ((Player)target).setHealth(((Player)target).getHealth() + 2);
    }
    else if (target instanceof Unit) {
      ((Unit)target).setHealth(((Unit)target).getHealth() + 2);
    }
    else {
      return;
    }
  }
  
}
