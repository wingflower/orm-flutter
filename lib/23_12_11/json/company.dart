import 'dart:convert';
import 'dart:io';

///
/// 총무부 리더 ‘홍길동(41세)’의 인스턴스를 생성하고 직렬화하여 company.txt 파일에 쓰는 프로그램을 작성하시오.
/// 직렬화를 위해 위의 2개 클래스를 일부 수정해도 됩니다.
///

class Employee {
  final String name;
  final EmployeeRank rank;
  int age;

  Employee({
    required this.name,
    required this.age,
    required this.rank,
  });

  Map<String, dynamic> toMap() {
    return {"name": name, "age": age, "rank": rank.name};
  }

  factory Employee.fromJson(Map<String, dynamic> map) {
    return Employee(
      name: map['name'],
      age: map['age'],
      rank: _getRank(map['rank']),
    );
  }

  static EmployeeRank _getRank(String rank) {
    switch (rank) {
      case 'leader':
        return EmployeeRank.leader;
      case 'header':
        return EmployeeRank.header;
      case 'manager':
        return EmployeeRank.manager;
      case 'staff':
        return EmployeeRank.staff;
      case 'intern':
        return EmployeeRank.intern;
    }
    return EmployeeRank.intern;
  }

  @override
  String toString() {
    return jsonEncode(toMap());
  }
}

class Department {
  String name;
  Employee leader;

  Department({required this.name, required this.leader});

  factory Department.fromJson(Map<String, dynamic> map) {
    return Department(
      name: map['name'],
      leader: Employee.fromJson(map['leader']),
    );
  }

  void toJson(String jsonFile) {
    final sourceFile = File(jsonFile);
    sourceFile.writeAsStringSync(jsonEncode(toMap()));
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'leader': leader.toJson(),
  //   };
  // }

  Map<String, dynamic> toMap() {
    return {"name": name, "leader": leader.toMap()};
  }

  @override
  String toString() {
    return jsonEncode(toMap());
  }
}

enum EmployeeRank { leader, header, manager, staff, intern }

void main() {
  final path = '/Users/flower/flower/flutter/lecture/src/lib/23_12_11/json/';

  Employee emp001 = Employee(name: "홍길동", age: 41, rank: EmployeeRank.leader);
  Employee emp002 = Employee(name: "곽혜정", age: 25, rank: EmployeeRank.header);
  Employee emp003 = Employee(name: "안종준", age: 24, rank: EmployeeRank.leader);
  Employee emp004 = Employee(name: "김다희", age: 23, rank: EmployeeRank.manager);
  Employee emp005 = Employee(name: "길솔인", age: 22, rank: EmployeeRank.staff);
  Employee emp006 = Employee(name: "곽동호", age: 21, rank: EmployeeRank.intern);

  Department department001 = Department(name: '총무부', leader: emp001);
  Department department002 = Department(name: 'B3', leader: emp003);

  print("----- 부서 확인");
  print(department001);
  // ----- 파일 쓰기
  department001.toJson('${path}company.txt');
  // ----- 파일 읽기
  final companyFile = File('${path}company.txt');
  final contents = companyFile.readAsStringSync();
  print("----- 파일 읽기");
  print('자료형: ${contents.runtimeType} \n내용: $contents');
  // ----- 역직렬화
  final department003 = Department.fromJson(jsonDecode(contents));
  print(department003);
}
