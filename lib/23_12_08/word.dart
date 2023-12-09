///
/// i번째 글자가 모음인지 알려주는 isVowel() 함수 구현
/// i번째 글자가 자음인지 알려주는 isConsonant() 함수 구현
///

class Word {
  final Set<String> _vowelList = {'a', 'e', 'i', 'o', 'u'};
  String word = '';

  bool isVowel(int i) {
    if (_vowelList.contains(word[i])) {
      return true;
    }
    return false;
    // return word.substring(1, i + 1) == 'a';
  }

  bool isConsonant(int i) {
    if (_vowelList.contains(word[i])) {
      return false;
    }
    return true;
  }
}
