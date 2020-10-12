import 'package:test/test.dart';
import 'package:fart/fart.dart';

void main() {
  group('Aggregate', () {
    test('should find and return the longest fruit name as uppercased', () {
      // arrange
      final fruits = ['apple', 'mango', 'orange', 'passionfruit', 'grape'];
      final seed = 'banana';
      final longestName = (String longest, String next) =>
          next.length > longest.length ? next : longest;
      final toUpperCase = (String fruit) => fruit.toUpperCase();
      final expected = 'PASSIONFRUIT';

      // act
      final actual = fruits.Aggregate(longestName,
          seed: seed, resultSelector: toUpperCase);

      // assert
      assert(actual == expected);
    });

    test('should count the number of even integers in the list', () {
      // arrange
      final ints = [4, 8, 8, 3, 9, 0, 7, 8, 2];
      final seed = 0;
      final countEvens =
          (int total, int next) => next % 2 == 0 ? total + 1 : total;
      final expected = 6;

      // act
      final actual = ints.Aggregate<int, int>(countEvens, seed: seed);

      // assert
      assert(actual == expected);
    });

    test('the sentence word order should be reversed', () {
      // arrange
      final sentence = 'the quick brown fox jumps over the lazy dog';
      final words = sentence.split(' ');
      final reverse =
          (String workingSentence, String next) => next + ' ' + workingSentence;
      final expected = 'dog lazy the over jumps fox brown quick the';

      // act
      final actual = words.Aggregate<String, String>(reverse);

      // arrange
      assert(actual == expected);
    });
  });
}
