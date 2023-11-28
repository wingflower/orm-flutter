class Game369 {

  List<String> players = ['Player1', 'Player2', 'Player3', 'Player4'];
  var player;
  var answer;
  int ahhCnt = 0;
  int clapCnt = 0;
  int roolCnt = 0;
  int p1ClapCnt = 0;
  int p2ClapCnt = 0;
  int p3ClapCnt = 0;
  int p4ClapCnt = 0;
  List<int> clapCountsByPlayer = [0, 0, 0, 0];
  int maxClapCount = 0;
  String playerWithMaxClap = '';
  // Map<String, int> gameResult = {
  //   "Player1":0,
  //   "Player2":0,
  //   "Player3":0,
  //   "Player4":0,
  // };

  Game369();

  void play() {
    for(int i=1; i < 101; i++) {
      if ( i % 30 == 0) {
        answer = "ahh";
        ahhCnt++;
      } else if ( i % 3 == 0) {
        answer = "clap";
        clapCnt++;
      } else if ( i % 10 == 0) {
        answer = "rool";
        roolCnt++;
      } else {
        answer = i.toString();
      }
      if ( i % 4 == 1) {
        player = "Player1";
        if (answer == "clap") {
          p1ClapCnt += 1;
          clapCountsByPlayer[0]++;
        }
      } else if ( i % 4 == 2) {
        player = "Player2";
        if (answer == "clap") {
          p2ClapCnt += 1;
          clapCountsByPlayer[1]++;
        }
      } else if ( i % 4 == 3) {
        player = "Player3";
        if (answer == "clap") {
          p3ClapCnt += 1;
          clapCountsByPlayer[2]++;
        }
      } else if ( i % 4 == 0) {
        player = "Player4";
        if (answer == "clap") {
          p4ClapCnt += 1;
          clapCountsByPlayer[3]++;
        }
      }
      for (int i=0; i<players.length; i++){
        int count = clapCountsByPlayer[i];
        print('${players[i]}: $count');

        if (count > maxClapCount) {
          maxClapCount = count;
          playerWithMaxClap = players[i];
        }
      }
      
      print("$player : $answer");
      print("clap: $clapCnt, rool: $roolCnt, ahh: $ahhCnt");
      print("Player1's clap count: $p1ClapCnt");
      print("Player2's clap count: $p2ClapCnt");
      print("Player3's clap count: $p3ClapCnt");
      print("Player4's clap count: $p4ClapCnt");
      print('가장 많은 clap 플레이어: $playerWithMaxClap');
    }
  }
}

void main() {
  Game369 game369 = Game369();
  game369.play();
}