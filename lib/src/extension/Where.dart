extension WhereFart<T> on Iterable<T> {
  Iterable<T> Where(bool Function(T t) test) {
    var matches = Iterable<T>.empty();
    for (final t in this) {
      if (test(t)) {
        matches = [...matches, t];
      }
    }
    return matches;
  }
}
