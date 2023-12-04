import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;

List rawList = [];

//bring in data from file
Future<List> fileInputCapture(io.File file) async {
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  return await collateLines(lines);
}

//add lines to list
Future<List> collateLines(Stream<String> lines) async {
  try {
    //log('try');
    await for (var line in lines) {
      //log('Line: $line');
      if (line.isNotEmpty) {
        rawList.add(line);
      }

      //get sum of all two digit numbers
    }
  } catch (e) {
    log('Error: $e');
  }
  return rawList;
}
