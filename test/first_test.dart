import 'package:fart/src/exception/ArgumentNullException.dart';
import 'package:fart/src/exception/InvalidOperationException.dart';
import 'package:test/test.dart';
import 'package:fart/fart.dart';

void main() {
  group('First', () {
    group('Success Scenarios', () {
      test('should work for non-empty collection of ints', () {
        // arrange
        final numbersOneThroughFour =
            Iterable<int>.generate(4).map((n) => n + 1);
        final isEven = (int n) => n % 2 == 0;

        // act
        final actual = numbersOneThroughFour.First();
        final actualEven = numbersOneThroughFour.First1(isEven);

        // assert
        expect(actual, 1);
        expect(actualEven, 2);
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
        final actual = fruits.First1(isLessThan6Characters);

        // assert
        expect(actual, 'apple');
      });
    });

    group('Error Scenarios', () {
      test('should throw an `ArgumentNullException` if the `source` is `null`',
          () {
        // arrange
        const List<int> input = null;

        // act
        // assert
        expect(
            () => input.First(), throwsA(TypeMatcher<ArgumentNullException>()));
        expect(() => input.First1((t) => true),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test(
          'should throw an `ArgumentNullException` if the `predicate` is `null`',
          () {
        // arrange
        const input = <int>[1, 2, 3, 4, 5];

        // act
        // assert
        expect(() => input.First1(null),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test('empty list should always throw InvalidOperationException', () {
        // arrange
        const noFruits = [];
        final alwaysTrue = (fruit) => true;

        // act

        // assert
        expect(() => noFruits.First(),
            throwsA(TypeMatcher<InvalidOperationException>()));
        expect(() => noFruits.First1(alwaysTrue),
            throwsA(TypeMatcher<InvalidOperationException>()));
      });

      test('not matching anything should result in InvalidOperationException',
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
        final alwaysFalse = (fruit) => false;

        // act
        expect(() => fruits.First1(alwaysFalse),
            throwsA(TypeMatcher<InvalidOperationException>()));
      });
    });
  });
}
