import java.util.LinkedList;

public class Deck {

  LinkedList<Unit> deck;
    
  Deck() {
    deck = new LinkedList<Unit>();
  }
  
  void marines() {
    for(int i = 0; i < 40; i++){
      Marine marine = new Marine(); 
      deck.addFirst( marine );
    }
  }
  
}