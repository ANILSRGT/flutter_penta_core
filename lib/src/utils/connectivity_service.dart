import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Internet reachability helpers backed by `internet_connection_checker`.
///
/// Tests can replace the checks with [debugOverride].
abstract final class ConnectivityService {
  static Future<bool> Function()? _override;
  static Stream<bool>? _streamOverride;

  /// Emits `true` when the device goes online and `false` when it goes
  /// offline.
  static Stream<bool> get connectionStream =>
      _streamOverride ??
      InternetConnectionChecker.instance.onStatusChange
          .map((status) => status == InternetConnectionStatus.connected)
          .distinct();

  /// Whether the internet is reachable right now.
  static Future<bool> get isConnected =>
      _override?.call() ?? InternetConnectionChecker.instance.hasConnection;

  /// Replaces the connectivity checks. Pass `null` to restore them.
  @visibleForTesting
  static void debugOverride({
    Future<bool> Function()? isConnected,
    Stream<bool>? connectionStream,
  }) {
    _override = isConnected;
    _streamOverride = connectionStream;
  }
}
