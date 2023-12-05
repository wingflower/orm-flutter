import 'package:src/23_12_05/asset.dart';
import 'package:src/23_12_05/thing.dart';

///
/// 자산관리 프로그램의 유형 자산
///

class TangibleAsset extends Asset implements Thing {
  String name;
  int price;

  @override
  double weight;

  TangibleAsset({
    required this.name,
    required this.price,
    required this.weight,
  });
}
