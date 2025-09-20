part 'sort_list_ext.dart';
part 'where_list_ext.dart';

extension ListExt<T> on List<T> {
  _ListExt<T> get ext => _ListExt<T>(this);
}

final class _ListExt<T> with _SortListExt<T>, _WhereListExt<T> {
  const _ListExt(List<T> list) : _list = list;

  @override
  final List<T> _list;
}
