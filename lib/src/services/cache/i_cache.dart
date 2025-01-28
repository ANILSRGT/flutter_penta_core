abstract interface class ICache {
  Future<void> init();
  Future<void> set<T>(String key, T value);
  Future<T?> get<T>(String key);
  Future<void> delete(String key);
  Future<void> clear();
}
