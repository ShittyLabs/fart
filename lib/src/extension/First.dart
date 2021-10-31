import 'package:fart/src/exception/ArgumentNullException.dart';
import 'package:fart/src/exception/InvalidOperationException.dart';

extension FirstFart<T> on Iterable<T> {
  T First() {
    if (this == null) {
      throw ArgumentNullException('`source` cannot be `null`');
    }

    if (isEmpty) {
      throw InvalidOperationException('`source` cannot be empty');
    }

    return first;
  }

  T First1(bool Function(T t) test) {
    if (this == null) {
      throw ArgumentNullException('`source` cannot be `null`');
    }

    if (test == null) {
      throw ArgumentNullException('`predicate` cannot be `null`');
    }

    if (isEmpty) {
      throw InvalidOperationException('`source` cannot be empty');
    }

    for (final item in this) {
      if (test(item)) {
        return item;
      }
    }

    throw InvalidOperationException('No matching elements found');
  }
}
