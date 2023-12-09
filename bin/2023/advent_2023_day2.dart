import 'dart:io' as io;

import 'package:advent_of_code/2023/day2/elf_game_calc.dart';
import 'package:advent_of_code/2023/day2/game_model.dart';
import 'package:advent_of_code/2023/utils/file_io.dart';

final file = io.File('lib/2023/day2/test_doc.txt');
int redMax = 0;
int blueMax = 0;
int greenMax = 0;

void main() async {
  List raw = await fileInputCapture(file);
  List<ElfGame> games = parseLines(raw);
  int gamesums = getGameSum(games, redMax, blueMax, greenMax);
  io.stdout.writeln('Sum of passing game IDs is: $gamesums');
}
