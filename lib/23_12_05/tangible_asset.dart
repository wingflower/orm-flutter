import 'asset.dart';
import 'thing.dart';

///
/// 자산관리 프로그램의 유형 자산
///
/// 형태가 있기 때문에 Thing 을 implements하여 weight를 가질 수 있도록 한다.
///

abstract class TangibleAsset extends Asset implements Thing {
  int price;
  String color;
  double _weight;

  TangibleAsset({
    required super.name,
    required this.price,
    required this.color,
    weight
  }) : _weight = weight;

  @override
  set weight(double weight) {
    _weight = weight;
  }

  @override
  double get weight => _weight;
}
