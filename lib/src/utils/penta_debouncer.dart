import 'dart:async';

typedef PentaDebounceable<S, T> = FutureOr<S?> Function(T parameter);

class PentaDebouncer {
  static PentaDebounceable<S, T> debounce<S, T>({
    required Duration debounceDuration,
    required PentaDebounceable<S?, T> function,
  }) {
    _PentaDebounceTimer? debounceTimer;

    return (T parameter) async {
      if (debounceTimer != null && !debounceTimer!.isCompleted) {
        debounceTimer!.cancel();
      }

      debounceTimer = _PentaDebounceTimer(debounceDuration: debounceDuration);

      try {
        await debounceTimer!.future;
      } on _PentaCancelException {
        return null;
      }
      return function(parameter);
    };
  }
}

class _PentaDebounceTimer {
  _PentaDebounceTimer({
    required Duration debounceDuration,
  }) {
    _timer = Timer(debounceDuration, _onComplete);
  }

  late final Timer _timer;
  final Completer<void> _completer = Completer<void>();

  void _onComplete() {
    _completer.complete();
  }

  Future<void> get future => _completer.future;

  bool get isCompleted => _completer.isCompleted;

  void cancel() {
    _timer.cancel();
    _completer.completeError(const _PentaCancelException());
  }
}

class _PentaCancelException implements Exception {
  const _PentaCancelException();
}
