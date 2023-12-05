import 'package:src/23_12_05/computer.dart';

void main() {
  Computer com001 = Computer(
      color: "red",
      makerName: "SK",
      name: "macbook",
      price: 50000000,
      weight: 3000);
  print(
      '${com001.name} ${com001.price} ${com001.makerName} ${com001.color} ${com001.weight}');
  com001.weight = 10000000;
  print(
      '${com001.name} ${com001.price} ${com001.makerName} ${com001.color} ${com001.weight}');
}
