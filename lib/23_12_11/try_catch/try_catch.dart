void main() {
  final numString = '10.5';

  int num = int.parse(numString);

  print(num);
}

// Unhandled exception:
// FormatException: Invalid radix-10 number (at character 1)
// 10.5
// ^
//
// #0      int._handleFormatError (dart:core-patch/integers_patch.dart:126:5)
// #1      int._parseRadix (dart:core-patch/integers_patch.dart:137:16)
// #2      int._parse (dart:core-patch/integers_patch.dart:98:12)
// #3      int.parse (dart:core-patch/integers_patch.dart:60:12)
// #4      main (package:src/23_12_11/try_catch/try_catch.dart:4:17)
// #5      _delayEntrypointInvocation.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:297:19)
// #6      _RawReceivePort._handleMessage (dart:isolate-patch/isolate_patch.dart:184:12)
