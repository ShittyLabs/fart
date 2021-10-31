import 'package:fart/src/exception/ArgumentNullException.dart';
import 'package:test/test.dart';
import 'package:fart/fart.dart';

void main() {
  group('All', () {
    group('Success Scenarios', () {
      test('should work for non-empty collection of ints', () {
        // arrange
        final numbersOneThroughFour =
            Iterable<int>.generate(4).map((n) => n + 1);
        final isEven = (int n) => n % 2 == 0;
        final isLowNumber = (int n) => n < 100;

        // act
        final actualEven = numbersOneThroughFour.All(isEven);
        final actualHigh = numbersOneThroughFour.All(isLowNumber);

        // assert
        expect(actualEven, false);
        expect(actualHigh, true);
      });

      test('empty list should always be true', () {
        // arrange
        const noFruits = [];
        final alwaysTrue = (fruit) => true;

        // act

        final actual = noFruits.All((_) => false);

        // assert
        expect(actual, true);
      });
    });

    group('Error Scenarios', () {
      test('should throw an `ArgumentNullException` if the `source` is `null`',
          () {
        // arrange
        const List<int> input = null;

        // act
        // assert
        expect(() => input.All((t) => true),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test(
          'should throw an `ArgumentNullException` if the `predicate` is `null`',
          () {
        // arrange
        const input = <int>[1, 2, 3, 4, 5];

        // act
        // assert
        expect(() => input.All(null),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });
    });
  });
}
