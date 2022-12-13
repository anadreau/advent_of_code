import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;

//day 7
var file = io.File('lib/data/space_on_device.txt');
List dirList = ['/'];

void spaceCalculator() async {
  var lines = file.openRead().transform(utf8.decoder).transform(LineSplitter());
  var rx = RegExp(r'd\+');
  List workingDirectory = [];
  //iterate through lines
  await for (var line in lines) {
    var lineParser = line.split(' ');
    //check cd commands
    if (lineParser[0] == '\$') {
      log('This line holds a cd command: $line');
    }
    if (rx.hasMatch(lineParser[0])) {
      log('This line holds a file: ${lineParser[1]}');
    }
    if (lineParser[0] == 'dir') {
      log('This line holds a dir: ${lineParser[1]}');
    }
  }
}
