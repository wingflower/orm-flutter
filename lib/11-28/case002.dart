void main() {
  int start = 1;
  int ahh = 0;
  int clap = 0;
  int rool = 0;
  List<int> players = [0, 0, 0, 0];

  while (start <= 100) {
    final playerNumber = whichPlayer(start);

    if (isThirtyMultiples(start)) {
      print("Player$playerNumber: ahh");
      ahh += 1;
    } else if (isThreeMultiples(start)) {
      print("Player$playerNumber: clap");
      clap += 1;
      players[playerNumber - 1] += 1;
    } else if (isTenMultiples(start)) {
      print("Player$playerNumber: rool");
      rool += 1;
    } else {
      print("Player$playerNumber: $start");
    }

    start += 1;
  }

  print("Clap의 총 갯수: $clap");
  print("rool의 총 갯수: $rool");
  print("ahh의 총 갯수: $ahh");

  for (int i = 1; i <= players.length; i += 1) {
    print("Player$i: ${players[i - 1]}");
  }

  print("가장 많은 clap을 출력한 플레이어: Player${whichIsMax(players)}");
}

// 조건
// 우선 순위 - 30의 배수, 3의 배수, 10의 배수
// 30의 배수 - ahh
// 3의 배수 - clap
// 10의 배수 - rool

// 변수
// player별 clap 갯수를 저장하는 변수
// player1 ~ 4의 숫자를 print를 하는 로직이 필요

bool isThirtyMultiples(int number) {
  return number % 30 == 0;
}

bool isThreeMultiples(int number) {
  return number % 3 == 0;
}

bool isTenMultiples(int number) {
  return number % 10 == 0;
}

int whichPlayer(int number) {
  return number % 4 == 0 ? 4 : number % 4;
}

int whichIsMax(List<int> numbers) {
  List<int> exist = numbers;

  numbers.sort();
  int maxNumber = numbers[numbers.length - 1];

  return exist.indexOf(maxNumber);
}