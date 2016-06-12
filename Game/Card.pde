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
}