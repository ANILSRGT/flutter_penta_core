import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityService {
  static Stream<bool> get connectionStream =>
      InternetConnectionChecker.I.onStatusChange
          .map((status) => status == InternetConnectionStatus.connected);
  static Future<bool> get isConnected async {
    return InternetConnectionChecker.I.hasConnection;
  }
}
