import 'dart:math';

class Cleric{
  String name;
  int hp = 50;
  final int maxHp = 50;
  int mp = 10;
  final int maxMp = 10;

  Cleric(this.name);

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
  }
}