import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable(explicitToJson: true)
class Store {
  String address;
  String name;
  String stock;
  int type;

  Store({
    required this.address,
    required this.name,
    required this.stock,
    required this.type,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);

  @override
  String toString() {
    return 'Store{name: $name, address: $address, stock: $stock, type: $type}';
  }
}