/* the basic super-class for each type of unit */

public class Unit extends Card {
	
  // do we need boolean? or just function
  private boolean isDead;
  //all of them will have health
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

  public int getHealth() {
    return health;
  }
  
  public int setHealth(int newHP) {
    int temp = health;
    health = newHP;
    return temp;
  }

  public int getAttack() {
    return attack;
  }

  public int setAttack(int newAttack) {
    int temp = attack;
    attack = newAttack;
    return temp;
  }
  
  protected boolean isDead() {
    if( health <= 0 ) {
      isDead = true;
    }
    else {
      isDead = false;
    }
    return isDead;
  }
  
  void draw() {
    
  }
  
}
