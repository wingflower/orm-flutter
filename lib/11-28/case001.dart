main() {
  int clapCount = 0;
  int roolCount = 0;
  int ahhCount = 0;

  int player1Claps = 0;
  int player2Claps = 0;
  int player3Claps = 0;
  int player4Claps = 0;

  int number = 1;
  while (number <= 100) {
    if (number % 30 == 0) {
      print('ahh');
      ahhCount++;
    } else if (number % 10 == 0) {
      print('rool');
      roolCount++;
    } else if (number % 3 == 0) {
      print('clap');
      clapCount++;

      if (number % 4 == 1) player1Claps++;
      if (number % 4 == 2) player2Claps++;
      if (number % 4 == 3) player3Claps++;
      if (number % 4 == 0) player4Claps++;
    } else {
      print(number);
    }
    number++;
  }

  print('총 clap: $clapCount, rool: $roolCount, ahh: $ahhCount');
  print('Player 1 clap $player1Claps번');
  print('Player 2 clap $player2Claps번');
  print('Player 3 clap $player3Claps번');
  print('Player 4 clap $player4Claps번');

  // 가장 많은 박수를 친 플레이어를 찾음
  String mostClapsPlayer = 'player1';
  int maxClaps = player1Claps;
  if (player2Claps > maxClaps) {
    mostClapsPlayer = 'player2';
    maxClaps = player2Claps;
  }
  if (player3Claps > maxClaps) {
    mostClapsPlayer = 'player3';
    maxClaps = player3Claps;
  }
  if (player4Claps > maxClaps) {
    mostClapsPlayer = 'player4';
    maxClaps = player4Claps;
  }

  print('가장 많이 박수친 플레이어: $mostClapsPlayer');
}