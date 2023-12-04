import 'package:src/23_12_04/wand.dart';
import 'package:src/23_12_04/wizard.dart';

void main() {
  Wand wand001 = Wand(name: 'wing', power: 80);
  Wizard wizard001 = Wizard(name: 'flower', hp: 100, mp: 3, wand: wand001);

  print(wizard001.info);
}
