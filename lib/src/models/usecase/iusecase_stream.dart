import 'package:penta_core/src/models/index.dart';

abstract interface class IUseCaseStream<T> {
  Stream<ResponseModel<T>> execute();
}
