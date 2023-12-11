import 'dart:io';

///
/// 파일 복사
/// 원본 파일을 대상 파일에 복사한다.
///

void copy(String source, String target01, String target02) {
  // 파일 인스턴스의 매서드로 복사하기
  final sourceFile = File(source);
  sourceFile.copy(target01);

  // 파일을 읽고 복사하기.
  final targetFile = File(target02);
  final contents = sourceFile.readAsStringSync();
  print(contents);
  targetFile.writeAsStringSync(contents);
}

void main() {
  final path = '/Users/flower/flower/flutter/lecture/src/lib/23_12_11/file/';
  copy('${path}source.txt', '${path}target01.txt', '${path}target02.txt');
}
