abstract class Spell extends Card {

  private int damage;
  private int heal;
  //this is to make life easier for abilities and such
  private Deck deck;

  public Spell(int dmg, int hp, int newCost, Deck newDeck) {
    super(newCost);
    damage = dmg;
    heal = hp;
    deck = newDeck;
  }

  public int getDamage() {
    return damage;
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
