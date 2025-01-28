class ErrorModel {
  const ErrorModel({
    required this.message,
    this.throwMessage,
  });

  /// Message for error
  final String message;

  /// Error message for throw (developer message)
  final String? throwMessage;
}
