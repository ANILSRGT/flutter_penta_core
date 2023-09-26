import 'penta_base_error.dart';

class PentaBaseNetworkError<T> extends PentaBaseError<T> {
  PentaBaseNetworkError({required T message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}
