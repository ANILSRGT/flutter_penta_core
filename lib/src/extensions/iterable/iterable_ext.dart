part 'where_iterable_ext.dart';

extension IterableExt<T> on Iterable<T> {
  _IterableExt<T> get ext => _IterableExt<T>(this);
}

final class _IterableExt<T> with _WhereIterableExt<T> {
  const _IterableExt(Iterable<T> iterable) : _iterable = iterable;

  @override
  final Iterable<T> _iterable;
}
