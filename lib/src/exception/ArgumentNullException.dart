class ArgumentNullException implements Exception {
  final String message;
  final Error error;

  ArgumentNullException(this.message, [this.error]);

  @override
  String toString() {
    return 'ArgumentNullException: $message${error == null ? "" : ", $error"}';
  }
}
