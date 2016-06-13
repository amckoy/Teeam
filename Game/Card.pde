/* The basic card class */

abstract class Card {

  protected int cost;
  protected String name;
  
  public Card() {
    cost = 0;
    name = "";
  }

  public Card(int newCost) {
    cost = newCost;
    name = "";
  }

  public Card(int newCost, String newName) {
    cost = newCost;
    name = newName;
  }
    
  // Mutators + Accessors
  protected int getCost() {
    return cost;
  }

  protected String getName() {
    return name;
  }

  protected void setCost( int newCost ) {
    cost = newCost;
  }

}