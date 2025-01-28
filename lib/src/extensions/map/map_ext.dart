part 'where_map_ext.dart';

extension MapExt<K, V> on Map<K, V> {
  _MapExt<K, V> get ext => _MapExt<K, V>(this);
}

final class _MapExt<K, V> {
  const _MapExt(Map<K, V> map) : _map = map;

  final Map<K, V> _map;

  _WhereMapExt<K, V> get where => _WhereMapExt<K, V>(_map);
}
