abstract interface class IPentaErrorModel<T> {
  T message;
  int? statusCode;

  IPentaErrorModel(this.message, this.statusCode);
}

abstract interface class IPentaResponseModel<T> {
  T? data;
  IPentaErrorModel? error;

  IPentaResponseModel(this.data, this.error);
}

class PentaResponseModel<T> implements IPentaResponseModel<T> {
  PentaResponseModel({this.data, this.error}) : assert(data != null || error != null);

  @override
  T? data;

  @override
  IPentaErrorModel? error;
}
