/* The basic card class */

public class Card {

    int cost;
    String name;
    
    Card() {
        cost = 0;
        name = "";
    }
    
    // Mutators + Accessors
<<<<<<< HEAD

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

    protected void setAttack( int newAttack ){
	attack = newAttack;
    }

    protected void setHealth( int newHealth ){
	health = newHealth;
    }

    protected void setCost( int newCode ){
	code = newCode;
    }

    protected int getAttack(){
	return attack;
    }

    protected int getHealth(){
	return health;
    }

    protected int getCost(){
	return cost;
    }

    protected String getName(){
	return name;
    }

>>>>>>> 9da602fb83fcf142fdc104cad568a4fc3732a911
}
