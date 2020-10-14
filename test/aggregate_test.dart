import 'package:fart/src/exception/ArgumentNullException.dart';
import 'package:fart/src/exception/InvalidOperationException.dart';
import 'package:test/test.dart';
import 'package:fart/fart.dart';

void main() {
  group('Aggregate', () {
    group('Success Scenerios', () {
      test('should count the number of even integers in the list', () {
        // arrange
        final ints = [4, 8, 8, 3, 9, 0, 7, 8, 2];
        final seed = 0;
        final expected = 6;

        // act
        final actual = ints.Aggregate<int>(
            seed, (total, next) => next % 2 == 0 ? total + 1 : total);

        // assert
        expect(actual, equals(expected));
      });

      test('should sum a list of numbers', () {
        // arrange
        final input = [1, 2, 3, 4];
        final seed = 0;
        final expected = 10;

        // act
        final actual = input.Aggregate<int>(seed, (a, b) => a + b);

        // assert
        expect(actual, equals(expected));
      });

      test('should return the seed value if the input array is empty', () {
        // arrange
        final input = <int>[];
        final seed = 0;
        final expected = seed;

        // act
        final actual = input.Aggregate<int>(seed, (a, b) => a + b);

        // assert
        expect(actual, equals(expected));
      });
    });

    group('Error Scenerios', () {
      test('should throw an `ArgumentNullException` if the `source` is `null`',
          () {
        // arrange
        final List<int> input = null;

        // act
        // assert
        expect(() => input.Aggregate(0, (a, b) => a + b),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test('should throw an `ArgumentNullException` if the `func` is `null`',
          () {
        // arrange
        final input = [1, 2, 3, 4];

        // act
        // assert
        expect(() => input.Aggregate(0, null),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });
    });
  });

  group('Aggregate2', () {
    group('Success Scenerios', () {
      test('should find and return the longest fruit name as uppercased', () {
        // arrange
        final fruits = ['apple', 'mango', 'orange', 'passionfruit', 'grape'];
        final seed = 'banana';
        final longestName = (String longest, String next) =>
            next.length > longest.length ? next : longest;
        final toUpperCase = (String fruit) => fruit.toUpperCase();
        final expected = 'PASSIONFRUIT';

        // act
        final actual = fruits.Aggregate2(seed, longestName, toUpperCase);

        // assert
        expect(actual, equals(expected));
      });

      test('should sum a list of numbers and increment the result', () {
        // arrange
        final input = [1, 2, 3, 4];
        final expected = 11;

        // act
        final actual =
            input.Aggregate2<int, int>(0, (a, b) => a + b, (x) => x + 1);

        // arrange
        expect(actual, equals(expected));
      });

      test(
          'should apply the result selector to the seed if the input array is empty',
          () {
        // arrange
        final input = <int>[];
        final expected = 1;

        // act
        final actual =
            input.Aggregate2(0, (int a, int b) => a + b, (int x) => x + 1);

        // assert
        expect(actual, equals(expected));
      });
    });

    group('Error Scenerios', () {
      test('should throw an `ArgumentNullException` if the `source` is `null`',
          () {
        // arrange
        final List<int> input = null;

        // act
        // assert
        expect(() => input.Aggregate2(0, (a, b) => a + b, (x) => x + 1),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test('should throw an `ArgumentNullException` if the `func` is `null`',
          () {
        // arrange
        final input = [1, 2, 3, 4];

        // act
        // assert
        expect(() => input.Aggregate2(0, null, (x) => x + 1),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test(
          'should throw an `ArgumentNullException` if the `resultSelector` is `null`',
          () {
        // arrange
        final input = [1, 2, 3, 4];

        // act
        // assert
        expect(() => input.Aggregate2(0, (a, b) => a + b, null),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });
    });
  });

  group('Aggregate1', () {
    group('Success Scenerios', () {
      test('should reverse the sentence word order', () {
        // arrange
        final sentence = 'the quick brown fox jumps over the lazy dog';
        final words = sentence.split(' ');
        final reverse = (String workingSentence, String next) =>
            next + ' ' + workingSentence;
        final expected = 'dog lazy the over jumps fox brown quick the';

        // act
        final actual = words.Aggregate1(reverse);

        // arrange
        expect(actual, equals(expected));
      });

      test('should sum a list of numbers', () {
        // arrange
        final input = [1, 2, 3, 4];
        final expected = 10;

        // act
        final actual = input.Aggregate1((a, b) => a + b);

        // arrange
        expect(actual, equals(expected));
      });
    });

    group('Error Scenerios', () {
      test('should throw an `ArgumentNullException` if the `source` is `null`',
          () {
        // arrange
        final List<int> input = null;

        // act
        // assert
        expect(() => input.Aggregate1((a, b) => a + b),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test('should throw an `ArgumentNullException` if the `func` is `null`',
          () {
        // arrange
        final input = [1, 2, 3, 4];

        // act
        // assert
        expect(() => input.Aggregate1(null),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test('should throw `InvalidOperationException` if `source` is empty', () {
        // arrange
        final input = <int>[];

        // act
        // arrange
        expect(() => input.Aggregate1((a, b) => a + b),
            throwsA(TypeMatcher<InvalidOperationException>()));
      });
    });
  });
}
