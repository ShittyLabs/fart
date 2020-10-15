import 'package:fart/fart.dart';
import 'package:fart/src/exception/ArgumentNullException.dart';
import 'package:fart/src/exception/InvalidOperationException.dart';

extension MaxFart<TSource extends num> on Iterable<TSource> {
  TSource Max() => Max1<TSource>((number) => number);
}

extension MaxFart1<TSource> on Iterable<TSource> {
  TResult Max1<TResult extends num>(TResult Function(TSource) selector) {
    if (this == null) {
      throw ArgumentNullException('`source` cannot be `null`');
    }

    if (selector == null) {
      throw ArgumentNullException('`selector` cannot be `null`');
    }

    if (isEmpty) {
      throw InvalidOperationException('`souce` cannot be empty');
    }

    final max = (TResult max, TSource next) {
      final value = selector(next);

      return value > max ? value : max;
    };

    return skip(1).Aggregate(selector(first), max);
  }
}
