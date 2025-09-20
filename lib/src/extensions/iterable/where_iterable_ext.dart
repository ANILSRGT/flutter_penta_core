part of 'iterable_ext.dart';

mixin _WhereIterableExt<T> {
  Iterable<T> get _iterable;

  T? firstOrNull(bool Function(T element) test) {
    for (final element in _iterable) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
