import 'dart:developer';

List calibratedList = [];
int calibationSum = 0;
String firstNumber = '';
String secondNumber = '';
int workingInt = 0;
String workingString1 = '';
String workingString2 = '';
bool fisrtWordMatch = false;
bool secondWordMatch = false;
RegExp findNumber =
    RegExp(r'one|two|three|four|five|six|seven|eight|nine|[1-9]');

//return that sum from list of two digit numbers
int returnSum(List calibratedList) {
  for (int num in calibratedList) {
    log('math check $calibationSum + $num');
    calibationSum = calibationSum + num;
  }
  log('CalibrationSum: $calibationSum');

  return calibationSum;
}

List calibrateNumbers(List rawList) {
  //log('Line Count: ${rawList.length.toString()}');
  //parse each line and pull the first digit and the last digit
  for (String item in rawList) {
    ///Split each item into characters
    List splitItem = item.split('');
    //log('Split: $splitItem');

    ///take splitItem list and reverse to find match at end of String
    List reversedSplitItem = splitItem.reversed.toList();
    //log('ReverseSplit: $reversedSplitItem');
    firstNumber = firstMatch(splitItem);
    secondNumber = secondMatch(reversedSplitItem);

    String calibratedNumber = combineNumbers(firstNumber, secondNumber);
    calibratedList.add(int.parse(calibratedNumber));
  }
  return calibratedList;
}

///find first match
String firstMatch(List splitItem) {
  ///variables to handle below for loop
  fisrtWordMatch = false;
  workingString1 = '';

  ///adds letter until match found going from left to right
  for (String c in splitItem) {
    if (fisrtWordMatch == false) {
      workingString1 = workingString1 + c;
      var foundString1 = findNumber.firstMatch(workingString1);
      //find first word match from left to right of string
      if (foundString1?[0] != null) {
        var tempNum = foundString1![0].toString();
        //log('first: $tempNum');
        fisrtWordMatch = true;
        firstNumber = convertNumber(tempNum);
      }
    }
  }
  return firstNumber;
}

///find second match
String secondMatch(List reversedSplitItem) {
  ///variables to handle below for loop
  secondWordMatch = false;
  workingString2 = '';

  ///adds letters from a reversed list left to right to find last match
  for (String c in reversedSplitItem) {
    if (secondWordMatch == false) {
      workingString2 = c + workingString2;
      //log('workingString2: $workingString2');
      var foundString2 = findNumber.firstMatch(workingString2);
      //find first word match from left to right of string
      if (foundString2?[0] != null) {
        var tempNum = foundString2![0].toString();
        //log('2nd: $tempNum');
        secondNumber = convertNumber(tempNum);
        secondWordMatch = true;
      }
    }
  }
  return secondNumber;
}

///Combines the two numbers
String combineNumbers(String num1, String num2) {
  String combinedNum = '';
  if (num1 == '') {
    combinedNum = num2 + num2;
  } else if (num2 == '') {
    combinedNum = num1 + num1;
  } else {
    combinedNum = num1 + num2;
  }
  return combinedNum;
}

String convertNumber(String num) {
  switch (num) {
    case 'one':
      return '1';
    case 'two':
      return '2';
    case 'three':
      return '3';
    case 'four':
      return '4';
    case 'five':
      return '5';
    case 'six':
      return '6';
    case 'seven':
      return '7';
    case 'eight':
      return '8';
    case 'nine':
      return '9';
    case '1':
      return '1';
    case '2':
      return '2';
    case '3':
      return '3';
    case '4':
      return '4';
    case '5':
      return '5';
    case '6':
      return '6';
    case '7':
      return '7';
    case '8':
      return '8';
    case '9':
      return '9';
    default:
      return '1';
  }
}
