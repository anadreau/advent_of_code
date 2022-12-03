import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;

import 'package:advent_2022/day3/rucksack_model.dart';

int finalSum = 0;

//read the file

final file = io.File('lib/data/rucksack.txt');

//Read rps.txt file by line
void readRuckFile() async {
  int ruckId = 1;
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());

  try {
    //parse the string in half
    await for (var line in lines) {
      int linelength = line.length;
      int lineMiddle = (linelength ~/ 2);
      var compartment1 = line.substring(0, (linelength ~/ 2));
      var compartment2 = line.substring(lineMiddle, linelength);
      log('Compartment1 contains: $compartment1\nCompartment2 contains: $compartment2');
      String letter = _compareCompartments(compartment1, compartment2);
      RuckSack ruck = RuckSack(
          ruckId: ruckId,
          matchingLetter: letter,
          score: _calculateLetterScore(letter));
      log('$ruck');
    }
  } catch (e) {
    log('$e');
  }
}

//compare both strings for matching characters
String _compareCompartments(String compartment1, String compartment2) {
  String matchingLetter = '';

  int i;
  int y;
  var list1 = compartment1.split('');
  var list2 = compartment2.split('');

  for (i = 0; i < list1.length; i++) {
    for (y = 0; y < list2.length; y++) {}
    if (list1[i] == list2[y]) {
      matchingLetter = list1[i];
    }
  }

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
    'A': 1,
    'B': 2,
    'C': 3,
    'D': 4,
    'E': 5,
    'F': 6,
    'G': 7,
    'H': 8,
    'I': 9,
    'J': 10,
    'K': 11,
    'L': 12,
    'M': 13,
    'N': 14,
    'O': 15,
    'P': 16,
    'Q': 17,
    'R': 18,
    'S': 19,
    'T': 20,
    'U': 21,
    'V': 22,
    'W': 23,
    'X': 24,
    'Y': 25,
    'Z': 26
  };

  if (lowerCaseMap.containsKey(letter)) {
    score = lowerCaseMap.;
  }

  return score;
}
