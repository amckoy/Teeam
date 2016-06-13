import java.util.ArrayDeque;

// Attributes
Player hasTurn;
Player waiting;
Player winner;
Player loser;
ArrayDeque<String> turnOrder;
Player p1;
Player p2;
Deck p1Deck;
Deck p2Deck;
int mouseXStart;
int mouseXEnd;
int mouseYStart;
int mouseYEnd;

void setup() {
  size(1000, 720);
  background(0);
  turnOrder = new ArrayDeque<String>();
  turnOrder.add("draw");
  turnOrder.add("play");
  p1Deck = new Deck();
  p1Deck.marines();
  p2Deck = new Deck();
  p2Deck.marines();
  p1 = new Player(0, p1Deck);
  p2 = new Player(1, p2Deck);
  p1.drawCards(5);
  p2.drawCards(5);
  hasTurn = p1;
  waiting = p2;
}

void draw() {
  //perform game logic FIRST
  //update graphics corresponding to that game logic SECOND
  //System.out.println(mouseX + ", " + mouseY);
  if ( turnOrder.peek().equals( "draw" ) ) {
    hasTurn.setMaxWorkers( hasTurn.getMaxWorkers() + 1 );
    hasTurn.setWorkers( hasTurn.getMaxWorkers() );
    hasTurn.drawCards( 1 );
    if ( hasTurn.isDead() ) {
      loser = hasTurn;
      winner = waiting;
      if (winner == p1) {
        fill(255, 255, 0);
        textSize(64);
        text("YOU WIN", width / 2, height / 2);
        return;
      } else {
        fill(255, 255, 0);
        textSize(64);
        text("YOU LOSE", width / 2, height / 2);
        return;
      }
    }
    turnOrder.remove();
  } else if ( turnOrder.peek().equals( "play" ) ) {
    for (int i = 0; i < hasTurn.board.length; i++) {
      if ( hasTurn.board[i] != null && hasTurn.board[i].isDead() ) {
        hasTurn.board[i] = null;
      }
    }
    if ( hasTurn.isDead() ) {
      loser = hasTurn;
      winner = waiting;
      if (winner == p1) {
        fill(255, 255, 0);
        textSize(64);
        text("YOU WIN", width / 2, height / 2);
        return;
      } else {
        fill(255, 255, 0);
        textSize(64);
        text("YOU LOSE", width / 2, height / 2);
        return;
      }
    }
  }

  // //health
  fill(0);
  arc(width / 2, 150, 50, 50, 0, PI * 2);
  arc(width / 2, height - 150, 50, 50, 0, PI * 2);
  fill(24, 134, 45);
  arc(width / 2, 150, 50, 50, 0, PI * 2 * p2.lifePercent() );
  arc(width / 2, height - 150, 50, 50, 0, PI * 2 * p1.lifePercent() );

  for (int i = 0; i < p2.hand.length; i++) {
    if ( p2.hand[i] == null ) {
      fill(255);
      rect(width * (i + 1) / 6 - 50, 0, 100, 100);
      if ( hasTurn == p2 ) {
        fill(0);
        rect(width * (i + 1) / 6 - 50, 100, 100, 16);
      }
    } else {
      fill(0, 0, 141);
      rect( width * (i + 1) / 6 - 50, 0, 100, 100);
      if ( hasTurn == p2 ) {
        fill(255);
        textSize(16);
        text(p2.hand[i].getName(), width * (i + 1) / 6 - 50, 115);
        text("Cost: " + p2.hand[i].getCost(), width * (i + 1) / 6 - 50, 100);
        text("G_Attack: " + p2.hand[i].getGroundAttack(), width * (i + 1) / 6 - 50, 85);
        //text("Air Attack: " + p2.hand[i].getAirAttack(), width * (i + 1) / 6 - 50, 70);
      }
    }
  }

  for (int i = 0; i < p1.hand.length; i++) {
    if ( p1.hand[i] == null ) {
      fill(255);
      rect(width * (i + 1) / 6 - 50, height - 100, 100, 100);
      if ( hasTurn == p1 ) {
        fill(0);
        rect(width * (i + 1) / 6 - 50, height - 116, 100, 16);
      }
    } else {
      fill(141, 0, 0);
      rect( width * (i + 1) / 6 - 50, height - 100, 100, 100);
      if ( hasTurn == p1 ) {
        fill(255);
        textSize(16);
        text(p1.hand[i].getName(), width * (i + 1) / 6 - 50, height - 100);
        text("Cost: " + p1.hand[i].getCost(), width * (i + 1) / 6 - 50, height - 85);
        text("G_Attack: " + p1.hand[i].getGroundAttack(), width * (i + 1) / 6 - 50, height - 70);
        //text("Air Attack: " + p1.hand[i].getAirAttack(), width * (i + 1) / 6 - 50, height - 55);
      }
    }
  }

  for (int i = 0; i < p2.board.length; i++) {
    if ( p2.board[i] == null ) {
      fill(255);
      rect(width * (i + 1) / 6 - 50, 200, 100, 100);
      if ( hasTurn == p2 ) {
        fill(0);
        rect( width * (i + 1) / 6 - 50, 300, 100, 16);
      }
    } else {
      fill(0, 0, 141);
      rect( width * (i + 1) / 6 - 50, 200, 100, 100);
      if ( hasTurn == p2 ) {
        fill(255);
        textSize(16);
        text(p2.board[i].getName(), width * (i + 1) / 6 - 50, 315);
        text("Cost: " + p2.board[i].getCost(), width * (i + 1) / 6 - 50, 300);
        text("G_Attack: " + p2.board[i].getGroundAttack(), width * (i + 1) / 6 - 50, 285);
        //text("Air Attack: " + p2.board[i].getAirAttack(), width * (i + 1) / 6 - 50, 270);
      }
    }
  }

  for (int i = 0; i < p1.board.length; i++) {
    if ( p1.board[i] == null ) {
      fill(255);
      rect(width * (i + 1) / 6 - 50, height - 300, 100, 100);
      if ( hasTurn == p1 ) {
        fill(255);
        rect(width * (i + 1) / 6 - 50, height - 300, 100, 16);
      }
    } else {
      fill(141, 0, 0);
      rect( width * (i + 1) / 6 - 50, height - 300, 100, 100);
      if ( hasTurn == p1 ) {
        fill(255);
        textSize(16);
        text(p1.board[i].getName(), width * (i + 1) / 6 - 50, height - 300);
        text("Cost: " + p1.board[i].getCost(), width * (i + 1) / 6 - 50, height - 285);
        text("G_Attack: " + p1.board[i].getGroundAttack(), width * (i + 1) / 6 - 50, height - 270);
        //text("Air Attack: " + p1.board[i].getAirAttack(), width * (i + 1) / 6 - 50, height - 255);
      }
    }
  }

  fill(200, 200, 0);
  rect(width - 100, height / 2 - 25, 100, 50);
  fill(0);
  textSize(16);
  text("End Turn", width - 92, height / 2 + 8);

  fill(128, 128, 128);
  rect(10, 10, 80, 110);
  rect(width - 90, height -120, 80, 110);
  fill(0);
  textSize(16);
  text(p2.myDeck.deck.size(), 45, 60);
  text(p1.myDeck.deck.size(), width - 45, height - 60);
}

void mouseClicked() {
  if (mouseX >= 900 && mouseX <= 999 && mouseY >= 335 && mouseY <= 385) {
    Player temp = hasTurn;
    hasTurn = waiting;
    waiting = temp;
    turnOrder.remove();
    turnOrder.add("draw");
    turnOrder.add("play");
  }
}

void mousePressed() {
  mouseXStart = mouseX;
  mouseYStart = mouseY;
}

void mouseDragged() {
  mouseXEnd = mouseX;
  mouseYEnd = mouseY;
}

void mouseReleased() {
  Unit selected;
  selected = null;
  if ( hasTurn == p1 ) {
    if ( mouseYStart >= 420 ) {
      if ( mouseYStart <= 520 ) {
        if ( mouseXStart >=116 && mouseXStart <= 216 ) {
          selected = p1.board[0];
        } else if (mouseXStart >=283 && mouseXStart <= 383) {
          selected = p1.board[1];
        } else if (mouseXStart >=450 && mouseXStart <= 550) {
          selected = p1.board[2];
        } else if (mouseXStart >=616 && mouseXStart <= 716) {
          selected = p1.board[0];
        } else if (mouseXStart >=783 && mouseXStart <= 883) {
          selected = p1.board[0];
        }
        if ( mouseYEnd <= 300 && selected != null ) {
          if (mouseYEnd >= 200) {
            if ( mouseXEnd >=116 && mouseXEnd <= 216 ) {
              if (p2.board[4] != null) {
                selected.attack(p2.board[4]);
              }
            } else if (mouseXEnd >=283 && mouseXEnd <= 383) {
              if (p2.board[3] != null) {
                selected.attack(p2.board[3]);
              }
            } else if (mouseXEnd >=450 && mouseXEnd <= 550) {
              if (p2.board[2] != null) {
                selected.attack(p2.board[2]);
              }
            } else if (mouseXEnd >=616 && mouseXEnd <= 716) {
              if (p2.board[1] != null) {
                selected.attack(p2.board[1]);
              }
            } else if (mouseXEnd >=783 && mouseXEnd <= 883) {
              if (p2.board[0] != null) {
                selected.attack(p2.board[0]);
              }
            }
          } else if ( mouseYEnd >= 125 && mouseYEnd <= 175 && mouseXEnd >= 475 && mouseXEnd <= 525 && selected != null ) {
            selected.attack(p2);
          }
        }
      } else if ( mouseYStart >= 620 ) {
        if ( mouseXStart >=116 && mouseXStart <= 216 ) {
          selected = p1.hand[0];
        } else if (mouseXStart >=283 && mouseXStart <= 383) {
          selected = p1.hand[1];
        } else if (mouseXStart >=450 && mouseXStart <= 550) {
          selected = p1.hand[2];
        } else if (mouseXStart >=616 && mouseXStart <= 716) {
          selected = p1.hand[0];
        } else if (mouseXStart >=783 && mouseXStart <= 883) {
          selected = p1.hand[0];
        }
        if (mouseYEnd >= 420 && mouseYEnd <= 520 && selected != null) {
          if ( mouseXEnd >=116 && mouseXEnd <= 216 ) {
            p1.playUnit(0);
            p1.boardSize++;
            p1.handSize--;
          } else if (mouseXEnd >=283 && mouseXEnd <= 383) {
            p1.playUnit(1);
            p1.boardSize++;
            p1.handSize--;
          } else if (mouseXEnd >=450 && mouseXEnd <= 550) {
            p1.playUnit(2);
            p1.boardSize++;
            p1.handSize--;
          } else if (mouseXEnd >=616 && mouseXEnd <= 716) {
            p1.playUnit(3);
            p1.boardSize++;
            p1.handSize--;
          } else if (mouseXEnd >=783 && mouseXEnd <= 883) {
            p1.playUnit(4);
            p1.boardSize++;
            p1.handSize--;
          }
        }
      }
    }
  } else {
    if ( mouseYStart <= 300 ) {
      if ( mouseYStart >= 200 ) {
        if ( mouseXStart >=116 && mouseXStart <= 216 ) {
          selected = p2.board[4];
        } else if (mouseXStart >=283 && mouseXStart <= 383) {
          selected = p2.board[3];
        } else if (mouseXStart >=450 && mouseXStart <= 550) {
          selected = p2.board[2];
        } else if (mouseXStart >=616 && mouseXStart <= 716) {
          selected = p2.board[1];
        } else if (mouseXStart >=783 && mouseXStart <= 883) {
          selected = p2.board[0];
        }
        if ( mouseYEnd >= 420 && selected != null ) {
          if (mouseYEnd <= 520) {
            if ( mouseXEnd >=116 && mouseXEnd <= 216 ) {
              if (p1.board[0] != null) {
                selected.attack(p1.board[0]);
              }
            } else if (mouseXEnd >=283 && mouseXEnd <= 383) {
              if (p1.board[1] != null) {
                selected.attack(p1.board[1]);
              }
            } else if (mouseXEnd >=450 && mouseXEnd <= 550) {
              if (p1.board[2] != null) {
                selected.attack(p1.board[2]);
              }
            } else if (mouseXEnd >=616 && mouseXEnd <= 716) {
              if (p1.board[3] != null) {
                selected.attack(p1.board[3]);
              }
            } else if (mouseXEnd >=783 && mouseXEnd <= 883) {
              if (p1.board[4] != null) {
                selected.attack(p1.board[4]);
              }
            }
          } else if ( mouseYEnd >= 125 && mouseYEnd <= 175 && mouseXEnd >= 545 && mouseXEnd <= 595 && selected != null) {
            selected.attack(p1);
          }
        }
      } else if ( mouseYStart <= 100 ) {
        if ( mouseXStart >=116 && mouseXStart <= 216 ) {
          selected = p2.hand[4];
        } else if (mouseXStart >=283 && mouseXStart <= 383) {
          selected = p2.hand[3];
        } else if (mouseXStart >=450 && mouseXStart <= 550) {
          selected = p2.hand[2];
        } else if (mouseXStart >=616 && mouseXStart <= 716) {
          selected = p2.hand[1];
        } else if (mouseXStart >=783 && mouseXStart <= 883) {
          selected = p2.hand[0];
        }
        if (mouseYEnd >= 200 && mouseYEnd <= 300 && selected != null) {
          if ( mouseXEnd >=116 && mouseXEnd >= 216 ) {
            p2.playUnit(4);
            p2.boardSize++;
            p2.handSize--;
          } else if (mouseXEnd >=283 && mouseXEnd <= 383) {
            p2.playUnit(3);
            p2.boardSize++;
            p2.handSize--;
          } else if (mouseXEnd >=450 && mouseXEnd <= 550) {
            p2.playUnit(2);
            p2.boardSize++;
            p2.handSize--;
          } else if (mouseXEnd >=616 && mouseXEnd <= 716) {
            p2.playUnit(1);
            p2.boardSize++;
            p2.handSize--;
          } else if (mouseXEnd >=783 && mouseXEnd <= 883) {
            p2.playUnit(0);
            p2.boardSize++;
            p2.handSize--;
          }
        }
      }
    }
  }
  System.out.println(mouseXStart + ", " + mouseXEnd + ", " + mouseYStart + ", " + mouseYEnd);
}