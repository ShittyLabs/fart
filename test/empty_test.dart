import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:fart/fart.dart';

void main() {
  group('Where', () {
    test('should work for non-empty collection of ints', () {
      // arrange
      const expectedLength = 0;

      // act
      final actual = Fart.Empty();

      // assert
      assert(actual.length == expectedLength);
    });
  });
}
