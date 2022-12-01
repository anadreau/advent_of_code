//model for elf
class Elf {
  final int id;
  List<int> items;
  int calories;

  Elf({required this.id, this.calories = 0, this.items = const []});
}
