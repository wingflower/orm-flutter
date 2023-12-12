import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'city': city,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'value': value,
      'trader': Trader(trader.name, trader.city).toJson()
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void main() {
  print('문제 1> 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오');
  // List<Transaction> list001 = transactions
  //     .where((e) => e.year == 2011)
  //     .toList()
  //     .sorted((a, b) => a.value.compareTo(b.value));
  // list001.forEach((e) => print(e.value));
  transactions
      .where((e) => e.year == 2011)
      .toList()
      .sorted((a, b) => a.value.compareTo(b.value))
      .forEach((e) => print(e.value));

  print('문제 2> 거래자가 근무하는 모든 도시를 중복 없이 나열하시오');
  // List<String> list002 =
  //     transactions.map((e) => e.trader.city).toSet().toList();
  // list002.forEach(print);
  (transactions.map((e) => e.trader.city).toSet()..toList()).forEach(print);

  print('문제 3> 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오');
  // List<Transaction> list003 = transactions
  //     .where((e) => e.trader.city == 'Cambridge')
  //     .toSet()
  //     .toList()
  //     .sorted((a, b) => a.trader.name.compareTo(b.trader.name));
  // list003.forEach((e) => print(e.trader.name));
  transactions
      .where((e) => e.trader.city == 'Cambridge')
      .toSet()
      .toList()
      .sorted((a, b) => a.trader.name.compareTo(b.trader.name))
      .forEach((e) => print(e.trader.name));

  print('문제 4> 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오');
  // List<String> list004 = transactions
  //     .map((e) => e.trader.name)
  //     .toSet()
  //     .toList()
  //     .sorted((a, b) => a.compareTo(b));
  // list004.forEach(print);
  transactions
      .map((e) => e.trader.name)
      .toSet()
      .toList()
      .sorted((a, b) => a.compareTo(b))
      .forEach(print);

  print('문제 5> 밀라노에 거래자가 있는가?');
  List<Transaction> list005 =
      transactions.where((e) => e.trader.city == 'Milan').toList();
  print(list005.isNotEmpty);

  print('문제 6> 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오');
  // List<Transaction> list006 =
  // transactions.where((e) => e.trader.city == 'Cambridge').toList();
  // list006.forEach((e) => print(e.toString()));
  (transactions.where((e) => e.trader.city == 'Cambridge').toList())
      .forEach((e) => print(e.toString()));

  print('문제 7> 전체 트랜잭션 중 최대값은 얼마인가?');
  int list007 = transactions.map((e) => e.value).reduce(max);
  print(list007);

  print('문제 8> 전체 트랜잭션 중 최소값은 얼마인가?');
  int list008 = transactions.map((e) => e.value).reduce(min);
  print(list008);
}
