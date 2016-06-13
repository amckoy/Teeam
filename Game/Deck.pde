import java.util.LinkedList;

public class Deck {

  private LinkedList deck;
  private Unit[] board;
  private Card[] hand;
  //how many values are in each
  private int boardCount;
  private int handCount;
    
  public Deck() {
    deck = new LinkedList<Card>();
    board = new Unit[5];
    hand = new Card[8];
    boardCount = 0;
    handCount = 0;
  }

  public Unit[] getBoard() {
    return board;
  }

  public Card[] getHand() {
    return hand;
  }

  //makes sure there are no empty spaces between values in hand and board
  public void shiftEmpties() {
    int emptyindex = -1;
    for (int i = 0 ; i < hand.length ; i++) {
      if (hand[i] == null) {
        emptyindex = i;
      }
      else if (hand[i] != null && emptyindex != -1) {
        hand[emptyindex] = hand[i];
        hand[i] = null;
        emptyindex++;
      }
    }
    emptyindex = -1;
    for (int j = 0 ; j < board.length ; j++) {
      if (board[j] == null) {
        emptyindex = j;
      }
      else if (board[j] != null && emptyindex != -1) {
        board[emptyindex] = board[j];
        board[j] = null;
        emptyindex++;
      }
    }
  }

  public boolean isHandEmpty() {
    for (int i = 0 ; i < hand.length ; i++) {
      if (hand[i] != null) {
        return false;
      }
    }
    return true;
  }

  public boolean isBoardEmpty() {
    for (int i = 0 ; i < board.length ; i++) {
      if (board[i] != null) {
        return false;
      }
    }
    return true;
  }

  //draw a card from the deck
  public void drawCard() {
    if (handCount < 8 && !deck.isEmpty()) {
      for (int i = 0 ; i < hand.length ; i++) {
        //add card to hand, remove it from deck
        if (hand[i] == null) {
          hand[i] = (Card)deck.get(0);
          deck.remove(0);
          handCount++;
          break;
        }
      }
    }
    else {
      return;
    }
    shiftEmpties();
  }

  //returns cost for player
  public int playUnit(int index) {
    if (boardCount < 5 && hand[index] instanceof Unit) {
      int cost = hand[index].getCost();
      for (int i = 0 ; i < board.length ; i++) {
        if (board[i] == null) {
          board[i] = (Unit)hand[index];
          hand[index] = null;
          shiftEmpties();
          handCount--;
          boardCount++;
          break;
        }
      }
      return cost;
    }
    else {
      return 0;
    }
  }

  // also returns cost, but doesnt play anything to board
  public int playSpell(int index) {
    if (hand[index] instanceof Spell) {
      int cost = hand[index].getCost();
      //hand[index].draw();
      hand[index] = null;
      handCount--;
      return cost;
    }
    return 0;
  }

  public Unit combine(int index, int index2) {
    if (board[index].getClass().equals(board[index2].getClass())) {
      //average of health plus random amount added from average of cost
      int hpavg = (board[index].getLife() + board[index2].getLife()) - (int)(Math.random() * ((board[index].getCost() + board[index2].getCost()) / 2.0));
      //average of attacks plus random amount added from average of cost
      int atkavg = (board[index].getGroundAttack() + board[index2].getGroundAttack()) - (int)(Math.random() * ((board[index].getCost() + board[index2].getCost()) / 2.0));
      //random semi-balanced cost;
      int costavg = (int)(Math.random() * hpavg) + (int)(Math.random() * atkavg);
      return new Unit(hpavg, atkavg, costavg, this);
    }
    else {
      return (Unit)null;
    }
  }
  
  void marines() {
    for(int i = 0; i < 40; i++){
      Marine marine = new Marine(); 
      deck.addFirst( marine );
    }
  }

  //will draw the board and hand of the player
  void draw() {
    //drawing hand
    for (int i = 0 ; i < hand.length / 2 ; i++) {
      //test
      rect(1, 1, 1, 1);
    }
  }
  
}