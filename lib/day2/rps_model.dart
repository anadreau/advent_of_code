//hand model
/*
1 for Rock, 2 for Paper, and 3 for Scissors) plus the score for the outcome 
of the round (0 if you lost, 3 if the round was a draw, and 6 if you won).
*/
class Rock {
  String opponent = 'A';
  int value = 1;
  String me = 'X';
}

class Scissors {
  String opponent = 'C';
  int value = 3;
  String me = 'Z';
}

class Paper {
  String opponent = 'B';
  int value = 2;
  String me = 'Y';
}
