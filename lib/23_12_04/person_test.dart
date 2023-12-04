import 'package:src/23_12_04/person.dart';

///
/// 이름이 '홍길동', '한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
/// List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.
///
///
/// 작성한 Person 클래스로 생성한 ‘홍길동’, ‘한석봉'의 나이를 각각 20, 25살 이라고 할 때, 이름과 나이를 쌍으로 적당한 컬렉션에 넣습니다.
/// 그 다음, 컬렉션에 저장한 값을 하나씩 다음과 같이 출력합니다.
/// “홍길동의 나이는 20살”
/// “한석봉의 나이는 25살”
///

void main() {
  List<int> ageList = [20, 25];
  List<Person> people = [];
  Map<Person, int> personAgeMap = {};
  Map<String, int> nameAgeMap = {};

  people.add(Person(name: "홍길동"));
  people.add(Person(name: "한석봉"));

  for (final p in people) {
    print(p.name);
  }

  for (int i = 0; i < ageList.length; i++) {
    personAgeMap[people[i]] = ageList[i];
    nameAgeMap[people[i].name] = ageList[i];
  }

  personAgeMap.forEach((k, v) => print("${k.name}의 나이는 $v살"));
  nameAgeMap.forEach((k, v) => print("$k의 나이는 $v살"));
}
