import 'dart:convert';

import 'package:http/http.dart' as http;
import 'movies_page.dart';

///
/// 영화정보를 가져와서 모델에 담고 json 형태로 출력하기
///

Future<MoviesPage> getMovies(int id) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=$id'));
  return MoviesPage.fromJson(jsonDecode(response.body));
}

Future<void> main() async {
  // JsonEncoder encoder = JsonEncoder.withIndent('  ');
  // String prettyprint = encoder.convert(await getMovie(1));
  // print(prettyprint);
  MoviesPage moviesPage = await getMovies(1);
  List<int> movieIdList = [];
  for (final movie in moviesPage.results) {
    movieIdList.add(movie.toJson()['id']);
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(movie.toJson());
    print(prettyprint);
  }
  print(movieIdList);
}
