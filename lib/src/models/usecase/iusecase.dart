import 'package:penta_core/src/models/index.dart';

abstract interface class IUseCase<T> {
  Future<ResponseModel<T>> execute();
}
