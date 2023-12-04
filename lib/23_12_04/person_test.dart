import 'package:src/23_12_04/person.dart';

///
/// 이름이 '홍길동', '한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
/// List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.
///

void main() {
  List<Person> people = [];

  people.add(Person(name: "홍길동"));
  people.add(Person(name: "한석봉"));

  for (final p in people) {
    print(p.name);
  }
}
