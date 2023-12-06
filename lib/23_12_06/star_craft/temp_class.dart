abstract class Tribe {}

abstract class Terran extends Tribe {}

abstract class Protoss extends Tribe {}

abstract class Zerg extends Tribe {}

abstract interface class Bionic{}

abstract interface class Mechanic{}

// 테란은 종족(Tribe)이기도 하면서 Bionic 이니까... // mixin, abstract interface 선택 가능. 추후 어떤 요구기능 있는지에 따라 결정할 수 있을듯.
abstract interface class BioUnit implements Bionic {}

abstract interface class MechanicUnit implements Mechanic {}

// 저그 종족(Tribe)은 모두 생물로 구성되어 있기 때문에 건물에 대한 인터페이스 선언
abstract interface class BioBuilding implements Bionic {}

abstract interface class

class SCV extends Terran implements MechanicUnit {
  // 자원채취
  void getResource() {}

  // 메카닉 수리, 메카닉 타입을 인자로 받으므로 메카닉만 수리 가능
  void repair(Mechanic target) {}
}

class Tank extends Terran implements MechanicUnit {}

class Vulutre extends Terran implements MechanicUnit {}

class Marine extends Terran implements BioUnit {}

class Medic extends Terran implements BioUnit {
  void heal(Bionic target) {} // scv도 치료가 가능해야 하는데, 이렇게 하면 scv는 치료를 못함
// 방안 1. scv를 bionic 상속하여 만든다.
// 방안 2. heal 함수 내부에서 인자를 분류하여 치료 여부를 결정한다.
// 방안 3. scv 전용 heal 함수를 만든다.
}

void main() {}
