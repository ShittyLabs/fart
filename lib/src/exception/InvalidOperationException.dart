class InvalidOperationException implements Exception {
  final String message;
  final Error error;

  InvalidOperationException(this.message, [this.error]);

  @override
  String toString() {
    return 'InvalidOperationException: $message${error == null ? "" : ", $error"}';
  }
}
