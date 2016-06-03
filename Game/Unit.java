/* the basic super-class for each type of unit */

public class Unit extends Card {
    
    
    protected int attackUnit( Unit enemy ){
	enemy.setHealth( enemy.getHealth() -= this.attack() );
	this.setHealth( this.Health -= enemy.getAttack() );
	return this.attack();
    }

    protected int attackPlayer(){
	/* */;
    }

    protected void checkHealth(){
	if( health <= 0 ){
	    /* */;
	}
    }
}
