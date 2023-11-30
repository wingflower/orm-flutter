class IronMan {
  String name;
  int powerLevel;

  IronMan(this.name, this.powerLevel);

  void shoot() {
    print('$name is shooting guns!');
  }
}

class IronManMK3 extends IronMan {
//MK3는 리펄서를 쏘고 하늘을 날수 있게 해보세요
//shoot() 메서드를 오버라이드 합니다.
//비행고도 값을 추가한뒤
//fly() 메서드를 추가하세요
  var flyheight;

  IronManMK3(this.flyheight,super.name,super.powerLevel);

  @override
  void shoot(){
    print('$name is shooting Laser!');
  }

  void fly(){
    print('$name is flying in $flyheight');
  }
}


abstract class absIronMan {
  String name;
  String suitColor;

  absIronMan(this.name, this.suitColor);

  // This is an abstract method. It must be implemented by subclasses.
  void fly();

  // This is an abstract method. It must be implemented by subclasses.
  void shootLasers();

  // This is an abstract method. It must be implemented by subclasses.
  void withstandDamage();
}

//@override 구문을 사용하여 abstract method 구현
class Mark50 extends absIronMan {

  Mark50(String name, String suitColor): super(name, suitColor);

  @override
  void fly() {
    print("$name is flying");
  }

  @override
  void shootLasers() {
    print("$name is shoot Laser!");
  }

  @override
  void withstandDamage() {
    print("$name is make huge Damage");
  }
}

mixin Flyable on Animal {
  void fly() {
    print('I am flying!');
  }
}

class Animal {
  String name;

  Animal(this.name);
}

class Bird extends Animal with Flyable {
  // Bird는 Animal의 모든 속성과 메소드를 가지며,
  // Flyable mixin에서 제공하는 fly() 메소드도 가지고 있다.

  Bird(String name) : super(name);
}

void main() {
  IronMan mk1 = IronMan("mk1", 10);
  IronManMK3 mk3 = IronManMK3(1000, "mk3", 20);

  mk1.shoot();
  mk3.shoot();
  mk3.fly();

  var mark50 = Mark50("Mark50", "red");

  mark50.fly();
  mark50.shootLasers();
  mark50.withstandDamage();

  var bird = Bird('Bird'); // "Bird"라는 이름을 가진 Bird 객체 생성
  bird.fly(); // "I am flying!"을 출력합니다.
}