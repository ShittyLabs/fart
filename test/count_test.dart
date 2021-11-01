import 'package:fart/src/exception/ArgumentNullException.dart';
import 'package:test/test.dart';
import 'package:fart/fart.dart';

void main() {
  group('Count', () {
    group('Success Scenarios', () {
      test('should work for non-empty collection of ints', () {
        // arrange
        final numbersOneThroughFour =
            Iterable<int>.generate(4).map((n) => n + 1);
        final isEven = (int n) => n % 2 == 0;
        final isHighNumber = (int n) => n > 100;

        // act
        final actual = numbersOneThroughFour.Count();
        final actual1 = numbersOneThroughFour.Count1(isEven);
        final actualHigh = numbersOneThroughFour.Count1(isHighNumber);

        // assert
        expect(actual, 4);
        expect(actual1, 2);
        expect(actualHigh, 0);
      });

      test('should count words with less than six characters',
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
        final actual = fruits.Count1(isLessThan6Characters);

        // assert
        expect(actual, 3);
      });

      test('empty list should always be zero', () {
        // arrange
        const noFruits = [];
        final alwaysTrue = (fruit) => true;

        // act
        final actual = noFruits.Count();

        final actual1 = noFruits.Count1(alwaysTrue);

        // assert
        expect(actual, 0);
        expect(actual1, 0);
      });
    });

    group('Error Scenarios', () {
      test('should throw an `ArgumentNullException` if the `source` is `null`',
          () {
        // arrange
        const List<int> input = null;

        // act
        // assert
        expect(() => input.Count(),
            throwsA(TypeMatcher<ArgumentNullException>()));
        expect(() => input.Count1((t) => true),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test(
          'should throw an `ArgumentNullException` if the `predicate` is `null`',
          () {
        // arrange
        const input = <int>[1, 2, 3, 4, 5];

        // act
        // assert
        expect(() => input.Count1(null),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });
    });
  });
}
