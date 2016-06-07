/* Each player, whether an opponent or us */

public class Player {
    
    private int race; // 0 = terran, 1 = zerg, 2 = protoss. 
    private int health;
    private int resources;
    //Tree techTree; for later implementation if we have time
    private boolean isDead;
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
