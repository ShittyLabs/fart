import 'package:fart/fart.dart';
import 'package:fart/src/exception/ArgumentNullException.dart';
import 'package:fart/src/utility/Tuple.dart';

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

    final seed = Tuple(Iterable<T>.empty(), 0);
    final filter = (Tuple<Iterable<T>, int> matchesAndIndex, T next) {
      final matches = matchesAndIndex.item1;
      final index = matchesAndIndex.item2;

      return test(next, index)
          ? Tuple([...matches, next], index + 1)
          : Tuple(matches, index + 1);
    };
    final justMatches = (Tuple<Iterable<T>, int> tuple) => tuple.item1;

    return Aggregate2(seed, filter, justMatches);
  }
}
