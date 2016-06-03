/* Each player, whether an opponent or us */

public class Player {
    
    int race; // 0 = terran, 1 = zerg, 2 = protoss. 
    int health;
    int minerals;
    int supply;
    //Tree techTree;
    Deck[] deck;

    // Mutators and Accessors
    public void setHealth( int newHealth ){
	health = newHealth;
    }
    
    public void setMinerals( int newMinerals ){
	minerals = newMinerals;
    }
    
    public void setGas( int newGas ){
	gas = newGas;
    }

    public void setSupply( int newSupply ){
	supply = newSupply;
    }

    public int getHealth(){
	return health;
    }

    public int getMinerals(){
	return minerals;
    }

    public int getGas(){
	return gas;
    }

    public int getSupply(){
	return supply;
    }

}
