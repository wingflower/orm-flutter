class StrongBox<E> {
  E? _data;
  final KeyType keyType;
  int _tryCount = 0;

  StrongBox({
    required this.keyType,
  });

  void put(E data) {
    _data = data;
  }

  Object? get() {
    _tryCount += 1;
    switch (keyType) {
      case KeyType.padlock:
        if (_tryCount == 1024) {
          return _data;
        }
      case KeyType.button:
        if (_tryCount == 10000) {
          return _data;
        }
      case KeyType.dial:
        if (_tryCount == 30000) {
          return _data;
        }
      case KeyType.finger:
        if (_tryCount == 1000000) {
          return _data;
        }
    }
    return null;
  }
}

enum KeyType {
  padlock,
  button,
  dial,
  finger,
}

void main() {
  String treasure = 'treasure';
  for (KeyType key in KeyType.values) {
    StrongBox strongBox = StrongBox(keyType: key);
    strongBox.put(treasure);
    int i = 0;
    int nullCount = 0;
    print('--- 금고를 털어보자 ---');
    while (i <= 1000000) {
      var tempSomething = strongBox.get();
      if (tempSomething == null) {
        nullCount += 1;
      } else {
        print('금고의 내용물은 $tempSomething 입니다.');
        print('금고를 털려는 시도는 $nullCount 번 입니다.');
      }
      i += 1;
    }
  }
}
