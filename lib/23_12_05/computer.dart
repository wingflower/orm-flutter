import 'package:src/23_12_05/tangible_asset.dart';

///
/// 자산관리 프로그램의 유형 자산 [컴퓨터]
///

class Computer extends TangibleAsset {
  String color;
  String makerName;

  Computer({
    required this.color,
    required this.makerName,
    required super.name,
    required super.price,
  });
}
