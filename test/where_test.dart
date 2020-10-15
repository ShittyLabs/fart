import 'package:fart/src/exception/ArgumentNullException.dart';
import 'package:test/test.dart';
import 'package:fart/fart.dart';

void main() {
  group('Where', () {
    group('Success Scenarios', () {
      test('should work for non-empty collection of ints', () {
        // arrange
        final numbersOneThroughFour =
            Iterable<int>.generate(4).map((n) => n + 1);
        const expected = [2, 4];
        final isEven = (int n) => n % 2 == 0;

        // act
        final actual = numbersOneThroughFour.Where(isEven);

        // assert
        expect(actual, expected);
      });

      test('should return a list of fruit with less than 6 characters', () {
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
        const expected = ['apple', 'mango', 'grape'];

        // act
        final actual = fruits.Where(isLessThan6Characters);

        // assert
        expect(actual, expected);
      });
    });

    group('Error Scenarios', () {
      test('should throw an `ArgumentNullException` if the `source` is `null`',
          () {
        // arrange
        const List<int> input = null;

        // act
        // assert
        expect(() => input.Where((t) => true),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test(
          'should throw an `ArgumentNullException` if the `predicate` is `null`',
          () {
        // arrange
        const input = <int>[1, 2, 3, 4, 5];

        // act
        // assert
        expect(() => input.Where(null),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });
    });
  });

  group('Where1', () {
    group('Success Scenarios', () {
      test('should return numbers less than or equal to 10x their index', () {
        // arrange
        const numbers = [0, 30, 20, 15, 90, 85, 40, 75];
        final isLessThanOrEqualTo10xIndex =
            (int number, int index) => number <= index * 10;
        const expected = [0, 20, 15, 40];

        // act
        final actual = numbers.Where1(isLessThanOrEqualTo10xIndex);

        // assert
        expect(actual, expected);
      });
    });

    group('Error Scenarios', () {
      test('should throw an `ArgumentNullException` if the `source` is `null`',
          () {
        // arrange
        final List<int> input = null;

        // act
        // assert
        expect(() => input.Where1((t, index) => true),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test(
          'should throw an `ArgumentNullException` if the `predicate` is `null`',
          () {
        // arrange
        final input = <int>[1, 2, 3, 4, 5];

        // act
        // assert
        expect(() => input.Where1(null),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });
    });
  });
}
