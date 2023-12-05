import 'computer.dart';

void main() {
  Computer com001 = Computer(
      color: "red",
      makerName: "SK",
      name: "macbook",
      price: 50000,
      weight: 1000.0);
  print(
      '${com001.name} ${com001.price} ${com001.makerName} ${com001.color} ${com001.weight}');
  com001.weight = 1000.0;
  print(
      '${com001.name} ${com001.price} ${com001.makerName} ${com001.color} ${com001.weight}');
}
