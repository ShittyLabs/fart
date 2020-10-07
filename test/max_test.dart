import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:fart/fart.dart';

void main() {
  group('Max', () {
    test('should work for non-empty collection of ints', () {
      // arrange
      final numbersOneThroughFour = Iterable<int>.generate(4).map((n) => n + 1);

      // act
      final actual = numbersOneThroughFour.Max();

      // assert
      assert(actual == 4);
    });
  });
}
