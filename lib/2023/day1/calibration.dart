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
    RegExp('r(one|two|three|four|five|six|seven|eight|nine|[0-9])');

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

    ///take splitItem list and reverse to find match at end of String
    List reversedSplitItem = splitItem.reversed.toList();

    ///variables to handle below for loop
    secondWordMatch = false;
    fisrtWordMatch = false;
    workingString1 = '';
    workingString2 = '';

    ///adds letter until match found going from left to right
    for (String c in splitItem) {
      if (fisrtWordMatch == false) {
        workingString1 = workingString1 + c;
        var foundString1 = findNumber.firstMatch(workingString1);
        //find first word match from left to right of string
        if (foundString1?[0] != null) {
          firstNumber = foundString1![0].toString();
          fisrtWordMatch = true;
        }
      }
    }

    ///adds letters from a reversed list left to right to find last match
    for (String c in reversedSplitItem) {
      if (secondWordMatch = false) {
        workingString2 = c + workingString2;
        var foundString2 = findNumber.firstMatch(workingString2);
        //find first word match from left to right of string
        if (foundString2?[0] != null) {
          secondNumber = foundString2![0].toString();
          secondWordMatch = true;
        }
      }
    }

    String calibratedNumber = combineNumbers(firstNumber, secondNumber);
    calibratedList.add(int.parse(calibratedNumber));
  }
  return calibratedList;
}

///Combines the two numbers
String combineNumbers(String num1, String num2) {
  return num1 + num2;
}
