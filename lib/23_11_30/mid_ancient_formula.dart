import 'dart:io';
import 'dart:math';

void main() {
  int ancientSum = 0;
  List<int> sumList = [];
  print("Enter ancient string.");
  String temp = stdin.readLineSync()!;
  List<String> ancientList = temp.split("+");
  for (String s in ancientList) {
    int temp = 0;
    for (int i = 0; i < s.length; i++){
      if (s[i] == "<") {
        temp += 10;
      } else if (s[i] == "/") {
        temp += 1;
      }
    }
    sumList.add(temp);
  }
  sumList.forEach((e) => ancientSum += e);
  String formula = sumList.join(" + ");
  print("$formula = $ancientSum");
}