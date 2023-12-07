import 'dart:io';

///
/// 제목과 출간일이 같으면 같은 책으로 판단한다. 또한 Set 에 넣으면 동일 객체로 판단한다.
/// Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 오래된 순서대로 정렬한다.
/// deep copy 를 지원한다
///

class Book implements Comparable<Book> {
  String title;
  DateTime publishDate = DateTime.now();
  String comment;

  Book({
    required this.title,
    required this.publishDate,
    required this.comment,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate == other.publishDate;

  @override
  int compareTo(Book other) {
    // TODO: implement compareTo
    return publishDate.compareTo(other.publishDate);
  }

  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment,
  }) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      comment: comment ?? this.comment,
    );
  }

  @override
  String toString() {
    return 'Book{title: $title publishDate: $publishDate comment: $comment}';
    // return 'Book{title: $title publishDate: $publishDate}';
    // return 'Book{title: $title}';
  }
}

void main() {
  var datetime01 = DateTime.now();
  sleep(Duration(seconds: 1));
  var datetime02 = DateTime.now();
  Book book001 = Book(title: 'flower01', publishDate: datetime02, comment: "1");
  Book book002 = Book(title: 'flower01', publishDate: datetime02, comment: "2");
  sleep(Duration(seconds: 1));
  Book book003 =
      Book(title: 'flower01', publishDate: DateTime.now(), comment: "3");
  sleep(Duration(seconds: 1));
  Book book004 =
      Book(title: 'flower02', publishDate: DateTime.now(), comment: "4");
  Book book005 = book004.copyWith();
  Book book006 = Book(title: 'flower03', publishDate: datetime01, comment: "5");
  Book book007 = book003;
  Book book008 = book006;
  List<Book> bookList = [
    book001,
    book002,
    book003,
    book004,
    book005,
    book006,
    book007,
    book008,
  ];
  Set<Book> bookSet = {
    book001,
    book002,
    book003,
    book004,
    book005,
    book006,
    book007,
    book008,
  };

  // book005는 깊은 복사가 되어 set에서 중복 삭제가 되지 않는다.
  // book007과 book008이 삭제된다.
  print('bookList의 Book의 수는 [ ${bookList.length} ] 입니다.');
  print('bookSet의 Book의 수는 [ ${bookSet.length} ] 입니다.');
  bookSet.forEach(print);
  print('');
  print('book001과 book002는 같은 책 입니다. [ ${book001 == book002} ]');
  print('book001과 book003는 같은 책 입니다. [ ${book001 == book003} ]');
  print('book001과 book004는 같은 책 입니다. [ ${book001 == book004} ]');
  // 깊은 복사가 된 book005는 제목과 출간일이 같기 때문에 같은 책으로 판단된다.
  print('book005는 book004를 복사하였습니다. [ ${book004 == book005} ]');
  print('');
  // 출간일이 오래된 순서대로 정렬한다.
  print('정렬 전');
  bookList.forEach((e) => print(e.publishDate));
  bookList.sort();
  print('정렬 후');
  bookList.forEach((e) => print(e.publishDate));
}
