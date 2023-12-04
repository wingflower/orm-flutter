import 'package:src/23_12_04/wand.dart';

const int maxHp = 50;
const int maxMp = 50;

class Wizard {
  String _name;
  int hp;
  int _mp;
  Wand wand;

  String get name => _name;

  set name(String value) {
    if (value.length < 3) {
      throw Exception('Wizard의 이름은 3자 이상입니다.');
    }
    _name = value;
  }

  int get mp => _mp;

  set mp(int value) {
    // if (mp < 0 && mp > maxMp) {
    if (value < 0) {
      // _mp = 0;
      // return;
      throw Exception('Wizard의 MP는 0 이상이어야 합니다.');
    }
    if (value > maxMp) {
      // _mp = maxMp;
      // return;
      throw Exception('Wizard의 MP가 최대치를 초과하였습니다.');
    }
    _mp = value;
  }

  Wizard({
    this.hp = maxHp,
    required this.wand,
    required String name,
    required int mp,
  })  : _name = 3 <= name ? name : throw Exception('Wizard의 이름은 3자 이상입니다.'),
        _mp = mp;
}
