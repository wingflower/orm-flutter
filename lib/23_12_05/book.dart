import 'package:src/23_12_05/tangible_asset.dart';

///
/// 자산관리 프로그램의 유형 자산 [책]
///

class Book extends TangibleAsset {
  String color;
  String isbn;

  Book({
    required this.color,
    required this.isbn,
    required super.name,
    required super.price,
    required super.weight,
  });
}
