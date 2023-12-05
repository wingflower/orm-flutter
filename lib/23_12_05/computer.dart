import 'package:src/23_12_05/tangible_asset.dart';

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
