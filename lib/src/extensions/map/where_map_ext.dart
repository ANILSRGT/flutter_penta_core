part of 'map_ext.dart';

mixin _WhereMapExt<K, V> {
  Map<K, V> get _map;

  Map<K, V> removeWhere(bool Function(K key, V value) test) {
    return Map<K, V>.fromEntries(
      _map.entries.where(
        (entry) => !test(entry.key, entry.value),
      ),
    );
  }
}
