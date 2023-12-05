import 'dart:math';

import 'package:src/23_12_05/sword.dart';

int money = 100;

class Hero {
  // 공통의 돈
  static int money = 100;

  static void moneyRandom() {
    Hero.money = Random().nextInt(1000);
  }

  String name;
  int hp;
  Sword? sword;

  Hero({
    this.name = '홍길동',
    this.hp = 100,
    this.sword,
  });

  // 메서드 : 클래스내에서 클래스를 위한 동작을 하는 함수
  // 함수 : 클래스랑 상관 없이 독자적으로 실행되는 함수
  void attack() {}

  void run() {}
}
