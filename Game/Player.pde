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