extension AggregateFart<TSource> on Iterable<TSource> {
  TResult Aggregate<TAccumulate, TResult>(
      TAccumulate Function(TAccumulate, TSource) func,
      {TAccumulate seed,
      TResult Function(TAccumulate) resultSelector}) {
    resultSelector ??= (id) => id as TResult;

    var iterable = this;
    if (seed == null) {
      seed = first as TAccumulate;
      iterable = skip(1);
    }

    for (final element in iterable) {
      seed = func(seed, element);
    }

    return resultSelector(seed);
  }
}
