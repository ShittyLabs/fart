import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:fart/fart.dart';

Function deepEquals = DeepCollectionEquality().equals;
void main() {
  group('Where', () {
    test('should work for non-empty collection of ints', () {
      // arrange
      final numbersOneThroughFour = Iterable<int>.generate(4).map((n) => n + 1);
      const expected = [2, 4];
      final isEven = (int n) => n % 2 == 0;

      // act
      final actual = numbersOneThroughFour.Where(isEven);

      // assert
      assert(deepEquals(actual, expected));
    });
  });
}
