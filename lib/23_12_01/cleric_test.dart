import 'cleric.dart';

void main() {
  final Cleric cleric001 = Cleric("AAA", hp:40, mp:5);
  final Cleric cleric002 = Cleric("BBB", hp:35);
  final Cleric cleric003 = Cleric("CCC");

  print("$cleric001.name}");
  print(cleric001.hp);
  print(cleric001.mp);

  print(cleric002.name);
  print(cleric002.hp);
  print(cleric003.mp);

  print(cleric003.name);
  print(cleric003.hp);
  print(cleric003.mp);
}