/* the basic super-class for each type of unit */

public class Unit extends Card {
	
  // do we need boolean? or just function
  private boolean isDead;
  //protected because only actually initialized units will have this
  protected boolean isAerial;
  protected boolean isCloaked;
  protected boolean isDetector;
  private int maxHealth;
  private int health;
  private int groundattack;
  private int airattack;
  //this is to make life easier for abilities and such
  private Deck deck;
  
  public Unit(int hp, int gratk, int airatk, int newCost, Deck newDeck) {
    super(newCost);
    health = hp;
    maxHealth = hp;
    groundattack = gratk;
    airattack = airatk;
    isDead = false;
    deck = newDeck;
  }

	//Accessors + Mutators
  public int getMaxHealth() {
    return maxHealth;
  }

  public Deck getDeck() {
    return deck;
  }

  public int getGroundAttack() {
    return groundattack;
  }

  public int getAirAttack() {
    return airattack;
  }

  public int getHealth() {
    return health;
  }

  public boolean isDead() {
    if( health <= 0 ) {
      isDead = true;
    }
    else {
      isDead = false;
    }
    return isDead;
  }

  public boolean isAerial() {
    return isAerial;
  }

  public boolean isCloaked() {
    return isCloaked;
  }

  public boolean isDetector() {
    return isDetector;
  }

  public boolean setAerial(boolean newAerial) {
    boolean temp = isAerial;
    isAerial = newAerial;
    return temp;
  }

  public boolean setCloaked(boolean newCloaked) {
    boolean temp = isCloaked;
    isCloaked = newCloaked;
    return temp;
  }

  public boolean setDetector(boolean newDetector) {
    boolean temp = isDetector;
    isDetector = newDetector;
    return temp;
  }
  
  public int setHealth(int newHP) {
    int temp = health;
    health = newHP;
    return temp;
  }

  public int setGroundAttack(int newAttack) {
    int temp = groundattack;
    groundattack = newAttack;
    return temp;
  }

  public int setAirAttack(int newAttack) {
    int temp = airattack;
    airattack = newAttack;
    return temp;
  }  
  
  void draw() {
    
  }
  
}
