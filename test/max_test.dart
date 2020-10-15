import 'package:fart/src/exception/ArgumentNullException.dart';
import 'package:fart/src/exception/InvalidOperationException.dart';
import 'package:test/test.dart';
import 'package:fart/fart.dart';

void main() {
  group('Max', () {
    group('Success Scenarios', () {
      test('should work for non-empty collection of ints', () {
        // arrange
        final numbersOneThroughFour =
            Iterable<int>.generate(4).map((n) => n + 1);
        const expected = 4;

        // act
        final actual = numbersOneThroughFour.Max();

        // assert
        expect(actual, expected);
      });

      test('should return the largest value in the sequence', () {
        // arrange
        const doubles = [1.5E+104, 9E+103, -2E+103];
        const expected = 1.5E+104;

        // act
        final actual = doubles.Max();

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
        expect(
            () => input.Max(), throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test(
          'should throw an `InvalidOperationException` if the `source` is is empty',
          () {
        // arrange
        final input = <int>[];

        // act
        // assert
        expect(() => input.Max(),
            throwsA(TypeMatcher<InvalidOperationException>()));
      });
    });
  });

  group('Max1', () {
    group('Success Scenarios', () {
      test('should return the longest pet age and name length', () {
        // arrange
        final pets = [Pet('Barley', 8), Pet('Boots', 4), Pet('Whiskers', 1)];
        final agePlusNameLength = (Pet pet) => pet.age + pet.name.length;
        const expected = 14;

        // act
        final actual = pets.Max1(agePlusNameLength);

        // arrange
        expect(actual, expected);
      });
    });

    group('Error Scenarios', () {
      test('should throw an `ArgumentNullException` if the `source` is `null`',
          () {
        // arrange
        final List<String> input = null;

        // act
        // assert
        expect(() => input.Max1((s) => s.length),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test(
          'should throw an `ArgumentNullException` if the `selector` is `null`',
          () {
        // arrange
        final input = ['hello', 'world'];

        // act
        // assert
        expect(() => input.Max1(null),
            throwsA(TypeMatcher<ArgumentNullException>()));
      });

      test(
          'should throw an `InvalidOperationException` if the `source` is is empty',
          () {
        // arrange
        final input = <String>[];

        // act
        // assert
        expect(() => input.Max1((s) => s.length),
            throwsA(TypeMatcher<InvalidOperationException>()));
      });
    });
  });
}

class Pet {
  final String name;
  final int age;

  Pet(this.name, this.age);
}
