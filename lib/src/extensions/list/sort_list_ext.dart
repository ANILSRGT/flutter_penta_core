part of 'list_ext.dart';

final class _SortListExt<T> {
  const _SortListExt(List<T> list) : _list = list;

  final List<T> _list;

  List<T> orderWithData(int Function(T, T) compare) {
    final orderedList = List<T>.from(_list)..sort((a, b) => compare(a, b));
    return orderedList;
  }
}
