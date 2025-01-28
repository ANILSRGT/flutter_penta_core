import 'package:penta_core/src/utils/connectivity_service.dart';

mixin DataRepoMixin {
  Future<T> executeByDatasource<T>({
    required Future<T> Function() localCallback,
    required Future<T> Function() remoteCallback,
  }) async {
    final hasConnection = await ConnectivityService.isConnected;

    if (hasConnection) {
      return remoteCallback();
    } else {
      return localCallback();
    }
  }
}
