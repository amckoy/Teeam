<<<<<<< HEAD
/* Each player, whether an opponent or us */

public class Player {
    
    private int race; // 0 = terran, 1 = zerg, 2 = protoss. 
    private int health;
    private int resources;
    //Tree techTree; for later implementation if we have time
    private boolean isDead;
    public Card activeSpell;
    public Deck deck;

    //constructor
    public Player(int cRace, Deck cDeck) {
        race = cRace;
        health = 30;
        resources = 1;
        isDead = false;
        deck = cDeck;
    }
    
    // Mutators and Accessors
    public int getRace() {
        return race;
    }

    public int getHealth() {
        return health;
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

}
=======
public class Player {

  //Attributes
  boolean isDead;
  int race; // 0 = terran, 1 = zerg, 2 = protoss. 
  int life;
  int workers;
  Unit[] units;
  Unit[] hand;
  Spell activeSpell;
  Deck deck;

  //Constructors
  Player(int newRace, Deck newDeck) {
    isDead = false;
    race = newRace;
    life = 30;
    workers = 1;
    units = new Unit[5];
    activeSpell = null;
    deck = newDeck;
  }

  // Accessors + Mutators
  int getRace() {
    return race;
  }

  void setRace(int newRace) {
    if(newRace == 0 || newRace == 1 || newRace == 2){
      race = newRace;
    }
    else{
      System.out.println("Error: invalid race assignment; expected int [0, 2], recieved: " + newRace);
    }
  }

  int getLife() {
    return life;
  }

  void setLife(int newLife) {
    life = newLife;
  }

  int getWorkers() {
    return workers;
  }
  
  void setWorkers(int newWorkers) {
    if(newWorkers >= 1 && newWorkers <= 8){
      workers = newWorkers;
    }
    else{
      System.out.println("Error: invalid worker count; expected int [1, 8], recieved: " + newWorkers);
    }
  }
  
  void autoWorkers(){
    setWorkers( (workers + 1) );
  }

  boolean isDead() {
    if (life <= 0) {
      isDead = true;
    } else {
      isDead = false;
    }
    return isDead;
  }
  
  float lifePercent() {
    float lifePercent = life / 30.0;
    return lifePercent * PI;
  }

}
>>>>>>> c72c97cc65088a045fa009a9cf73bf0348d7c810
