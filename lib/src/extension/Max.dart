extension MaxFart<T> on Iterable<T> {
  T Max() {
  var max =  (this?.isEmpty ?? true) ? null : this.first;
    for (final item in this) {
      if (item > max) {
          max = item;
      }
    }
    return max;
  }
}
