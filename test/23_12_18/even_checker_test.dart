import 'package:src/23_12_18/unit_class.dart';
import 'package:test/test.dart';

void main() {
  test('짝수 구분을 할 수 있어야 한다.', () {
    IsEven a = IsEven();
    expect(a.isEven(5), false);
    expect(a.isEven(4), true);

    FineMax b = FineMax();
    expect(b.findMax([5, 8, 4, 2, 68, 5, 33]), 68);

    ReverseString c = ReverseString();
    expect(c.reverseString('flower'), 'rewolf');
  });
}
