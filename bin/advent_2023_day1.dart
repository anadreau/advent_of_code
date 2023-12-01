import 'dart:developer';

import 'package:advent_of_code/2023/day1/calibration.dart';
import 'dart:io';

void main() async {
  int calibrationSum = await calibrationResolver();
  stdout.writeln('Sum of Calibration numbers is: $calibrationSum');
}
