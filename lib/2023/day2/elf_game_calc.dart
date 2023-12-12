import 'dart:developer';

import 'package:advent_of_code/2023/day2/game_model.dart';

RegExp gameCapture = RegExp(r'Game\s+(?<number>\d+)');
RegExp blueCapture = RegExp(r'(?<blue>\d+)(\sblue)');
RegExp redCapture = RegExp(r'(?<red>\d+)(\sred)');
RegExp greenCapture = RegExp(r'(?<green>\d+)(\sgreen)');
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
    Match gameIdMatch = gameCapture.firstMatch(line)!;
    int gameId = int.parse(gameIdMatch[1].toString());

    //capture largest blue count in game
    var blueList = blueCapture.allMatches(line);
    for (var blue in blueList) {
      int tempBlue = int.parse(blue[1].toString());
      if (tempBlue > blueCount) {
        blueCount = tempBlue;
      }
    }
    //capture largest red count in game
    var redList = redCapture.allMatches(line);
    for (var red in redList) {
      int tempRed = int.parse(red[1].toString());
      if (tempRed > redCount) {
        redCount = tempRed;
      }
    }
    //capture largest green count in game
    var greenList = greenCapture.allMatches(line);
    for (var green in greenList) {
      int tempGreen = int.parse(green[1].toString());
      if (tempGreen > greenCount) {
        greenCount = tempGreen;
      }
    }
    ElfGame elfGame = ElfGame(
      gameID: gameId,
      redCount: redCount,
      greenCount: greenCount,
      blueCount: blueCount,
    );
    //log('Game ${elfGame.gameID} has ${elfGame.blueCount} blue, ${elfGame.redCount} red, ${elfGame.greenCount} green.');
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
      log('Sum $gameSum plus GameID ${game.gameID} ');
      gameSum = gameSum + game.gameID;
      log('Eqauls $gameSum');
    }
  }
  //return sum of all passing gameID as answer
  return gameSum;
}
