part of 'list_ext.dart';

mixin _WhereListExt<T> {
  List<T> get _list;

  T? firstOrNull(bool Function(T element) test) {
    for (final element in _list) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
