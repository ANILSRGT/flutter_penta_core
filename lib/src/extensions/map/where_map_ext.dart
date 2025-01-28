part of 'map_ext.dart';

final class _WhereMapExt<K, V> {
  const _WhereMapExt(Map<K, V> map) : _map = map;

  final Map<K, V> _map;

  Map<K, V> removeWhere(bool Function(K key, V value) test) {
    return Map<K, V>.fromEntries(
      _map.entries.where(
        (entry) => !test(entry.key, entry.value),
      ),
    );
  }
}
