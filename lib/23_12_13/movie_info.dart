import 'dart:convert';

///
/// director 가 누군지 출력
///

Future<String> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));
  final mockData = {
    'title': 'Star Wars',
    'director': 'George Lucas',
    'year': 1977,
  };
  return jsonEncode(mockData);
}

void main() async {
  print(jsonDecode(await getMovieInfo())['director']);
}

///
/// jsonEncode() : Map 데이터를 Json 형태의 문자열로 변환해 주는 함수
/// jsonDecode() : Json 형태의 문자열을 Map<String, dynamic> 으로 변환
///