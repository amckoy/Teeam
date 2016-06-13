abstract class Spell extends Card {

  private int grounddamage;
  private int airdamage;
  private int heal;
  //this is to make life easier for abilities and such
  private Deck deck;

  public Spell(int grdmg, int airdmg, int hp, int newCost, Deck newDeck) {
    super(newCost);
    grounddamage = grdmg;
    airdamage = airdmg;
    heal = hp;
    deck = newDeck;
  }

  public int getGroundDamage() {
    return grounddamage;
  }

  public int getAirDamage() {
    return airdamage;
  }

  public int getHeal() {
    return heal;
  }

  public Deck getDeck() {
    return deck;
  }

  public int setDamage(int dmg) {
    int temp = damage;
    damage = dmg;
    return temp;
  }
  
  public int setHeal(int hp) {
    int temp = heal;
    heal = hp;
    return temp;
  }
  //returns cost
  public int use(Object target) {
    if (target instanceof Player) {
      ((Player)target).setHealth(((Player)target).getHealth() - damage);
      ((Player)target).setHealth(((Player)target).getHealth() + heal);
      return cost;
    }
    else if (target instanceof Unit) {
      ((Unit)target).setHealth(((Unit)target).getHealth() - damage);
      ((Unit)target).setHealth(((Unit)target).getHealth() + heal);
      return cost;
    }    
    else {
      return 0;
    }
  }

  void draw() {
    
  }
    
}
