/* Each player, whether an opponent or us */

public class Player {
    
  private int race; // 0 = terran, 1 = zerg, 2 = protoss. 
  private int health;
  private int resources;
  //Tree techTree; for later implementation if we have time
  private boolean isDead;
  public Card activeSpell;
  public Deck deck;
  String name;

  //constructor
  public Player(String newName, int cRace, Deck cDeck) {
    race = cRace;
    health = 30;
    resources = 1;
    isDead = false;
    deck = cDeck;
    name = newName;
  }
    
  // Mutators and Accessors
  public int getRace() {
    return race;
  }

  public String getName() {
    return name;
  }

  public int getHealth() {
    return health;
  }

  public Deck getDeck() {
    return deck;
  }

  public int setHealth(int newHealth) {
    int temp = health;
    health = newHealth;
    return temp;
  }

  public int getResources() {
    return resources;
  }

  public int setResources(int newResources) {
    int temp = resources;
    resources = newResources;
    return temp;
  }

  public boolean isDead() {
    if (health <= 0) {
      isDead = true;
    }
    else {
      isDead = false;
    }
    return isDead;
  }

  public float hpPercent() {
    float hpPercent = ((float)(health)) / ((float)(30));
    return hpPercent * PI;
  }

  public void playCard(int index) {
    int manacost = deck.getHand()[index].getCost();
    if (mana - manacost >= 0) {
      deck.playCard(index);
    }
    else {
      return;
    }
  }
  
}
