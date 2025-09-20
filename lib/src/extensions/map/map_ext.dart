part 'where_map_ext.dart';

extension MapExt<K, V> on Map<K, V> {
  _MapExt<K, V> get ext => _MapExt<K, V>(this);
}

final class _MapExt<K, V> with _WhereMapExt<K, V> {
  const _MapExt(Map<K, V> map) : _map = map;

  @override
  final Map<K, V> _map;
}
