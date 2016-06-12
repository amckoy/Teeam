public class TerranUnit extends Unit {

  //Constructors
  TerranUnit(int newCost, String newName, boolean newIsAerial, boolean newIsCloaked, boolean newIsDetector, int newMaxLife, int newLife, int newGroundAttack, int newAirAttack) {
    super(newCost, newName, newIsAerial, newIsCloaked, newIsDetector, newMaxLife, newLife, newGroundAttack, newAirAttack);
  }
}

//Unit(int newCost, String newName, boolean newIsAerial, boolean newIsCloaked, boolean newIsDetector, int newMaxLife, int newLife, int newGroundAttack, int newAirAttack)

public class Marine extends TerranUnit {
  Marine() {
    super(1, "Marine", false, false, false, 1, 1, 2, 2);
  }
}

public class Firebat extends TerranUnit {
  Firebat() {
    super(2, "Firebat", false, false, false, 2, 2, 3, 0);
  }
}

public class Medic extends TerranUnit {
  public Medic() {
    super(1, "Medic", false, false, false, 3, 3, 0, 0);
  }
  void heal(Unit target) {
    target.setLife( target.getMaxLife() );
  }
}