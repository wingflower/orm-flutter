import 'cleric.dart';

void main() {
  final Cleric cleric001 = Cleric("AAA", hp: 40, mp: 5);
  final Cleric cleric002 = Cleric("BBB", hp: 35);
  final Cleric cleric003 = Cleric("CCC");

  print('${cleric001.name} ${cleric001.hp} ${cleric001.mp}');
  cleric001.selfAid();
  cleric001.pray(1);
  print('${cleric001.name} ${cleric001.hp} ${cleric001.mp}');
  print('');

  print('${cleric002.name} ${cleric002.hp} ${cleric002.mp}');
  cleric002.selfAid();
  cleric002.pray(1);
  print('${cleric002.name} ${cleric002.hp} ${cleric002.mp}');
  print('');

  print('${cleric003.name} ${cleric003.hp} ${cleric003.mp}');
  cleric003.selfAid();
  cleric003.pray(1);
  print('${cleric003.name} ${cleric003.hp} ${cleric003.mp}');
}
