import 'base_error.dart';

class BaseNetworkError<T> extends BaseError<T> {
  BaseNetworkError({required T message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}
