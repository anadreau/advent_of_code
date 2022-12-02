import 'dart:io' as io;
import 'dart:convert';

//match logic
final file = io.File('lib/data/rps.txt');

//Read rps.txt file by line
Stream<String> lines =
    file.openRead().transform(utf8.decoder).transform(LineSplitter());

//parse line