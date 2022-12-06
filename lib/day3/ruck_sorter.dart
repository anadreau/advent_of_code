import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;

import 'package:advent_2022/day3/badge.dart';
import 'package:advent_2022/day3/rucksack_model.dart';

int finalSum = 0;
int finalSumThrees = 0;
int ruckId = 1;
int badgeId = 1;
int lineId = 1;
List ruckList = <RuckSack>[];
List badgeList = <Badge>[];
String line1 = '';
String line2 = '';
String line3 = '';

//read the file

final file = io.File('lib/data/rucksack.txt');

//Read rps.txt file by line
void readRuckFile() async {
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());

  try {
    //parse the string in half
    await for (var line in lines) {
      log('LineID at start $lineId');
      int linelength = line.length;
      int lineMiddle = (linelength ~/ 2);
      var compartment1 = line.substring(0, (linelength ~/ 2));
      var compartment2 = line.substring(lineMiddle, linelength);
      //log('Compartment1 contains: $compartment1\nCompartment2 contains: $compartment2');
      String letter = _compareCompartments(compartment1, compartment2);

      if (lineId == 1) {
        line1 = line;
        log(line1);
        log('Line1 $lineId');
      }
      if (lineId == 2) {
        line2 = line;
        log('Line2 $lineId');
      }
      if (lineId == 3) {
        log('Line3 beginning $lineId');
        line3 = line;
        String lettersThree = await _compareThreeRucks(line1, line2, line3);
        log(lettersThree);
        int badgeScore = await _calculateLetterScore(lettersThree);
        log('$badgeScore');
        Badge badge = Badge(
          id: badgeId,
          letter: lettersThree,
          badgeScore: badgeScore,
        );
        badgeList.add(badge);
        lineId = 0;
        log('Line3 end $lineId');
      }

      RuckSack ruck = RuckSack(
          ruckId: ruckId,
          matchingLetter: letter,
          score: await _calculateLetterScore(letter));
      ruckList.add(ruck);
      ruckId++;
      lineId++;
      badgeId++;
      log('LineId after ++ $lineId');

      //log('$ruck');
    }
  } catch (e) {
    log('$e');
  }

  finalSum = _calculateTotalScore();
  finalSumThrees = _calculateTotalScoreThrees();
  log('BadgeList length ${badgeList.length}');
  log('Badgelist contains:\n $badgeList');
  log('Badges: $finalSumThrees');
}

//compare both strings for matching characters
String _compareCompartments(String compartment1, String compartment2) {
  String matchingLetter = '';

  int i;
  int y;
  var list1 = compartment1.split('');
  var list2 = compartment2.split('');
  var list1Length = list1.length;
  var list2Length = list2.length;
  //log('${list1.length}');
  //log('${list2.length}');

  for (i = 0; i < list1Length; i++) {
    //log('i is $i');
    for (y = 0; y < list2Length; y++) {
      //log('y is $y');
      //log('list1 at i is ${list1[i]} and list 2 at y is ${list2[y]}');
      if (list1[i] == list2[y]) {
        matchingLetter = list1[i];
      }
    }
  }
  //log(matchingLetter);
  return matchingLetter;
}

//compare Three elves rucks for matching characters
Future<String> _compareThreeRucks(
    String line1, String line2, String line3) async {
  log('Made it to compareThreeRucks');
  log('$line1 \n$line2\n$line3');
  String matchingLetter = '';

  int x;
  int y;
  int z;
  int one = line1.length;
  int two = line2.length;
  int three = line3.length;

  for (x = 0; x < one; x++) {
    //log('i is $i');
    for (y = 0; y < two; y++) {
      //log('y is $y');
      //log('list1 at i is ${list1[i]} and list 2 at y is ${list2[y]}');
      if (line1[x] == line2[y]) {
        for (z = 0; z < three; z++) {
          if (line1[x] == line2[y] &&
              line1[x] == line3[z] &&
              line2[y] == line3[z]) {
            matchingLetter = line1[x];
            log('x = ${line1[x]}, y = ${line2[y]}, z = ${line3[z]}');
          }
        }
      }
    }
  }
  log(matchingLetter);
  return matchingLetter;
}

//calculate points based on character priority
Future<int> _calculateLetterScore(String letter) async {
  int score = 0;
  Map<String, int> lowerCaseMap = {
    'a': 1,
    'b': 2,
    'c': 3,
    'd': 4,
    'e': 5,
    'f': 6,
    'g': 7,
    'h': 8,
    'i': 9,
    'j': 10,
    'k': 11,
    'l': 12,
    'm': 13,
    'n': 14,
    'o': 15,
    'p': 16,
    'q': 17,
    'r': 18,
    's': 19,
    't': 20,
    'u': 21,
    'v': 22,
    'w': 23,
    'x': 24,
    'y': 25,
    'z': 26
  };
  Map<String, int> upperCaseMap = {
    'A': 27,
    'B': 28,
    'C': 29,
    'D': 30,
    'E': 31,
    'F': 32,
    'G': 33,
    'H': 34,
    'I': 35,
    'J': 36,
    'K': 37,
    'L': 38,
    'M': 39,
    'N': 40,
    'O': 41,
    'P': 42,
    'Q': 43,
    'R': 44,
    'S': 45,
    'T': 46,
    'U': 47,
    'V': 48,
    'W': 49,
    'X': 50,
    'Y': 51,
    'Z': 52
  };

  //checks lowercase map for match and assigns score
  if (lowerCaseMap.containsKey(letter)) {
    score = lowerCaseMap[letter]!;
  }

  //checks uppercase map for match and assigns score
  if (upperCaseMap.containsKey(letter)) {
    score = upperCaseMap[letter]!;
  }

  //log('$score');
  return score;
}

//Calculate totoal score
int _calculateTotalScore() {
  int totalScore = 0;

  for (RuckSack ruck in ruckList) {
    totalScore += ruck.score;
  }
  //log('Total score: $totalScore');
  return totalScore;
}

//Calculate totoal score for badges
int _calculateTotalScoreThrees() {
  int totalScore = 0;

  for (Badge badge in badgeList) {
    totalScore += badge.badgeScore;
  }
  log('Total badge score: $totalScore');
  return totalScore;
}
