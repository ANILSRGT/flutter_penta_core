import 'package:penta_core/src/utils/connectivity_service.dart';

/// Chooses the remote or local data source depending on connectivity.
mixin DataRepoMixin {
  /// Connectivity check used by [executeByDatasource]. Override in tests.
  Future<bool> get hasConnection => ConnectivityService.isConnected;

  Future<T> executeByDatasource<T>({
    required Future<T> Function() localCallback,
    required Future<T> Function() remoteCallback,
  }) async =>
      await hasConnection ? await remoteCallback() : await localCallback();
}
