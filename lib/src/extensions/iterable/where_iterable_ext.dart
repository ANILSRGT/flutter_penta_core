part of 'iterable_ext.dart';

final class _WhereIterableExt<T> {
  const _WhereIterableExt(Iterable<T> iterable) : _iterable = iterable;

  final Iterable<T> _iterable;

  T? firstOrNull(bool Function(T element) test) {
    for (final element in _iterable) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
