import 'package:penta_core/src/models/index.dart';

abstract interface class IUseCaseStreamWithParams<T, Params> {
  Stream<ResponseModel<T>> execute(Params params);
}
