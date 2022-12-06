import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;

import 'package:advent_2022/day4/cleaning_elf_model.dart';

final file = io.File('lib/data/cleaning.txt');
int overlappingSections = 0;
int elfId = 1;

//seperate the lines by ','
void readFile() async {
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());

  try {
    await for (var line in lines) {
      List sections = line.split(',');
      String elf1Sections = sections[0];
      String elf2Sections = sections[1];
      log('elf1: $elf1Sections');
      log('elf2: $elf2Sections');
      List elf1Sectionslist = elf1Sections.split('-');
      List elf2Sectionslist = elf2Sections.split('-');
      CleaningElf elf1 = CleaningElf(
          endRange: int.parse(elf1Sectionslist[1]),
          elfId: elfId,
          startRange: int.parse(elf1Sectionslist[0]));
      CleaningElf elf2 = CleaningElf(
          endRange: int.parse(elf2Sectionslist[1]),
          elfId: elfId,
          startRange: int.parse(elf2Sectionslist[0]));

      //compare elfs sections that overlap completly
      // if (elf1.startRange <= elf2.startRange &&
      //         elf1.endRange >= elf2.endRange ||
      //     elf2.startRange <= elf1.startRange &&
      //         elf2.endRange >= elf1.endRange) {
      //   //range fully encompasses the other
      //   overlappingSections++;
      //   log('$overlappingSections');
      // }
      //compare elfs sections that overlap at all
      if (elf1.startRange <= elf2.startRange &&
              elf1.endRange >= elf2.startRange ||
          elf2.startRange <= elf1.startRange &&
              elf2.endRange >= elf1.startRange ||
          elf1.endRange >= elf2.endRange && elf1.startRange <= elf2.endRange ||
          elf2.endRange >= elf1.endRange && elf2.endRange <= elf1.startRange) {
        //range fully encompasses the other
        overlappingSections++;
        log('$overlappingSections');
      }
    }
  } catch (e) {
    log('$e');
  }
}
