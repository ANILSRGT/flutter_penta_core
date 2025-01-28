import 'package:penta_core/src/models/index.dart';

abstract interface class IUseCaseWithParams<T, Params> {
  Future<ResponseModel<T>> execute(Params params);
}
