import 'dart:io' as io;

import 'package:advent_of_code/2023/utils/file_io.dart';

final file = io.File('lib/2023/day2/test_doc.txt');

void main() async {
  List raw = await fileInputCapture(file);
}
