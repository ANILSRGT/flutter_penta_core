import 'package:penta_core/src/models/index.dart';

abstract interface class IUseCaseNoFuture<T> {
  ResponseModel<T> execute();
}
