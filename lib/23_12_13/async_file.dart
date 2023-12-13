import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

///
/// sample.csv 파일을 읽어와서 “한석봉" 이라는 문자열이 있는지 찾고, 있다면 sample_copy.csv 파일에 “김석봉"으로 수정하는 함수를 작성하시오.
/// (async - await 사용할 것)
/// 파일 찾을 수 없는 경우의 예외 처리 적용
///

class Info {
  final String checkName = '한석봉';
  final String modifyName = '김석봉';
  final String filePath =
      '/Users/flower/flower/flutter/lecture/src/lib/23_12_13/';
  final String sourceFile = 'sample.csv';
  final String targetFile = 'sample_copy.csv';
}

void main() async {
  Info info = Info();
  final File source = File(p.join(info.filePath, info.sourceFile));
  final File target = File(p.join(info.filePath, info.targetFile));
  String contents = await readSource(source, info);
  await writeTarget(target, contents);
}

Future<String> readSource(File source, Info info) async {
  String contents;
  try {
    print('--Origin file contents--');
    contents = await source.readAsString();
    print(contents);
    contents = contents.replaceAll(info.checkName, info.modifyName);
    print(contents);
  } on FileSystemException {
    print('파일이 없습니다.');
    contents = '0';
  } catch (e) {
    print('Exception: $e');
    contents = '1';
    // throw 정의해서 에러 발생 시켜보자.
    // rethrow
  }
  return contents;
}

Future<void> writeTarget(File target, String contents) async {
  try {
    File newTarget = await target.writeAsString(contents);
    Stream<String> lines =
        newTarget.openRead().transform(utf8.decoder).transform(LineSplitter());
    print('--New file contents--');
    await for (var line in lines) {
      print(line);
    }
  } catch (e) {
    print('Exception: $e');
  }
}
