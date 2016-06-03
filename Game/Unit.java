/* the basic super-class for each type of unit */


/* REAL TALK SHOULD WE ABSTRACT THIS OR NAH */

public class Unit extends Card {
    
    // do we need boolean? or just function
    private boolean isDead;
    //all of them will have health
    private int health;
    
    Unit(int hp) {
        health = hp;
        isDead = false;
    }

    //this should belong in attack unit, since not all unit attack
    // (utility units for example)
    // protected int attackUnit( Unit enemy ){
    //     enemy.setHealth( enemy.getHealth() -= this.attack() );
    //     this.setHealth( this.Health -= enemy.getAttack() );
    //     this.isDead();
    //     return this.attack();
    // }
    
    protected int setHealth(int newHP) {
        health = newHP;
    }

    protected int getHealth() {
        return health;
    }
    
    protected boolean isDead() {
        if( health <= 0 ) {
            isDead = true;
        }
        else {
            isDead = false;
        }
        return isDead;
    }
    
}
