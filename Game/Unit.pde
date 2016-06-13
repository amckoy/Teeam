<<<<<<< HEAD
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
  private int attack;
  //this is to make life easier for abilities and such
  private Deck deck;
  
  public Unit(int hp, int atk, int newCost, Deck newDeck) {
    super(newCost);
    health = hp;
    maxHealth = hp;
    attack = atk;
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

  public int getAttack() {
    return attack;
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

  public int setAttack(int newAttack) {
    int temp = attack;
    attack = newAttack;
    return temp;
  }

  
  
  void draw() {
    
  }
  
}
=======
public class Unit extends Card {

  //Attributes
  boolean isDead;
  boolean isAerial;
  boolean isCloaked;
  boolean isDetector;
  int maxLife;
  int life;
  int groundAttack;
  int airAttack;

  //Constructors
  Unit() {
    this(0, "foo", false, false, false, 1, 1, 1, 1);
  }

  Unit(int newCost, String newName, boolean newIsAerial, boolean newIsCloaked, boolean newIsDetector, int newMaxLife, int newLife, int newGroundAttack, int newAirAttack) {
    super(newCost, newName);
    isDead = false;
    isAerial = newIsAerial;
    isCloaked = newIsCloaked;
    isDetector = newIsDetector;
    maxLife = newMaxLife;
    life = newLife;
    groundAttack = newGroundAttack;
    airAttack = newAirAttack;
  }

  //Accessors + Mutators
  int getMaxLife() {
    return maxLife;
  }
  
  void setMaxLife(int newMaxLife) {
    maxLife = newMaxLife;
  }

  int getLife() {
    return life;
  }

  void setLife(int newLife) {
    life = newLife;
  }

  int getGroundAttack() {
    return groundAttack;
  }

  void setGroundAttack(int newGroundAttack) {
    groundAttack = newGroundAttack;
  }

  int getAirAttack() {
    return airAttack;
  }

  void setAirAttack(int newAirAttack) {
    airAttack = newAirAttack;
  }

  boolean isDead() {
    if ( life <= 0 ) {
      isDead = true;
    }
    else{
      isDead = false;
    }
    return isDead;
  }

  boolean isAerial() {
    return isAerial;
  }

  void setIsAerial(boolean newIsAerial) {
    isAerial = newIsAerial;
  }

  boolean isCloaked() {
    return isCloaked;
  }

  void setIsCloaked(boolean newIsCloaked) {
    isCloaked = newIsCloaked;
  }

  boolean isDetector() {
    return isDetector;
  }

  void setIsDetector(boolean newIsDetector) {
    isDetector = newIsDetector;
  }
}
>>>>>>> c72c97cc65088a045fa009a9cf73bf0348d7c810
