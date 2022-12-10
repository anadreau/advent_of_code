import 'dart:convert';
import 'dart:io' as io;

//day 7
var file = io.File('lib/data/space_on_device.txt');

void spaceCalculator() {
  var lines = file.openRead().transform(utf8.decoder).transform(LineSplitter());
}
