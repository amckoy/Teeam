public class Unit extends Card {

  //Attributes
  boolean isDead;
  boolean isAerial;
  boolean isCloaked;
  boolean isDetector;
  boolean attacked;
  int maxLife;
  int life;
  int groundAttack;
  int airAttack;

  //Constructors
  Unit() {
    this(0, "foo", false, false, false, 1, 1, 1, 1);
  }

  Unit(int newCost, String newName, boolean newIsAerial, boolean newIsCloaked, boolean newIsDetector, int newMaxLife, int newLife, int newGroundAttack, int newAirAttack) {
    super(newCost, newName);
    attacked = false;
    isDead = false;
    isAerial = newIsAerial;
    isCloaked = newIsCloaked;
    isDetector = newIsDetector;
    maxLife = newMaxLife;
    life = newLife;
    groundAttack = newGroundAttack;
    airAttack = newAirAttack;
  }

  //Accessors + Mutators
  void setAttacked(boolean newAttacked){
    attacked = newAttacked;
  }
  void attack(Player opponent){
    opponent.setLife( opponent.getLife() - groundAttack );
    System.out.println("attacked");
  }
  
  void attack(Unit target){
    target.setLife( target.getLife() - groundAttack ); 
    this.setLife( this.getLife() - target.getGroundAttack() );
    System.out.println("attacked");
  }
  
  int getMaxLife() {
    return maxLife;
  }
  
  void setMaxLife(int newMaxLife) {
    maxLife = newMaxLife;
  }

  int getLife() {
    return life;
  }

  void setLife(int newLife) {
    life = newLife;
  }

  int getGroundAttack() {
    return groundAttack;
  }

  void setGroundAttack(int newGroundAttack) {
    groundAttack = newGroundAttack;
  }

  int getAirAttack() {
    return airAttack;
  }

  void setAirAttack(int newAirAttack) {
    airAttack = newAirAttack;
  }

  boolean isDead() {
    if ( life <= 0 ) {
      isDead = true;
    }
    else{
      isDead = false;
    }
    return isDead;
  }

  boolean isAerial() {
    return isAerial;
  }

  void setIsAerial(boolean newIsAerial) {
    isAerial = newIsAerial;
  }

  boolean isCloaked() {
    return isCloaked;
  }

  void setIsCloaked(boolean newIsCloaked) {
    isCloaked = newIsCloaked;
  }

  boolean isDetector() {
    return isDetector;
  }

  void setIsDetector(boolean newIsDetector) {
    isDetector = newIsDetector;
  }
}