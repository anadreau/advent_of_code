import 'package:advent_of_code/2023/day2/game_model.dart';

RegExp gameCapture = RegExp(r'Game\s+(\d+)');
RegExp blueCapture = RegExp(r'\d+(\sblue)');
RegExp redCapture = RegExp(r'\d+(\sred)');
RegExp greenCapture = RegExp(r'\d+(\sgreen)');

//Parse input
ElfGame parseLines(List raw) {
  ElfGame elfGame;
  for (String line in raw) {
    gameCapture.firstMatch(line);
  }
}
//split line

//capture game number

//capture blue count and find total

//capture red count and find total

//capture green count and find total

//compare total to game threshhold

//if all colors are under threshhold than add game number to sum

//return sum of all passing gameID as answer
