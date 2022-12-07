import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;

//Hard coded starting columns
Map<int, List<String>> columns = {
  1: ['R', 'N', 'P', 'G'],
  2: ['T', 'J', 'B', 'L', 'C', 'S', 'V', 'H'],
  3: ['T', 'D', 'B', 'M', 'N', 'L'],
  4: ['R', 'V', 'P', 'S', 'B'],
  5: ['G', 'C', 'Q', 'S', 'W', 'M', 'V', 'H'],
  6: ['W', 'Q', 'S', 'C', 'D', 'B', 'J'],
  7: ['F', 'Q', 'L'],
  8: ['W', 'M', 'H', 'T', 'D', 'L', 'F', 'V'],
  9: ['L', 'P', 'B', 'V', 'M', 'J', 'F']
};

final file = io.File('lib/data/supply_stack_procedure.txt');

//read file
void supplyStackMover() async {
  //Read elfText.txt file by line
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    await for (var line in lines) {
      var split = line.split(' ');
      //log('$split');
      //movement
      int moveLetters = int.parse(split[1]);
      //from column *
      int fromColumn = int.parse(split[3]);
      //to column *
      int toColumn = int.parse(split[5]);
      //execute movement
      //_moveInstructions(moveLetters, fromColumn, toColumn);
      _moveInstructions9001(moveLetters, fromColumn, toColumn);
    }
  } catch (e) {
    log('$e');
  }
  log('Last letters are ${columns[1]!.last}, ${columns[2]!.last}, ${columns[3]!.last}, ${columns[4]!.last}, ${columns[5]!.last}, ${columns[6]!.last}, ${columns[7]!.last}, ${columns[8]!.last}, ${columns[9]!.last}');
}

//move letter from column to column
void _moveInstructions(int move, int from, int to) {
  //add to new column
  for (int i = move; i > 0; i--) {
    //log('From before: ${columns[from]}');
    //take x from last spot in column from and add to column to
    var x = columns[from]!.last;
    //log('To before add ${columns[to]}');
    columns[to]!.add(x);
    //log('To after add ${columns[to]}');
    //remove x from column from
    columns[from]!.removeLast();
    //log('From after: ${columns[from]}');
  }

  //remove from old column
}

void _moveInstructions9001(int move, int from, int to) {
  int moveBlock = columns[from]!.length - move;
  var x = columns[from]!.sublist(moveBlock);
  columns[to]!.addAll(x);
  columns[from]!.removeRange(moveBlock, columns[from]!.length);
}
