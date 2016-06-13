import java.util.Hashtable;
//for the hashcodes
import java.util.Objects;

public class CardTyper {

  //bad end user no race change for you
  private final int race; //0 terran, 1 zerg, 2 protoss
  private Card totype;
  private Hashtable<CardTuple, Object> typer;
  
  public CardTyper(Card newCard, int newRace) {
    race = newRace;
    totype = newCard;
    fillTable();
  }

  
  //fills the table based on race
  //onetime use only, static method had errors in constructor
  //this is where you connect hp/atk and names/abilities
  //CardTuple(ground, air, hp);
  private void fillTable() {
    typer = new Hashtable<CardTuple, Object>();
    //terran
    if (race == 0) {
      typer.put(new CardTuple(2, 2, 1), (Marine)(new Object()));
      typer.put(new CardTuple(3, 0, 2), (Firebat)(new Object()));
      typer.put(new CardTuple(3, 3, 3), (Ghost)(new Object()));
      typer.put(new CardTuple(0, 0, 3), (Medic)(new Object()));
      typer.put(new CardTuple(1, 0, 2), (Vulture)(new Object()));
      typer.put(new CardTuple(3, 0, 1), (SpiderMine)(new Object()));
      typer.put(new CardTuple(3, 0, 5), (SiegeTank)(new Object()));
      typer.put(new CardTuple(2, 4, 3), (Goliath)(new Object()));
      typer.put(new CardTuple(2, 4, 2), (Wraith)(new Object()));
      typer.put(new CardTuple(0, 0, 5), (Dropship)(new Object()));
      typer.put(new CardTuple(0, 0, 4), (ScienceVessel)(new Object()));
      typer.put(new CardTuple(6, 6, 6), (BattleCruiser)(new Object()));
      typer.put(new CardTuple(5, 5, 5), (Valkyrie)(new Object()));
      return;
    }
    //zerg
    if (race == 1) {
      typer.put(new CardTuple(1, 1), (Zergling)(new Object()));
      return;
    }
    //protoss
    if (race == 2) {
      typer.put(new CardTuple(2, 1), (Zealot)(new Object()));
      return;
    }
  }

  //actually implements the interface
  public Card typeCard() {
    if (totype instanceof Unit) {
      //this cardpair is the key associated with this card
      CardTuple thisPair = new CardTuple(((Unit)totype).getHealth(), ((Unit)totype).getGroundAttack(), ((Unit)totype).getAirAttack(), ((Unit)totype).getCost(), ((Unit)totype).getDeck());
      //this gets the object associated with that key
      Object findtype = typer.get(thisPair);
      return (Unit)(findtype);
    }
    else if (totype instanceof Spell) {
      CardTuple thisPair = new CardTuple(((Spell)totype).getGroundDamage(), ((Spell)totype).getAirDamage(), ((Spell)totype).getHeal(), ((Spell)totype).getCost(), ((Spell)totype).getDeck());
      Object findtype = typer.get(thisPair);
      return (Spell)(findtype);
    }
    else {
      return totype;
    }
  }
  
}

//used in the hashtable in order to find based on attack and damage
//can be used for both spell and unit, just to make managing keys slightly
//easier
class CardTuple {

  final int groundattack;
  final int airattack;
  final int health;

  CardTuple(int gratk, int airatk, int hp) {
    groundattack = gratk;
    airattack = airatk;
    health = hp;
  }

  int getGroundAttack() {
    return groundattack;
  }

  int getAirAttack() {
    return airattack;
  }

  int getHealth() {
    return health;
  }

  //overriding checking if they are equal
  @Override
  public boolean equals(Object obj) {
    //checks if obj is a cardpair and has same values
    return obj instanceof CardTuple && groundattack == ((CardTuple)obj).getGroundAttack() && airattack == ((CardTuple)obj).getAirAttack() && health == ((CardTuple)obj).getHealth();
  }

  @Override
  public int hashCode() {
    return Objects.hash(groundattack, airattack, health);
  }

}
