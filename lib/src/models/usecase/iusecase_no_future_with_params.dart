import 'package:penta_core/src/models/index.dart';

abstract interface class IUseCaseNoFutureWithParams<T, Params> {
  ResponseModel<T> execute(Params params);
}
