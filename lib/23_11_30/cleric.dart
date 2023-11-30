class Cleric{
  String name;
  int hp = 50;
  final int maxHp = 50;
  int mp = 10;
  final int maxMp = 10;

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
}