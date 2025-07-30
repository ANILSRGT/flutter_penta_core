import 'dart:async';

abstract interface class IPentaCache {
  FutureOr<void> init();
  FutureOr<void> set<T>(String key, T value);
  FutureOr<T?> get<T>(String key);
  FutureOr<void> delete(String key);
  FutureOr<void> clear();
}
