import java.util.LinkedList;

public class Deck {

  //Attributes
  boolean outOfCards;
  LinkedList<Card> deck;
  
  //Constructor
  Deck() {
  }
  
  //Methods
  void marines() {
    for(int i = 0; i < 40; i++){
      Marine marine = new Marine(); 
      deck.addFirst( marine );
    }
  }
}