abstract interface class IErrorModel<T> {
  T message;
  int? statusCode;

  IErrorModel(this.message, this.statusCode);
}

abstract interface class IResponseModel<T> {
  T? data;
  IErrorModel? error;

  IResponseModel(this.data, this.error);
}

class ResponseModel<T> implements IResponseModel<T> {
  ResponseModel({this.data, this.error}) : assert(data != null || error != null);

  @override
  T? data;

  @override
  IErrorModel? error;
}
