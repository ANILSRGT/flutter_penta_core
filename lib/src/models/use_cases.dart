import 'package:penta_core/src/models/response_model.dart';

// Use case contracts.
//
// Naming: `IUseCase[Stream|NoFuture][NoResponse][WithParams]`
// - default:       Future<ResponseModel<T>>
// - Stream:        Stream<ResponseModel<T>>
// - NoFuture:      ResponseModel<T> (synchronous)
// - NoResponse:    raw T instead of ResponseModel<T>
// - WithParams:    execute(Params params)

abstract interface class IUseCase<T> {
  Future<ResponseModel<T>> execute();
}

abstract interface class IUseCaseWithParams<T, Params> {
  Future<ResponseModel<T>> execute(Params params);
}

abstract interface class IUseCaseNoResponse<T> {
  Future<T> execute();
}

abstract interface class IUseCaseNoResponseWithParams<T, Params> {
  Future<T> execute(Params params);
}

abstract interface class IUseCaseNoFuture<T> {
  ResponseModel<T> execute();
}

abstract interface class IUseCaseNoFutureWithParams<T, Params> {
  ResponseModel<T> execute(Params params);
}

abstract interface class IUseCaseNoFutureNoResponse<T> {
  T execute();
}

abstract interface class IUseCaseNoFutureNoResponseWithParams<T, Params> {
  T execute(Params params);
}

abstract interface class IUseCaseStream<T> {
  Stream<ResponseModel<T>> execute();
}

abstract interface class IUseCaseStreamWithParams<T, Params> {
  Stream<ResponseModel<T>> execute(Params params);
}

abstract interface class IUseCaseStreamNoResponse<T> {
  Stream<T> execute();
}

abstract interface class IUseCaseStreamNoResponseWithParams<T, Params> {
  Stream<T> execute(Params params);
}
