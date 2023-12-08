import 'dart:io';

import 'package:intl/intl.dart';

import 'book.dart';

void main() {
  var datetime01 = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var datetime02 =
      DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 1)));
  Book book001 = Book(title: 'flower01', publishDate: datetime02, comment: "1");
  Book book002 = Book(title: 'flower01', publishDate: datetime02, comment: "2");
  Book book003 = Book(
      title: 'flower01',
      publishDate: DateFormat('yyyy-MM-dd')
          .format(DateTime.now().add(Duration(days: 2))),
      comment: "3");
  Book book004 = Book(
      title: 'flower02',
      publishDate: DateFormat('yyyy-MM-dd')
          .format(DateTime.now().add(Duration(days: 3))),
      comment: "4");
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
  // book002, book005, book007, book008이 삭제된다.
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
