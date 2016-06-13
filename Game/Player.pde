public class Player {

  //Attributes
  boolean isDead;
  int race; // 0 = terran, 1 = zerg, 2 = protoss. 
  int life;
  int maxWorkers;
  int workers;
  Unit[] board;
  int boardSize;
  Unit[] hand;
  int handSize;
  Spell activeSpell;
  Deck myDeck;

  //Constructors
  Player(int newRace, Deck newDeck) {
    isDead = false;
    race = newRace;
    life = 30;
    maxWorkers = 1;
    workers = 1;
    board = new Unit[5];
    boardSize = 0;
    hand = new Unit[5];
    handSize = 0;
    activeSpell = null;
    myDeck = newDeck;
  }

  // Accessors + Mutators
  int getRace() {
    return race;
  }

  void setRace(int newRace) {
    if(newRace == 0 || newRace == 1 || newRace == 2){
      race = newRace;
    }
    else{
      System.out.println("Error: invalid race assignment; expected int [0, 2], recieved: " + newRace);
    }
  }

  int getLife() {
    return life;
  }

  void setLife(int newLife) {
    life = newLife;
  }

  int getMaxWorkers() {
    return maxWorkers;
  }
  
  void setMaxWorkers(int newMaxWorkers) {
    if(newMaxWorkers >= 1 && newMaxWorkers <= 8){
      maxWorkers = newMaxWorkers;
    }
    else{
      System.out.println("Error: invalid worker count; expected int [1, 8], recieved: " + newMaxWorkers);
    }
  }
  
  int getWorkers() {
    return workers;
  }
  
  void setWorkers(int newWorkers) {
    if(newWorkers >= 0 && newWorkers <= 8){
      workers = newWorkers;
    }
    else{
      System.out.println("Error: invalid worker count; expected int [0, 8], recieved: " + newWorkers);
    }
  }
  
  void autoWorkers(){
    setWorkers( (workers + 1) );
  }

  boolean isDead() {
    if (life <= 0) {
      isDead = true;
    } else {
      isDead = false;
    }
    return isDead;
  }
  
  float lifePercent() {
    float lifePercent = life / 30.0;
    return lifePercent;
  }
  
  Unit[] getBoard() {
    return board;
  }

  Card[] getHand() {
    return hand;
  }
  
  void shiftEmpties() {
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
  
  boolean isHandEmpty() {
    for (int i = 0 ; i < hand.length ; i++) {
      if (hand[i] != null) {
        return false;
      }
    }
    return true;
  }

  boolean isBoardEmpty() {
    for (int i = 0 ; i < board.length ; i++) {
      if (board[i] != null) {
        return false;
      }
    }
    return true;
  }
  
  void playUnit(int index) {
    if (boardSize < 5 && hand[index] instanceof Unit && workers >= hand[index].getCost() ) {
      Unit playedUnit = (Unit)hand[index];
      int cost = playedUnit.getCost();
      hand[index] = null;
      handSize--;
      for (int i = 0 ; i < board.length ; i++) {
        if (board[i] == null) {
          board[i] = playedUnit;
          shiftEmpties();
          boardSize++;
          System.out.println("You played a(n): " + playedUnit.getName() );
          break;
        }
      }
    }
    else if(boardSize > 5){
      System.out.println("Board is full.");
    }
    else if( !( hand[index] instanceof Unit ) ){
      System.out.println("That is not an unit.");
    }
    else if( workers < hand[index].getCost() ){
      System.out.println("You have not enough workers.");
    }
  }
  
  void drawCards(int numCards){
    if( myDeck.deck.size() <= 0 ){
      life = 0;
      return;
    }
    else if( myDeck.deck.size() < numCards ){
      numCards = myDeck.deck.size();
    }
    for(int i = 0; i < numCards; i++){
      Unit drawnUnit = myDeck.deck.removeFirst();
      if( handSize < 5 ){
        hand[handSize] = drawnUnit;
        System.out.println("You draw a card.");
      }
      else{
        System.out.println("hand too big, drawn card discarded");
      }
      handSize++;
    }
    shiftEmpties();
  }

}