import 'dart:math';



class Cleric {
  ///
  /// 공통으로 참조될 값이므로 메모리를 절약하기 위해 static 선언
  ///
  static const int maxHp = 50;
  static const int maxMp = 10;

  String name;
  int hp;
  int mp;

  ///
  /// name은 필수, hp와 mp는 옵션이지만 기본값 설정
  ///
  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});

  void selfAid() {
    if (hp == maxHp) {
      print("현재 HP가 최대입니다.");
    } else {
      if (mp >= 5) {
        mp -= 5;
        hp = maxHp;
      } else {
        print("MP가 부족합니다.");
      }
    }
  }

  int pray(int sec) {
    if (sec > 0) {
      int recoverMp = 0;
      if (mp == maxMp) {
        print("현재 MP가 최대입니다.");
        return recoverMp;
      }
      int bonusMp = Random().nextInt(3);
      recoverMp = sec + bonusMp;
      if (mp + recoverMp > maxMp) {
        recoverMp = maxMp - mp;
      }
      mp += recoverMp;
      return recoverMp;
    } else {
      print("기도하세요.");
      return 0;
    }
  }
}