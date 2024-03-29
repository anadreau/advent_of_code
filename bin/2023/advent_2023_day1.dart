import 'package:advent_of_code/2023/day1/calibration.dart';
import 'dart:io' as io;

import 'package:advent_of_code/2023/utils/file_io.dart';

final file = io.File('lib/2023/day1/calibration_doc.txt');

void main() async {
  List raw = await fileInputCapture(file);
  List calibrated = calibrateNumbers(raw);
  int calibrationSum = returnSum(calibrated);
  io.stdout.writeln('Sum of Calibration numbers is: $calibrationSum');
}
