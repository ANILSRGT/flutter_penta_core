import 'ipenta_response_model.dart';

class PentaBaseError<T> implements IPentaErrorModel<T> {
  PentaBaseError({required this.message, this.statusCode});

  @override
  T message;

  @override
  int? statusCode;
}
