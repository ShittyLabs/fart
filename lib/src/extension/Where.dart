import 'package:fart/src/exception/ArgumentNullException.dart';

extension WhereFart<T> on Iterable<T> {
  Iterable<T> Where(bool Function(T t) test) {
    if (test == null) {
      throw ArgumentNullException('`predicate` cannot be `null`');
    }

    return Where1((T t, int _) => test(t));
  }

  Iterable<T> Where1(bool Function(T t, int index) test) {
    if (this == null) {
      throw ArgumentNullException('`source` cannot be `null`');
    }

    if (test == null) {
      throw ArgumentNullException('`predicate` cannot be `null`');
    }

    var matches = Iterable<T>.empty();
    var index = 0;
    for (final t in this) {
      if (test(t, index)) {
        matches = [...matches, t];
      }

      index++;
    }
    return matches;
  }
}
