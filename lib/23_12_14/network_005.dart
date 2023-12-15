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


final String directoryPath =
    Directory(Platform.script.toFilePath()).parent.path;


Future<void> main() async {
  await sequentialDownload();
  print('-----------------------------------------------\n');
  await parallelDownload();
}


Future<void> sequentialDownload() async {
  print('[순차001] 다운로드 시작');
  int fileSize = 0;
  Stopwatch stopwatch = Stopwatch()..start();

  for (int i = 0; i < imageUrlList.length; i++) {
    final String fileName = p.join(directoryPath, iconFileNameList[i]);
    final Uint8List downloadBytes = await downloadImage(imageUrlList[i]);
    final File file = await saveFile(downloadBytes, fileName);
    fileSize += await file.length();
  }

  print('[순차001] 다운로드 끝');
  print('[순차001] 총 소요시간 : ${stopwatch.elapsed}');
  print('[순차001] 용량 : ${fileSize}bytes');
  print('=========\n');

  fileSize = 0;
  print('[순차002] 다운로드 시작');

  stopwatch = Stopwatch()..start();

  final List<Uint8List> downloadByteList = [
    await downloadImage(imageUrlList[0]),
    await downloadImage(imageUrlList[1]),
    await downloadImage(imageUrlList[2]),
  ];

  for(int i = 0; i < downloadByteList.length; i++) {
    final File file = await saveFile(downloadByteList[i], '$directoryPath/SequentialImage$i.png');
    print('[순차002] 용량 : ${await file.length()}bytes');
    fileSize += await file.length();
  }

  print('[순차002] 다운로드 끝');
  print('[순차002] 총 소요시간 : ${stopwatch.elapsed}');
  print('[순차002] 용량 : ${fileSize}bytes');
}


Future<void> parallelDownload() async {
  print('[병렬001] 다운로드 시작');
  Stopwatch stopwatch = Stopwatch()..start();

  List<Future<Uint8List>> futureJobList = List.generate(imageUrlList.length, (i) => downloadImage(imageUrlList[i]));
  List<Uint8List> bytesList = await futureJobList.wait;

  List<Future<File>> futureFileList = List.generate(bytesList.length, (i) => saveFile(bytesList[i], '$directoryPath/ParallelImage${i + 1}.png'));
  List<File> fileList = await futureFileList.wait;

  List<Future<int>> futureFileSizeList = List.generate(fileList.length, (i) => fileList[i].length());
  List<int> fileSizeList = await futureFileSizeList.wait;

  for (final fileSize in fileSizeList) {
    print('[병렬] 용량 : ${fileSize}bytes');
  }
  print('[병렬001] 다운로드 끝');
  print('[병렬001] 총 소요시간 : ${stopwatch.elapsed}');
  print('=========\n');


  print('[병렬002] 다운로드 시작');
  stopwatch = Stopwatch()..start();
  List<Future<File>> saveFiles = [
    checkDownloadImage(imageUrlList[0], iconFileNameList[0]),
    checkDownloadImage(imageUrlList[1], iconFileNameList[1]),
    checkDownloadImage(imageUrlList[2], iconFileNameList[1]),
  ];
  await saveFiles.wait;
  print('[병렬002] 다운로드 끝');
  print('[병렬002] 총 소요시간 : ${stopwatch.elapsed}');
}


Future<Uint8List> downloadImage(String url) async {
  final http.Response response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}


Future<File> checkDownloadImage(String url, String fileName) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return File(fileName).writeAsBytes(response.bodyBytes);
  } else {
    throw Exception('Failed to load File Information');
  }
}


Future<File> saveFile(Uint8List bytes, String fileName) async {
  final file = File(fileName).writeAsBytes(bytes);
  return file;
}
