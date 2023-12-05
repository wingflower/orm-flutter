import 'asset.dart';

///
/// 자산관리 프로그램의 무형 자산
///

class InTangibleAsset implements Asset {
  String name;
  int price;

  InTangibleAsset({
    required this.name,
    required this.price,
  });
}
