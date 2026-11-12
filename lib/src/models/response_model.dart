import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:penta_core/src/models/error_model.dart';

/// Result of an operation: either [ResponseModelSuccess] or
/// [ResponseModelFail].
///
/// Being `sealed`, it works with exhaustive `switch`:
///
/// ```dart
/// switch (response) {
///   ResponseModelSuccess(:final data) => print(data),
///   ResponseModelFail(:final error) => print(error.message),
/// }
/// ```
@immutable
sealed class ResponseModel<T> {
  const ResponseModel();

  /// Successful response holding [data].
  factory ResponseModel.success(T data) => ResponseModelSuccess<T>(data: data);

  /// Failed response holding [error].
  factory ResponseModel.fail(ErrorModel error) =>
      ResponseModelFail<T>(error: error);

  /// Runs [body] and wraps the result. Thrown errors become a
  /// [ResponseModelFail] built by [onError] (or [ErrorModel.fromException]).
  static Future<ResponseModel<T>> guard<T>(
    FutureOr<T> Function() body, {
    ErrorModel Function(Object error, StackTrace stackTrace)? onError,
  }) async {
    try {
      return ResponseModelSuccess<T>(data: await body());
    } on Object catch (error, stackTrace) {
      return ResponseModelFail<T>(
        error:
            onError?.call(error, stackTrace) ??
            ErrorModel.fromException(error, stackTrace),
      );
    }
  }

  bool get isSuccess => this is ResponseModelSuccess<T>;
  bool get isFail => this is ResponseModelFail<T>;

  /// Casts to [ResponseModelSuccess]. Throws when the response failed.
  ResponseModelSuccess<T> get asSuccess => this as ResponseModelSuccess<T>;

  /// Casts to [ResponseModelFail]. Throws when the response succeeded.
  ResponseModelFail<T> get asFail => this as ResponseModelFail<T>;

  /// Data on success, otherwise `null`.
  T? get dataOrNull => switch (this) {
    ResponseModelSuccess(:final data) => data,
    ResponseModelFail() => null,
  };

  /// Error on failure, otherwise `null`.
  ErrorModel? get errorOrNull => switch (this) {
    ResponseModelSuccess() => null,
    ResponseModelFail(:final error) => error,
  };

  /// Calls the matching side-effect callback and returns [dataOrNull].
  T? fold({
    void Function(T data)? onSuccess,
    void Function(ResponseModelFail<T> fail)? onFail,
  }) {
    switch (this) {
      case ResponseModelSuccess(:final data):
        onSuccess?.call(data);
        return data;
      case final ResponseModelFail<T> fail:
        onFail?.call(fail);
        return null;
    }
  }

  X when<X>({
    required X Function(T data) onSuccess,
    required X Function(ResponseModelFail<T> fail) onFail,
  }) => switch (this) {
    ResponseModelSuccess(:final data) => onSuccess(data),
    final ResponseModelFail<T> fail => onFail(fail),
  };

  X maybeWhen<X>({
    required X Function() orElse,
    X Function(T data)? onSuccess,
    X Function(ResponseModelFail<T> fail)? onFail,
  }) => switch (this) {
    ResponseModelSuccess(:final data) =>
      onSuccess != null ? onSuccess(data) : orElse(),
    final ResponseModelFail<T> fail => onFail != null ? onFail(fail) : orElse(),
  };

  X? whenOrNull<X>({
    X Function(T data)? onSuccess,
    X Function(ResponseModelFail<T> fail)? onFail,
  }) => switch (this) {
    ResponseModelSuccess(:final data) => onSuccess?.call(data),
    final ResponseModelFail<T> fail => onFail?.call(fail),
  };

  /// Transforms the success data, keeping failures as they are.
  ResponseModel<R> map<R>(R Function(T data) transform) => switch (this) {
    ResponseModelSuccess(:final data) => ResponseModelSuccess<R>(
      data: transform(data),
    ),
    ResponseModelFail(:final error) => ResponseModelFail<R>(error: error),
  };

  /// Chains another operation that returns a [ResponseModel].
  Future<ResponseModel<R>> then<R>(
    FutureOr<ResponseModel<R>> Function(T data) next,
  ) async => switch (this) {
    ResponseModelSuccess(:final data) => await next(data),
    ResponseModelFail(:final error) => ResponseModelFail<R>(error: error),
  };
}

final class ResponseModelSuccess<T> extends ResponseModel<T> {
  const ResponseModelSuccess({required this.data});

  final T data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponseModelSuccess<T> && other.data == data;

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'ResponseModelSuccess<$T>($data)';
}

final class ResponseModelFail<T> extends ResponseModel<T> {
  const ResponseModelFail({required this.error});

  final ErrorModel error;

  /// Same error with a different data type.
  /// Example: `response.asFail.castTo<OtherType>()`.
  ResponseModelFail<X> castTo<X>() => ResponseModelFail<X>(error: error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponseModelFail<T> && other.error == error;

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => 'ResponseModelFail<$T>($error)';
}
