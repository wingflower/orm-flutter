import 'package:intl/intl.dart';

///
/// 제목과 출간일이 같으면 같은 책으로 판단한다. 또한 Set 에 넣으면 동일 객체로 판단한다.
/// Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 오래된 순서대로 정렬한다.
/// deep copy 를 지원한다
///

class Book implements Comparable<Book> {
  final String title;

  // DateTime publishDate = DateTime.now();
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
          DateFormat('yyyy-MM-dd').format(publishDate) ==
              DateFormat('yyyy-MM-dd').format(other.publishDate);

  @override
  int get hashCode =>
      title.hashCode ^ DateFormat('yyyy-MM-dd').format(publishDate).hashCode;

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
