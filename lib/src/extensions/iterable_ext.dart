/// Gives access to [IterableExt] through `iterable.ext`.
extension IterableExtension<T> on Iterable<T> {
  IterableExt<T> get ext => IterableExt<T>(this);
}

/// Gives access to [ListExt] through `list.ext`.
extension ListExtension<T> on List<T> {
  ListExt<T> get ext => ListExt<T>(this);
}

extension type const IterableExt<T>(Iterable<T> _iterable) {
  /// First element matching [test], or `null`.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in _iterable) {
      if (test(element)) return element;
    }
    return null;
  }

  /// First element matching [test], or `null`.
  @Deprecated('Use firstWhereOrNull instead. Will be removed in 4.0.0.')
  T? firstOrNull(bool Function(T element) test) => firstWhereOrNull(test);

  /// Elements with [separator] inserted between each pair.
  ///
  /// ```dart
  /// Column(children: [a, b, c].ext.separatedBy(const Divider()));
  /// ```
  List<T> separatedBy(T separator) {
    final result = <T>[];
    final iterator = _iterable.iterator;
    if (!iterator.moveNext()) return result;
    result.add(iterator.current);
    while (iterator.moveNext()) {
      result
        ..add(separator)
        ..add(iterator.current);
    }
    return result;
  }

  /// Splits the elements into lists of at most [size] items.
  Iterable<List<T>> chunked(int size) sync* {
    if (size <= 0) throw ArgumentError.value(size, 'size', 'must be > 0');
    var chunk = <T>[];
    for (final element in _iterable) {
      chunk.add(element);
      if (chunk.length == size) {
        yield chunk;
        chunk = <T>[];
      }
    }
    if (chunk.isNotEmpty) yield chunk;
  }

  /// Elements with duplicate [key]s removed, keeping the first occurrence.
  List<T> distinctBy<K>(K Function(T element) key) {
    final seen = <K>{};
    return [
      for (final element in _iterable)
        if (seen.add(key(element))) element,
    ];
  }

  /// Groups the elements by [key].
  Map<K, List<T>> groupBy<K>(K Function(T element) key) {
    final result = <K, List<T>>{};
    for (final element in _iterable) {
      (result[key(element)] ??= <T>[]).add(element);
    }
    return result;
  }
}

extension type const ListExt<T>(List<T> _list) implements IterableExt<T> {
  /// Sorted copy of the list. The original list is not modified.
  List<T> sorted([int Function(T a, T b)? compare]) =>
      List<T>.of(_list)..sort(compare);

  /// Sorted copy of the list.
  @Deprecated('Use sorted instead. Will be removed in 4.0.0.')
  List<T> orderWithData(int Function(T a, T b) compare) => sorted(compare);

  /// Element at [index], or `null` when the index is out of range.
  T? getOrNull(int index) =>
      index >= 0 && index < _list.length ? _list[index] : null;
}
