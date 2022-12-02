import 'dart:developer';
import 'dart:io' as io;
import 'dart:convert';

int runningScore = 0;
int rock = 1;
int paper = 2;
int scissors = 3;
int lost = 0;
int draw = 3;
int win = 6;
//match logic
final file = io.File('lib/data/rps.txt');

//Read rps.txt file by line
Future<int> matchCalculator() async {
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());

//parse line
  try {
    await for (var line in lines) {
      var round = line.split('');
      //log('$round');
      //log('opponent throws: ${round[0]} and you throw ${round[2]}');
      switch (round[0]) {
        //Case Opponent throws Rock
        case 'A':
          {
            if (round[2] == 'X') {
              runningScore += (draw + rock);
            }
            if (round[2] == 'Y') {
              runningScore += (win + paper);
            }
            if (round[2] == 'Z') {
              runningScore += (lost + scissors);
            }
          }
          break;
        //Case Opponent throws Paper
        case 'B':
          {
            if (round[2] == 'X') {
              runningScore += (lost + rock);
            }
            if (round[2] == 'Y') {
              runningScore += (draw + paper);
            }
            if (round[2] == 'Z') {
              runningScore += (win + scissors);
            }
          }
          break;
        //Case Opponent throws Scissors
        case 'C':
          {
            if (round[2] == 'X') {
              runningScore += (win + rock);
            }
            if (round[2] == 'Y') {
              runningScore += (lost + paper);
            }
            if (round[2] == 'Z') {
              runningScore += (draw + scissors);
            }
          }
          break;
      }
    }
  } catch (e) {
    log('$e');
  }

  return runningScore;
}

Future<int> matchCalculator2() async {
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());

//parse line
  try {
    await for (var line in lines) {
      var round = line.split('');
      //log('$round');
      //log('opponent throws: ${round[0]} and you throw ${round[2]}');
      switch (round[0]) {
        //Case Opponent throws Rock
        case 'A':
          {
            if (round[2] == 'X') {
              runningScore += (lost + scissors);
            }
            if (round[2] == 'Y') {
              runningScore += (draw + rock);
            }
            if (round[2] == 'Z') {
              runningScore += (win + paper);
            }
          }
          break;
        //Case Opponent throws Paper
        case 'B':
          {
            if (round[2] == 'X') {
              runningScore += (lost + rock);
            }
            if (round[2] == 'Y') {
              runningScore += (draw + paper);
            }
            if (round[2] == 'Z') {
              runningScore += (win + scissors);
            }
          }
          break;
        //Case Opponent throws Scissors
        case 'C':
          {
            if (round[2] == 'X') {
              runningScore += (lost + paper);
            }
            if (round[2] == 'Y') {
              runningScore += (draw + scissors);
            }
            if (round[2] == 'Z') {
              runningScore += (win + rock);
            }
          }
          break;
      }
    }
  } catch (e) {
    log('$e');
  }

  return runningScore;
}
