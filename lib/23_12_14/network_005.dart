import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'dart:io';
import 'dart:typed_data';

final List<String> iconFileNameList = [
  'Ansible_Logo.png',
  'HashiCorp_Logo_no_text.png',
  '2109px-Kubernetes_logo_without_workmark.svg.png',
];

final List<String> imageUrlList = [
  'https://upload.wikimedia.org/wikipedia/commons/0/05/Ansible_Logo.png',
  'https://upload.wikimedia.org/wikipedia/commons/8/80/HashiCorp_Logo_no_text.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Kubernetes_logo_without_workmark.svg/2109px-Kubernetes_logo_without_workmark.svg.png',
];

Future<void> main() async {
  print('다운로드 시작');
  int fileSize = 0;
  final Stopwatch stopwatch = Stopwatch()..start();

  for (int i = 0; i < imageUrlList.length; i++) {
    final String directoryPath =
        Directory(Platform.script.toFilePath()).parent.path;
    final String fileName = p.join(directoryPath, iconFileNameList[i]);

    final Uint8List downloadBytes = await downloadImage(imageUrlList[i]);
    final File file = await saveFile(downloadBytes, fileName);
    fileSize += await file.length();
  }

  print('다운로드 끝');
  print('=========');
  print('소요시간 : ${stopwatch.elapsed}');
  print('용량 : ${fileSize}bytes');
}

Future<Uint8List> downloadImage(String url) async {
  final http.Response response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}

Future<File> saveFile(Uint8List bytes, String fileName) async {
  final file = File(fileName).writeAsBytes(bytes);
  return file;
}
