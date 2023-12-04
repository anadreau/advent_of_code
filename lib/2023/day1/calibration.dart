import 'dart:developer';

List calibratedList = [];
int calibationSum = 0;
List iList = [];
int workingInt = 0;
RegExp findNumber =
    RegExp(r"one|two|three|four|five|six|seven|eight|nine|[0-9]{1}");

//return that sum from list of two digit numbers
int returnSum(List calibratedList) {
  for (int num in calibratedList) {
    log('math check $calibationSum + $num');
    calibationSum = calibationSum + num;
  }
  log('CalibrationSum: $calibationSum');

  return calibationSum;
}

List callibrateList(List rawList) {
  log('Line Count: ${rawList.length.toString()}');
  //parse each line and pull the first digit and the last digit
  for (String item in rawList) {
    log('item: $item');
    Iterable<Match> foundInt = findNumber.allMatches(item);
    for (Match i in foundInt) {
      log('${i[0]}');
      if (i[0] == 'one') {
        iList.add('1');
      }
      if (i[0] == 'two') {
        iList.add('2');
      }
      if (i[0] == 'three') {
        iList.add('3');
      }
      if (i[0] == 'four') {
        iList.add('4');
      }
      if (i[0] == 'five') {
        iList.add('5');
      }
      if (i[0] == 'six') {
        iList.add('6');
      }
      if (i[0] == 'seven') {
        iList.add('7');
      }
      if (i[0] == 'eight') {
        iList.add('8');
      }
      if (i[0] == 'nine') {
        iList.add('9');
      }
      if (i[0] == '1' ||
          i[0] == '2' ||
          i[0] == '3' ||
          i[0] == '4' ||
          i[0] == '5' ||
          i[0] == '6' ||
          i[0] == '7' ||
          i[0] == '8' ||
          i[0] == '9') {
        iList.add(i[0]);
      }
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
