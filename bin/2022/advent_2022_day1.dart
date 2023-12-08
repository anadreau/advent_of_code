import 'package:advent_of_code/2022/day1/elf_calorie_counter.dart'
    as calorie_counter;

void main() async {
  var topElf = await calorie_counter.sortElf();
  var threeElvesTotal = await calorie_counter.topThreeCalories();
  print('Elf carrying most callories is carrying: ${topElf.calories}');
  print('Top Three elves total calories equal: $threeElvesTotal');
}
