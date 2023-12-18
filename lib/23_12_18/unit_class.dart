import 'dart:math';

class IsEven {
  bool isEven(int inputNum) {
    if (inputNum <= 0) {
      return false;
    } else {
      if (inputNum.isEven) {
        return true;
      }
      return false;
    }
  }
}

class FineMax {
  int findMax(List<int> numList) {
    return numList.reduce(max);
  }
}

class ReverseString {
  String reverseString(String s) {
    return s.split('').reversed.join();
  }
}