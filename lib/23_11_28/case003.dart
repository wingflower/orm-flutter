class Player {
  String name = '';
  int cntClap = 0;
}

class AhhClapRool {
  // Ahh: 30의 배수 (우선 순위 1)
  // Clap: 3의 배수 (우선 순위 2)
  // Rool: 10의 배수 (우선 순위 3)

  int cntAhh = 0;
  int cntClap = 0;
  int cntRool = 0;

  // 30의 배수 확인
  bool checkAhh(int n) {
    return n % 30 == 0 ? true : false;
  }

  // 3의 배수 확인
  bool checkClap(int n) {
    return n % 3 == 0 ? true : false;
  }

  // 10의 배수 확인
  bool checkRool(int n) {
    return n % 10 == 0 ? true : false;
  }

  String playGame(int n, Player player) {
    if (checkAhh(n)) {
      // 우선 순위 1
      cntAhh++;
      return 'Ahh';
    } else if (checkClap(n)) {
      // 우선 순위 2
      player.cntClap++;
      cntClap++;
      return 'Clap';
    } else if (checkRool(n)) {
      // 우선 순위 3
      cntRool++;
      return 'Rool';
    } else {
      return '$n';
    }
  }
}

void main() {
  List<Player> players = [Player(), Player(), Player(), Player()];

  players[0].name = 'Player 1';
  players[1].name = 'Player 2';
  players[2].name = 'Player 3';
  players[3].name = 'Player 4';

  AhhClapRool ahhClapRool = AhhClapRool();

  // 게임 시작 (1 ~ 100)
  for (int i = 1; i <= 100; i++) {
    Player currentPlayer = players[(i - 1) % players.length];

    // output 출력
    print('${currentPlayer.name}: ${ahhClapRool.playGame(i, currentPlayer)}');
  }
  // 게임 끝

  print('\n* 총 갯수');
  print('Ahh: ${ahhClapRool.cntAhh}');
  print('Clap: ${ahhClapRool.cntClap}');
  print('Rool: ${ahhClapRool.cntRool}');

  print('\n* player의 clap 갯수');
  for (Player player in players) {
    print('${player.name}: ${player.cntClap}');
  }

  Player maxClapPlayer =
  players.reduce((a, b) => a.cntClap > b.cntClap ? a : b);

  print('\n* 가장 많은 clap을 출력한 player: ${maxClapPlayer.name}');
}