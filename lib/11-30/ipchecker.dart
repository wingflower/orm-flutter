abstract class IPChecker{
  String ipAddr;

  IPChecker(this.ipAddr);

  bool checkOctet();
  bool checkIP();
}


class IPCheckerBase extends IPChecker{
  late List<String> octetListString;
  List<int> octetListInt = [];
  // List<int> octetListInt = castingList();
  bool is4Octet = false;

  IPCheckerBase(super.ipAddr);

  // List<int> castingList() {
  //   List<int> intList = [];
  //   octetListString = ipAddr.split('.');
  //   octetListString.forEach((e) => intList.add(int.parse(e)));
  //   return intList;
  // }

  @override
  bool checkOctet() {
    // TODO: implement checkBit
    octetListString = ipAddr.split('.');
    octetListInt = [];
    try {
      octetListString.forEach((e) => octetListInt.add(int.parse(e)));
    } catch (e) {
      return false;
    }
    if (octetListInt.length == 4) {
      return true;
    } else {
      return false;
    }
  }

  @override
  bool checkIP() {
    // TODO: implement checkIP
    is4Octet = checkOctet();
    if (is4Octet) {
      if (checkZero()) {
        return true;
      } else {
        if (octetListInt[0] == 0) return false;
      }
      for (int i = 0; i<octetListInt.length; i++){
        if (255 < octetListInt[i]) return false;
      }
      return true;
    } else {
      return false;
    }
  }

  bool checkZero() {
    int sumList = 0;
    octetListInt.forEach((e) => sumList += e);
    if (sumList == 0) {
      return true;
    } else {
      return false;
    }
  }
}


class IPChecker0 extends IPCheckerBase{
  IPChecker0(super.ipAddr);
}


class IPChecker8 extends IPCheckerBase{
  IPChecker8(super.ipAddr);
}


class IPChecker16 extends IPCheckerBase{
  IPChecker16(super.ipAddr);
}


class IPChecker24 extends IPCheckerBase{
  IPChecker24(super.ipAddr);
}


void main() {
  List<String> inputList01 = [
    '192.168.0.1',
    '192.168.0.2',
    '192.168.0.3',
    '192.168.0.4'
  ];
  List<String> inputList02 = [
    '192.400.1.10.1000...',
    '4.3.2.1',
    '0..33.444...',
    '1.2.3.4'
  ];

  IPCheckerBase ipcb = IPCheckerBase('0.0.0.0');

  for (String ip in inputList01) {
    ipcb.ipAddr = ip;
    // print(ipcb.ipAddr);
    // print(ipcb.checkOctet());
    print(ipcb.checkIP());
  }
  print("---");
  for (String ip in inputList02) {
    ipcb.ipAddr = ip;
    // print(ipcb.ipAddr);
    // print(ipcb.checkOctet());
    print(ipcb.checkIP());
  }
}