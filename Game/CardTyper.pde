import java.util.Hashtable;
//for the hashcodes
import java.util.Objects;

public class CardTyper {

  //bad end user no race change for you
  private final int race; //0 terran, 1 zerg, 2 protoss
  private Card totype;
  private Hashtable<CardPair, Object> typer;
  
  public CardTyper(Card newCard, int newRace) {
    race = newRace;
    totype = newCard;
    fillTable();
  }

  
  //fills the table based on race
  //onetime use only, static method had errors in constructor
  //this is where you connect hp/atk and names/abilities
  //look at terran first example
  //puts in 1atk, 1hp cardpair, and the object associated with that, the marine
  private void fillTable() {
    typer = new Hashtable<CardPair, Object>();
    //terran
    if (race == 0) {
      typer.put(new CardPair(1, 2), (Marine)(new Object()));
      return;
    }
    //zerg
    if (race == 1) {
      typer.put(new CardPair(1, 1), (Zergling)(new Object()));
      return;
    }
    //protoss
    if (race == 2) {
      typer.put(new CardPair(2, 1), (Zealot)(new Object()));
      return;
    }
  }

  //actually implements the interface
  public Card typeCard() {
    if (totype instanceof Unit) {
      //this cardpair is the key associated with this card
      CardPair thisPair = new CardPair(((Unit)totype).getAttack(), ((Unit)totype).getHealth());
      //this gets the object associated with that key
      Object findtype = typer.get(thisPair);
      return (Unit)(findtype);
    }
    else if (totype instanceof Spell) {
      CardPair thisPair = new CardPair(((Spell)totype).getDamage(), ((Spell)totype).getHeal());
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
class CardPair {

  final int attack;
  final int health;

  CardPair(int atk, int hp) {
    attack = atk;
    health = hp;
  }

  int getAttack() {
    return attack;
  }

  int getHealth() {
    return health;
  }

  //overriding checking if they are equal
  @Override
  public boolean equals(Object obj) {
    //checks if obj is a cardpair and has same values
    return obj instanceof CardPair && attack == ((CardPair)obj).getAttack() && health == ((CardPair)obj).getHealth();
  }

  @Override
  public int hashCode() {
    return Objects.hash(attack, health);
  }

}
