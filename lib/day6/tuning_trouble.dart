import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;

//day 6
final file = io.File('lib/data/packet_marker.txt');
int marker = 0;
String markerLetter = '';
int elementCount = 1;
int code = 0;
int search1 = 0;
int search2 = 0;
int search3 = 0;

Future<int> packetFinder() async {
  //marker value

  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    await for (var line in lines) {
      log('line Length ${line.length}');
      for (int i = 0; i < line.length - 4; i++) {
        String workingLine = line.substring(i, i + 4);

        log(workingLine);

        for (var x = 0; x < workingLine.length; x++) {
          for (var y = 0 + 1; y < workingLine.length; y++) {
            var search = workingLine.indexOf(workingLine[x], y);
            log('$search');
            if (x = 1 && search == -1) {
              code = i + 4;
              log('Code is $code');
              break;
            }
          }
        }

        // for (var a = 0; a < list.length; a++) {
        //   for (var b = a + 1; b < list.length; b++) {
        //     var search = list.indexOf(list[a]);

        //     var searchResults = list.indexOf(list[b], search);
        //     log('$searchResults');
        //   }
        // }
      }
    }
  } catch (e) {
    log('$e');
  }
  return marker;
}
