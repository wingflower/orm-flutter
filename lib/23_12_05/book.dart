import 'package:src/23_12_05/tangible_asset.dart';

class Book extends TangibleAsset {
  String color;
  String isbn;

  Book({
    required this.color,
    required this.isbn,
    required super.name,
    required super.price,
  });
}
