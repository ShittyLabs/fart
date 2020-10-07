extension MaxFart<T> on Iterable<T> {
  T Max() {
  var max =  (iterable?.isEmpty ?? true) ? null : iterable.first;
    for (final item in this) {
      if (item > max) {
          max = item;
      }
    }
    return max;
  }
}
