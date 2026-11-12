import 'package:flutter/foundation.dart';

/// Error carried by a failed `ResponseModel`.
@immutable
class ErrorModel {
  const ErrorModel({
    required this.message,
    this.throwMessage,
    this.code,
    this.error,
    this.stackTrace,
  });

  /// Builds an [ErrorModel] from a caught exception.
  factory ErrorModel.fromException(
    Object error, [
    StackTrace? stackTrace,
    String? message,
  ]) => ErrorModel(
    message: message ?? error.toString(),
    throwMessage: error.toString(),
    error: error,
    stackTrace: stackTrace,
  );

  /// User facing message.
  final String message;

  /// Developer message (logs, crash reports).
  final String? throwMessage;

  /// Optional machine readable code (HTTP status, Firebase code...).
  final String? code;

  /// Original error object, if any.
  final Object? error;

  /// Stack trace of [error], if any.
  final StackTrace? stackTrace;

  ErrorModel copyWith({
    String? message,
    String? throwMessage,
    String? code,
    Object? error,
    StackTrace? stackTrace,
  }) => ErrorModel(
    message: message ?? this.message,
    throwMessage: throwMessage ?? this.throwMessage,
    code: code ?? this.code,
    error: error ?? this.error,
    stackTrace: stackTrace ?? this.stackTrace,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ErrorModel &&
          other.message == message &&
          other.throwMessage == throwMessage &&
          other.code == code &&
          other.error == error;

  @override
  int get hashCode => Object.hash(message, throwMessage, code, error);

  @override
  String toString() =>
      'ErrorModel(message: $message'
      '${code == null ? '' : ', code: $code'}'
      '${throwMessage == null ? '' : ', throwMessage: $throwMessage'})';
}
