part 'sort_list_ext.dart';

extension ListExt<T> on List<T> {
  _ListExt<T> get ext => _ListExt<T>(this);
}

final class _ListExt<T> {
  const _ListExt(List<T> list) : _list = list;

  final List<T> _list;

  _SortListExt<T> get sorter => _SortListExt<T>(_list);
}
