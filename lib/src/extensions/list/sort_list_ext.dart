part of 'list_ext.dart';

mixin _SortListExt<T> {
  List<T> get _list;

  List<T> orderWithData(int Function(T, T) compare) {
    final orderedList = List<T>.from(_list)..sort((a, b) => compare(a, b));
    return orderedList;
  }
}
