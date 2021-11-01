import 'package:fart/src/exception/ArgumentNullException.dart';
import 'package:test/test.dart';
import 'package:fart/fart.dart';

void main() {
  group('Any', () {
    group('Success Scenarios', () {
      test('should work for non-empty collection of ints', () {
        // arrange
        final numbersOneThroughFour =
            Iterable<int>.generate(4).map((n) => n + 1);
        final isEven = (int n) => n % 2 == 0;
        final isHighNumber = (int n) => n > 100;

        // act
        final actual = numbersOneThroughFour.Any();
        final actual1 = numbersOneThroughFour.Any1(isEven);
        final actualHigh = numbersOneThroughFour.Any1(isHighNumber);

        // assert
        expect(actual, true);
        expect(actual1, true);
        expect(actualHigh, false);
      });

      test('should confirm list contains words with less than five characters',
          () {
        // arrange
        const fruits = [
          'apple',
          'passionfruit',
          'banana',
          'mango',
          'orange',
          'blueberry',
          'grape',
          'strawberry'
        ];
        final isLessThan6Characters = (String fruit) => fruit.length < 6;

        // act
        final actual = fruits.Any1(isLessThan6Characters);

        // assert
        expect(actual, true);
      });

      test('empty list should always be false', () {
        // arrange
        const noFruits = [];
        final alwaysTrue = (fruit) => true;

        // act
        final actual = noFruits.Any();

        final actual1 = noFruits.Any1(alwaysTrue);

        // assert
        expect(actual, false);
        expect(actual1, false);
      });
    });

    group('Error Scenarios', () {
      test('should throw an `ArgumentNullException` if the `source` is `null`',
          () {
        // arrange
        const List<int> input = null;

        // act
        // assert
        expect(() => input.Any(),
            throwsA(TypeMatcher<ArgumentNullException>()));
        expect(() => input.Any1((t) => true),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test(
          'should throw an `ArgumentNullException` if the `predicate` is `null`',
          () {
        // arrange
        const input = <int>[1, 2, 3, 4, 5];

        // act
        // assert
        expect(() => input.Any1(null),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });
    });
  });
}
