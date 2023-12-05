import 'package:src/23_12_05/hero.dart';
import 'package:src/23_12_05/poison_slime.dart';
import 'package:src/23_12_05/slime.dart';
import 'package:src/23_12_05/sword.dart';

void main() {
  Sword sword001 = Sword(name: 'Fire', damage: 1);
  Hero hero001 = Hero(name: 'SuperMan', hp: 10000, sword: sword001);
  Slime slime001 = Slime('A');
  PoisonSlime poisonSlime001 = PoisonSlime('A');

  print('영웅의 이름: ${hero001.name} 에너지:${hero001.hp}');

  slime001.attack(hero001);
  poisonSlime001.attack(hero001);

  print('영웅의 이름: ${hero001.name} 에너지:${hero001.hp}');
}
