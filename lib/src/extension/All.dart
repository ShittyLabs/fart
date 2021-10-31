import 'package:fart/fart.dart';
import 'package:fart/src/exception/ArgumentNullException.dart';
import 'package:fart/src/utility/Tuple.dart';

extension AllFart<T> on Iterable<T> {
  bool All(bool Function(T t) test) {
    if (this == null) {
      throw ArgumentNullException('`source` cannot be `null`');
    }

    if (test == null) {
      throw ArgumentNullException('`predicate` cannot be `null`');
    }

    for(final item in this) {
      if (!test(item)) {
        return false;
      }
    }

    return true;
  }
}
