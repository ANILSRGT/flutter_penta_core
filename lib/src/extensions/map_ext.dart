/// Gives access to [MapExt] through `map.ext`.
extension MapExtension<K, V> on Map<K, V> {
  MapExt<K, V> get ext => MapExt<K, V>(this);
}

extension type const MapExt<K, V>(Map<K, V> _map) {
  /// New map with the entries matching [test].
  Map<K, V> where(bool Function(K key, V value) test) => {
    for (final entry in _map.entries)
      if (test(entry.key, entry.value)) entry.key: entry.value,
  };

  /// New map without the entries matching [test].
  /// The original map is not modified.
  Map<K, V> whereNot(bool Function(K key, V value) test) =>
      where((key, value) => !test(key, value));

  /// New map without the entries matching [test].
  @Deprecated('Use whereNot instead. Will be removed in 4.0.0.')
  Map<K, V> removeWhere(bool Function(K key, V value) test) => whereNot(test);

  /// New map without `null` values.
  Map<K, V> get withoutNulls => where((_, value) => value != null);

  /// Value of [key], or `null` when it is missing or not a [R].
  R? getAs<R>(K key) {
    final value = _map[key];
    return value is R ? value : null;
  }
}
