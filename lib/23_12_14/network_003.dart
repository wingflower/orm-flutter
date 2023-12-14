
///
/// 네트워크 상의 사진 파일을 다운로드 받는 함수를 작성
/// Uint8List 는 “고정 길이 unsigned 8byte integer array” 이다. 즉, byteArray 타입이라고 보면 된다. 즉, 메모리다.
/// 메모리에 저장된 사진을 파일로 저장
/// 그림 파일을 저장하는 프로그램 작성
/// 파일 주소:  https://alimipro.com/favicon.ico
/// 저장 위치: 아무데나
/// 파일명: icon.ico
///

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'dart:io';
import 'dart:typed_data';

final String iconFileName = 'icon.ico';
final String imageUrl = 'https://alimipro.com/favicon.ico';

Future<void> main() async {
  // 현재 파일 절대 경로 + 파일명
  print(Platform.script.toFilePath());
  // 현재 파일 절대 경로 (감사합니다. 수영님!!!)
  print(Directory(Platform.script.toFilePath()).parent.path);

  Uint8List downloadBytes = await downloadImage(imageUrl);

  final directoryPath = Directory(Platform.script.toFilePath()).parent.path;
  final fileName = p.join(directoryPath, iconFileName);

  File file = await saveFile(downloadBytes, fileName);
  print('${file.path} 파일이 저장되었습니다.');
}

Future<Uint8List> downloadImage(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}

Future<File> saveFile(Uint8List bytes, String fileName) async {
  final file = File(fileName);
  return await file.writeAsBytes(bytes);
}