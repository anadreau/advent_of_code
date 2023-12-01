import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;

List rawList = [];
List calibratedList = [];
int calibationSum = 0;
List iList = [];
int workingInt = 0;
RegExp findInt = RegExp(r'([0-9]{1})');
final file = io.File('lib/2023/day1/calibration_doc.txt');

//bring in data from file
Future<int> calibrationResolver() async {
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  collateLines(lines);
  callibrateList(rawList);

  log('$calibratedList');
  return returnSum(calibratedList);
}

//return that sum from list of two digit numbers
int returnSum(List calibratedList) {
  for (int num in calibratedList) {
    calibationSum = calibationSum + num;
  }
  log('CalibrationSum: $calibationSum');

  return calibationSum;
}

//add lines to list
Future<List> collateLines(Stream<String> lines) async {
  try {
    //log('try');
    await for (var line in lines) {
      //log('Line: $line');
      if (line.isNotEmpty) {
        rawList.add(line);
      }

      //get sum of all two digit numbers
    }
  } catch (e) {
    log('Error: $e');
  }
  return rawList;
}

List callibrateList(List rawList) {
  //parse each line and pull the first digit and the last digit
  for (String item in rawList) {
    //log('item: $item');
    Iterable<Match> foundInt = findInt.allMatches(item);
    for (Match i in foundInt) {
      iList.add(i[0]);
    }
    int listLength = iList.length;
    //log('length: $listLength');
    String firstNum = iList[0];
    //log('1st: $firstNum');
    String lastNum = iList[listLength - 1];
    //log('last: $lastNum');

    //combine the two digits into a two digit number
    workingInt = int.parse(firstNum + lastNum);
    log('workingInt: ${workingInt.toString()}');
    //add two digit numbers to a list
    calibratedList.add(workingInt);
    iList.clear();
    workingInt = 0;
  }
  return calibratedList;
}
