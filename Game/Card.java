/* The basic card class */

public class Card {

    int cost;
    String name;
    
    Card() {
        cost = 0;
        name = "";
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
