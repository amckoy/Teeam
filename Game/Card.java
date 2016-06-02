/* The basic card class */

public class Card {
    
    int attack;
    int health;
    int cost;
    String name;
    
    Card(){
	attack = 0;
	health = 1;
	cost = 0;
	name = "";
    }
    
    // Mutators + Accessors
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

    protected void setAttack( int newAttack ){
	attack = newAttack;
    }

    protected void setHealth( int newHealth ){
	health = newHealth;
    }

    protected void setCost( int newCode ){
	code = newCode;
    }

}
