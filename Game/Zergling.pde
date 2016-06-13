public class Zergling extends Unit{

  public Zergling(Deck newDeck) {
    super(1, 1, 1, newDeck);
    name = "Zergling";
  }

  public void ability() {  
    int ctr = 0;
    Unit[] board = this.getDeck().getBoard();
    for (int i = 0; i < board.length; i++) {
      if (board[i] instanceof Zergling) {
        ctr++;
      }
    }
    for (int j = 0; j < board.length; j++) {
      if (board[j] instanceof Zergling) {
        board[j].setAttack(board[j].getAttack() + ctr);
      }
    }
  }

  public PImage getImage() {
    return loadImage("zergling.jpg");
  }

  public String getDescription() {
    return "Gain 1 attack for every Zergling on your board.";
  }
  
}
