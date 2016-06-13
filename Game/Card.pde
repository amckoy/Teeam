<<<<<<< HEAD
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

=======
public class Card {

  // Attributes
  int cost;
  String name;

  //Constructors
  Card() {
    this(0, "foo");
  }
  
  Card(int newCost, String newName) {
    cost = newCost;
    name = newName;
  }

  // Accessors + Mutators
  int getCost() {
    return cost;
  }
  
  void setCost(int newCost) {
    cost = newCost;
  }

  String getName() {
    return name;
  }
  
  void setName(String newName){
    name = newName;
  }
>>>>>>> c72c97cc65088a045fa009a9cf73bf0348d7c810
}