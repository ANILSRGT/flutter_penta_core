part of 'list_ext.dart';

final class _WhereListExt<T> {
  const _WhereListExt(List<T> list) : _list = list;

  final List<T> _list;

  T? firstOrNull(bool Function(T element) test) {
    for (final element in _list) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
