//Jiaxuan Li
//20722311

void playGame() {
  background(#3376DE, 0.4); // background color 
  // for loop for generate random order
  for (int i = 0; i < 3; i++) {
    r = random(1.0); // random generation
    if (r < WisPercent) {
      delegates  = 0;  // wisdom 
    } else if (r < (WisPercent + otherPercent)) {
      delegates  = 1;  // King
    } else if (r < (WisPercent + otherPercent*2)) {
      delegates  = 2;  // devil 
    } else {
      delegates  = 3;  // doge
    }
    resultLine[i] =  results[ delegates ];
  }
  
  Wins = 0; // initialization 
  // chances for wisdom 
  if (resultLine[0] == wis && resultLine[1] == wis && resultLine[2] == wis) {
    Wins = totalWin[0];
  }
  // chances for king
  if (resultLine[0] == king &&  resultLine[1] == king && resultLine[2] == king) {
    Wins = totalWin[1];
  }
  // chances for devil 
  if (resultLine[0] == dev && resultLine[1] == dev && resultLine[2] == dev) {
    Wins = totalWin[2];
  }
  // chances for doge
  if (resultLine[0] == doge && resultLine[1] == doge && resultLine[2] == doge) {
    Wins = totalWin[3];
  }
  
  //loop for display first result section
  for (int i = 0; i < 3; i++) {
    pushMatrix();
    translate(240 * i, 70);
    copy(resultLine[i], 0, 0, 120, 120, 0, 0, 120, 120);
    popMatrix();
  }

  if (Wins == 20 || Wins == 60) {
    sounda.play();  // sound effect will play when wins are 60
  } else if (Wins == 100) {
    soundb.play();  // when 100
  }
  startGame = false;
}
