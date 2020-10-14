import 'package:fart/src/exception/ArgumentNullException.dart';
import 'package:fart/src/exception/InvalidOperationException.dart';

extension AggregateFart<TSource> on Iterable<TSource> {
  TAccumulate Aggregate<TAccumulate>(
          TAccumulate seed, TAccumulate Function(TAccumulate, TSource) func) =>
      Aggregate2<TAccumulate, TAccumulate>(seed, func, (result) => result);

  TResult Aggregate2<TAccumulate, TResult>(
      TAccumulate seed,
      TAccumulate Function(TAccumulate, TSource) func,
      TResult Function(TAccumulate) resultSelector) {
    if (this == null) {
      throw ArgumentNullException('`source` cannot be `null`');
    }

    if (func == null) {
      throw ArgumentNullException('`func` cannot be `null`');
    }

    if (resultSelector == null) {
      throw ArgumentNullException('`resultSelector` cannot be `null`');
    }

    for (final element in this) {
      seed = func(seed, element);
    }

    return resultSelector(seed);
  }

  TSource Aggregate1(TSource Function(TSource, TSource) func) {
    if (this == null) {
      throw ArgumentNullException('`source` cannot be `null`');
    }

    if (isEmpty) {
      throw InvalidOperationException('`souce` cannot be empty');
    }

    return skip(1).Aggregate(first, func);
  }
}
