///
/// 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다.
/// 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
///

class Wand {
  final String name;
  final double power;

  Wand({
    required this.name,
    required this.power,
  }) {
    if (name.length < 3) throw Exception('Wand의 이름은 3글자 이상입니다.');
    if (power < 0.5 || power > 100) {
      throw Exception('Wand의 마력 범위는 0.5 이상 100 이하입니다.');
    }
  }
}
