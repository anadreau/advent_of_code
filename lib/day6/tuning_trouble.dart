import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;
import 'dart:collection';

//day 6
final file = io.File('lib/data/packet_marker.txt');
int marker = 0;
String markerLetter = '';
int elementCount = 1;

Future<int> packetFinder() async {
  //marker value

  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    await for (var line in lines) {
      log('line Length ${line.length}');
      for (int i = 0; i < line.length - 4; i++) {
        String workingLine = line.substring(i, i + 4);
        List list = workingLine.split('');

        //log('$list');
        for (int y = 0; y < list.length; y++) {
          for (int z = 0; z < list.length; z++) {
            if (list[z] == list[y] && z != y) {
              markerLetter = list[z];
              //log('failed: $markerLetter');
              break;
            }
            if (list[z] == list.length - 1 && list[y] == list.length - 1) {
              marker = i + 4;
              log('$marker');
              break;
            }
          }
        }
      }
    }
  } catch (e) {
    log('$e');
  }
  return marker;
}
