import 'package:src/23_12_04/wand.dart';
import 'package:src/23_12_04/wizard.dart';

void main() {
  Wand wand001 = Wand(name: 'KingWangZZang', power: 100);
  Wizard wizard001 = Wizard(name: 'ox', hp: 100, mp: -3, wand: wand001);

  print('${wizard001.name} ${wizard001.hp} ${wizard001.mp}');

  wizard001.mp = -1;

  print('${wizard001.name} ${wizard001.hp} ${wizard001.mp}');
}
