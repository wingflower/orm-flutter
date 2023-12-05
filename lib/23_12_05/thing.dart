abstract interface class Thing {
  double _weight;

  double get weight => _weight;

  set weight(double value) {
    _weight = value;
  }

  Thing({
    required double weight,
  }) : _weight = weight;
}