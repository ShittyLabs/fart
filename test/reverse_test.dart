import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:fart/fart.dart';

Function deepEquals = DeepCollectionEquality().equals;
void main() {
  group('Reverse', () {
    test('should reverse the collection of chars', () {
      // arrange
      const apple = ['a', 'p', 'p', 'l', 'e'];
      const expected = ['e', 'l', 'p', 'p', 'a'];

      // act
      final actual = apple.Reverse();

      // assert
      assert(deepEquals(actual, expected));
    });
  });
}
