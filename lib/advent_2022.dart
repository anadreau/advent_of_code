import 'dart:convert';
import 'dart:developer';

import 'dart:io' as io;
import 'package:advent_2022/elf_model.dart';

//generate list from elfs.txt
Future<List<Elf>> _generateList() async {
  List<Elf> elfList = [];
  List<int> items = [];
  int elfId = 1;
  final file = io.File('lib/data/elfs.txt');

  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    await for (var line in lines) {
      //log(line);
      Elf elf = Elf(id: elfId);
      if (line.isNotEmpty) {
        items.add(int.parse(line));
      }
      if (line.isEmpty) {
        elf.items = items;
        elf.calories = await _calculateCalories(elf);
        elfList.add(elf);
        //log('elf: ${elf.id}, \nitems: ${elf.items}, \nCalories: ${elf.calories}');
        items.clear();
        elfId++;
      }
    }
  } catch (e) {
    log('$e');
  }
  log('${elfList.length}');
  return elfList;
}

Future<int> _calculateCalories(Elf elf) async {
  int totalCalories = 0;

  for (var item in elf.items) {
    totalCalories = totalCalories + item;
  }

  return totalCalories;
}

Future<Elf> sortElf() async {
  List<Elf> sortedElfs = await _generateList();
  log('${sortedElfs.first.id} and ${sortedElfs.first.calories}');
  sortedElfs.sort(((a, b) {
    return a.calories.compareTo(b.calories);
  }));
  var reversedList = sortedElfs.reversed;
  for (Elf elf in reversedList) {
    log('Elf ID: ${elf.id} with total calories: ${elf.calories}');
  }
  log('${sortedElfs.first.id} and ${sortedElfs.first.calories}');
  return reversedList.first;
}

Future<int> topThreeCalories() async {
  List<Elf> sortedElfs = await _generateList();
  sortedElfs.sort(((a, b) {
    return a.calories.compareTo(b.calories);
  }));
  var reversedList = sortedElfs.reversed;

  int topThree = reversedList.elementAt(0).calories +
      reversedList.elementAt(1).calories +
      reversedList.elementAt(2).calories;

  log('Top three calories equal: $topThree');
  return topThree;
}
