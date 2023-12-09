import 'package:advent_of_code/2023/day2/game_model.dart';

RegExp gameCapture = RegExp(r'Game\s+(\d+)');
RegExp blueCapture = RegExp(r'\d+(\sblue)');
RegExp redCapture = RegExp(r'\d+(\sred)');
RegExp greenCapture = RegExp(r'\d+(\sgreen)');
int blueCount = 0;
int redCount = 0;
int greenCount = 0;
List<ElfGame> elfGames = [];
int gameSum = 0;

//Parse input
List<ElfGame> parseLines(List raw) {
  //split line
  for (String line in raw) {
    //capture game number
    blueCount = 0;
    greenCount = 0;
    redCount = 0;
    int gameId = int.parse(gameCapture.firstMatch(line).toString());
    //capture blue count and find total
    var blueList = blueCapture.allMatches(line);
    for (var blue in blueList) {
      blueCount = blueCount + int.parse(blue[0].toString());
    }
    //capture red count and find total
    var redList = redCapture.allMatches(line);
    for (var red in redList) {
      redCount = redCount + int.parse(red[0].toString());
    }
    //capture green count and find total
    var greenList = greenCapture.allMatches(line);
    for (var green in greenList) {
      greenCount = greenCount + int.parse(green[0].toString());
    }
    ElfGame elfGame = ElfGame(
      gameID: gameId,
      redCount: redCount,
      greenCount: greenCount,
      blueCount: blueCount,
    );
    elfGames.add(elfGame);
  }
  return elfGames;
}

//compare total to game threshhold
int getGameSum(
  List<ElfGame> games,
  int redMax,
  int blueMax,
  int greenMax,
) {
  for (var game in games) {
    //if all colors are under threshhold than add game number to sum
    if (game.blueCount <= blueMax &&
        game.greenCount <= greenMax &&
        game.redCount <= redMax) {
      gameSum = gameSum + game.gameID;
    }
  }
  //return sum of all passing gameID as answer
  return gameSum;
}
