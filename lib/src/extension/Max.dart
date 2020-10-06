extension MaxFart<T> on Iterable<T> {
  Iterable<T> Max(Iterable<T> iterable) {

    var max = iterable == null || iterable.isEmpty ? null : iterable.first;
    for (final item in this) {
      if (item > max) {
          max = item;
      }
    }
    return max;
  }
}
