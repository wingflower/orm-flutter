import 'dart:convert';

import 'package:http/http.dart' as http;

import 'movie_detail.dart';

///
/// 영화의 상세정보를 모델에 담고 json 형태로 출력하기
///

Future<MovieInfoDetails> getMovieDetails(int movieId, int id) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/$movieId?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=$id'));
  // return jsonDecode(response.body);
  return MovieInfoDetails.fromJson(jsonDecode(response.body));
}

Future<void> main() async {
  final movieIdList = [
    901362,
    940721,
    983507,
    572802,
    1113278,
    1022796,
    678512,
    1192578,
    1071215,
    940551,
    956920,
    839369,
    508883,
    496450,
    1027073,
    792307,
    842675,
    978870,
    840430,
    891699
  ];
  for (int movieId in movieIdList) {
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(await getMovieDetails(movieId, 1));
    print(prettyprint);
  }
}
