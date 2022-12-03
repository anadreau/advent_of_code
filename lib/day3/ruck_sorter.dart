import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;

import 'package:advent_2022/day3/rucksack_model.dart';

int finalSum = 0;
int ruckId = 1;
List ruckList = <RuckSack>[];

//read the file

final file = io.File('lib/data/rucksack.txt');

//Read rps.txt file by line
void readRuckFile() async {
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());

  try {
    //parse the string in half
    await for (var line in lines) {
      int linelength = line.length;
      int lineMiddle = (linelength ~/ 2);
      var compartment1 = line.substring(0, (linelength ~/ 2));
      var compartment2 = line.substring(lineMiddle, linelength);
      //log('Compartment1 contains: $compartment1\nCompartment2 contains: $compartment2');
      String letter = _compareCompartments(compartment1, compartment2);
      RuckSack ruck = RuckSack(
          ruckId: ruckId,
          matchingLetter: letter,
          score: _calculateLetterScore(letter));
      ruckList.add(ruck);
      ruckId++;
      //log('$ruck');
    }
  } catch (e) {
    log('$e');
  }

  _calculateTotalScore();
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
  log(matchingLetter);
  return matchingLetter;
}

//calculate points based on character priority
int _calculateLetterScore(String letter) {
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

  log('$score');
  return score;
}

//Calculate totoal score
int _calculateTotalScore() {
  int totalScore = 0;

  for (RuckSack ruck in ruckList) {
    totalScore += ruck.score;
  }
  log('Total score: $totalScore');
  return totalScore;
}
