// 잘못된 상속 출력
class WrongInheritance {
  final String Person = 'Student';
  final String Car = 'Engine';
  final String Father = 'Child';
  final String Food = 'Susi';
  final String SuperMan = 'Man';

  String get answer => 'Car: $Car, Father: $Father, SuperMan: $SuperMan';
}

// 통신 수단
class NetworkDevice {}

class Phone extends NetworkDevice {}

class SmartPhone extends Phone {}

// 이동 수단
class Transportation {}

class Car extends Transportation {}

class SUV extends Car {}

// 라면받침....
class RamenHolder {}

class Dictionary extends RamenHolder {}

class YearBook extends Dictionary {}
