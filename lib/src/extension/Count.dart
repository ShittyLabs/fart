import 'package:fart/fart.dart';
import 'package:fart/src/exception/ArgumentNullException.dart';
import 'package:fart/src/utility/Tuple.dart';

extension CountFart<T> on Iterable<T> {
  int Count() {
    if (this == null) {
      throw ArgumentNullException('`source` cannot be `null`');
    }

    return length;
  }

  int Count1(bool Function(T t) test) {
    if (this == null) {
      throw ArgumentNullException('`source` cannot be `null`');
    }

    if (test == null) {
      throw ArgumentNullException('`predicate` cannot be `null`');
    }

    var counter = 0;

    for(final item in this) {
      if (test(item)) {
        counter++;
      }
    }

    return counter;
  }
}
