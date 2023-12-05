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
    //find first match in item and add to iList after converting to number
    // RegExpMatch? firstInt = findNumber.firstMatch(item);
    // if (firstInt != null) {
    //   if (firstInt[0] == 'one') {
    //     iList.add('1');
    //   }
    //   if (firstInt[0] == 'two') {
    //     iList.add('2');
    //   }
    //   if (firstInt[0] == 'three') {
    //     iList.add('3');
    //   }
    //   if (firstInt[0] == 'four') {
    //     iList.add('4');
    //   }
    //   if (firstInt[0] == 'five') {
    //     iList.add('5');
    //   }
    //   if (firstInt[0] == 'six') {
    //     iList.add('6');
    //   }
    //   if (firstInt[0] == 'seven') {
    //     iList.add('7');
    //   }
    //   if (firstInt[0] == 'eight') {
    //     iList.add('8');
    //   }
    //   if (firstInt[0] == 'nine') {
    //     iList.add('9');
    //   }
    //   if (firstInt[0] == '1' ||
    //       firstInt[0] == '2' ||
    //       firstInt[0] == '3' ||
    //       firstInt[0] == '4' ||
    //       firstInt[0] == '5' ||
    //       firstInt[0] == '6' ||
    //       firstInt[0] == '7' ||
    //       firstInt[0] == '8' ||
    //       firstInt[0] == '9') {
    //     iList.add(firstInt[0]);
    //   }
    // }
    //find last number in item and add to iList after converting to number
    switch (item) {
      case 'one':
        iList.add('1');
        break;
      case 'two':
        iList.add('2');
        break;
      case 'three':
        iList.add('3');
        break;
      case 'four':
        iList.add('4');
        break;
      case 'five':
        iList.add('5');
        break;
      case 'six':
        iList.add('6');
        break;
      case 'seven':
        iList.add('7');
        break;
      case 'eight':
        iList.add('8');
        break;
      case 'nine':
        iList.add('9');
        break;
      case '1':
        iList.add('1');
        break;
      case '2':
        iList.add('2');
        break;
      case '3':
        iList.add('3');
        break;
      case '4':
        iList.add('4');
        break;
      case '5':
        iList.add('5');
        break;
      case '6':
        iList.add('6');
        break;
      case '7':
        iList.add('7');
        break;
      case '8':
        iList.add('8');
        break;
      case '9':
        iList.add('9');
        break;
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
