import 'package:src/23_12_04/wand.dart';

///
/// 마법사의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다.
/// 마법사의 지팡이는 null 일 수 없다.
/// 마법사의 MP는 0 이상이어야 한다.
/// HP가 음수가 되는 상황에서는 대신 0이 설정 되도록 한다. (에러 아님)
///

class Wizard {
  final String name;
  int hp;
  int? _mp;
  Wand wand;

  set mp(int mp) =>
      _mp = mp < 0 ? throw Exception('wizard의 mp는 0보다 작을 수 없습니다.') : _mp = mp;

  Wizard({
    required this.name,
    required this.hp,
    required int mp,
    required this.wand,
  }) {
    if (name.length < 3) throw Exception('Wizard의 이름은 3글자 이상입니다.');
    // if (wand == null) throw Exception('Wand가 없습니다.');
    if (wand.runtimeType != Wand) throw Exception('Wand가 아닙니다.');
    if (mp < 0) throw Exception('Wizard의 mp는 0보다 작을 수 없습니다.');
    if (hp < 0) hp = 0;
  }

  String get info =>
      'name: $name, hp/mp: $hp/$_mp, wand: ${wand!.name}/${wand!.power}';
}
