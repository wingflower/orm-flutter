import 'package:src/23_12_05/asset.dart';

///
/// 자산관리 프로그램의 유형 자산
///

class TangibleAsset implements Asset {
  String name;
  int price;

  TangibleAsset({
    required this.name,
    required this.price,
  });
}
