import 'package:flutter/foundation.dart';
import 'package:penta_core/src/models/error/index.dart';

/// Response model
@immutable
sealed class ResponseModel<T> {
  /// Response model constructor
  const ResponseModel();

  /// Returns `true` if the response is `success`
  /// <br>otherwise `false`
  bool get isSuccess => this is ResponseModelSuccess<T>;

  /// Returns `true` if the response is `fail`
  /// <br>otherwise `false`
  bool get isFail => this is ResponseModelFail<T>;

  /// cast to [ResponseModelSuccess]
  ResponseModelSuccess<T> get asSuccess => this as ResponseModelSuccess<T>;

  /// cast to [ResponseModelFail]
  ResponseModelFail<T> get asFail => this as ResponseModelFail<T>;

  /// fold the response
  T? fold({
    void Function(T data)? onSuccess,
    void Function(ResponseModelFail<T> fail)? onFail,
  }) {
    if (isSuccess) {
      onSuccess?.call(asSuccess.data);
      return asSuccess.data;
    } else {
      onFail?.call(asFail);
      return null;
    }
  }

  X maybeWhen<X>({
    required X Function() orElse,
    X Function(T data)? onSuccess,
    X Function(ResponseModelFail<T> fail)? onFail,
  }) {
    if (isSuccess) {
      return onSuccess?.call(asSuccess.data) ?? orElse();
    } else {
      return onFail?.call(asFail) ?? orElse();
    }
  }

  X when<X>({
    required X Function(T data) onSuccess,
    required X Function(ResponseModelFail<T> fail) onFail,
  }) {
    if (isSuccess) {
      return onSuccess(asSuccess.data);
    } else {
      return onFail(asFail);
    }
  }

  X? whenOrNull<X>({
    X Function(T data)? onSuccess,
    X Function(ResponseModelFail<T> fail)? onFail,
  }) {
    if (isSuccess) {
      return onSuccess?.call(asSuccess.data);
    } else {
      return onFail?.call(asFail);
    }
  }
}

/// Response model success
class ResponseModelSuccess<T> extends ResponseModel<T> {
  /// Response model success constructor
  const ResponseModelSuccess({
    required this.data,
  });

  /// Data for success response
  final T data;
}

/// Response model fail
class ResponseModelFail<T> extends ResponseModel<T> {
  /// Response model fail constructor
  const ResponseModelFail({
    required this.error,
  });

  /// Error for fail response
  final ErrorModel error;
}

/// Extension for [ResponseModel]
extension ResponseModelExtension<T> on ResponseModel<T> {
  T? fold({
    T Function(T data)? onSuccess,
    void Function(ResponseModelFail<T> fail)? onFail,
  }) {
    if (isSuccess) {
      return onSuccess?.call(asSuccess.data);
    } else {
      onFail?.call(asFail);
      return null;
    }
  }
}

/// Extension for [ResponseModelFail]
extension ResponseModelFailExtension<T> on ResponseModelFail<T> {
  /// cast to [ResponseModelFail]
  /// <br/>Example: `response.asFail.castTo<YourType>()`
  ResponseModelFail<X> castTo<X>() => ResponseModelFail<X>(error: error);
}
