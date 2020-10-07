extension ReverseFart<T> on Iterable<T> {
  Iterable<T> Reverse() {
    var reversed = Iterable<T>.empty();

    for (final elem in this) {
      reversed = [elem, ...reversed];
    }

    return reversed;
  }
}
