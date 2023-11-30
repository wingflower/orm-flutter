import 'dart:io';

void main()
{
  String num01;
  String num02;
  int sumMaxValue;
  List<int> inputList = [0, 0, 0, 0];
  for (int i = 0; i < 4; i++) {
    print("Enter card number$i?");
    try{
      int temp = int.parse(stdin.readLineSync()!);
      if (temp > 0 && temp < 10) {
        inputList[i] = temp;
      } else {
        print("Please enter [1-9].");
        return;
      }
    }catch (e){
      print("Please enter a Number.");
      return;
    }
  }
  inputList.sort();
  num01 = inputList[3].toString() + inputList[1].toString();
  num02 = inputList[2].toString() + inputList[0].toString();
  sumMaxValue = int.parse(num01) + int.parse(num02);
  print("$num01 + $num02 = $sumMaxValue");
}