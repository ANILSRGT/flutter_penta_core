import 'iresponse_model.dart';

class BaseError<T> implements IErrorModel<T> {
  BaseError({required this.message, this.statusCode});

  @override
  T message;

  @override
  int? statusCode;
}
