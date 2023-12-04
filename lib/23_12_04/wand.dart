const wandName = 'gyang';
const wandPower = 10.0;

class Wand {
  String name;
  double _power;

  double get power => _power;

  set power(double value) {
    if (value >= 0.5 && value <= 100) {
      _power = value;
    } else {
      throw Exception('지팡이의 마력이 비정상입니다.');
    }
  }

  Wand({
    this.name = wandName,
    double power = wandPower,
  }) : _power = power;
}
