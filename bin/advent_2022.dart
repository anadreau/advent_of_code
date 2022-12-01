import 'package:advent_2022/advent_2022.dart' as advent_2022;

void main() async {
  var topElf = await advent_2022.sortElf();
  var threeElvesTotal = await advent_2022.topThreeCalories();
  print('Elf carrying most callories is carrying: ${topElf.calories}');
  print('Top Three elves total calories equal: $threeElvesTotal');
}
