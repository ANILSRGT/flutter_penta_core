import 'dart:async';

import 'package:flutter/foundation.dart';

typedef PentaDebounceable<S, T> = FutureOr<S?> Function(T parameter);

/// Delays an action until calls stop for [duration].
///
/// Instance usage (search box):
///
/// ```dart
/// final _debouncer = PentaDebouncer(const Duration(milliseconds: 400));
/// onChanged: (q) => _debouncer.run(() => search(q)),
/// // dispose(): _debouncer.dispose();
/// ```
///
/// Function usage — superseded calls complete with `null`:
///
/// ```dart
/// final search = PentaDebouncer.debounce<List<Item>, String>(
///   debounceDuration: const Duration(milliseconds: 400),
///   function: api.search,
/// );
/// final items = await search('query');
/// ```
class PentaDebouncer {
  PentaDebouncer(this.duration);

  final Duration duration;
  Timer? _timer;

  /// Whether an action is waiting to run.
  bool get isPending => _timer?.isActive ?? false;

  /// Schedules [action], cancelling the previously scheduled one.
  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(duration, action);
  }

  /// Cancels the pending action.
  void cancel() => _timer?.cancel();

  void dispose() => cancel();

  /// Wraps [function] so only the last call within [debounceDuration] runs.
  static Future<S?> Function(T parameter) debounce<S, T>({
    required Duration debounceDuration,
    required PentaDebounceable<S?, T> function,
  }) {
    Timer? timer;
    Completer<bool>? pending;

    return (T parameter) async {
      timer?.cancel();
      if (pending != null && !pending!.isCompleted) pending!.complete(false);

      final completer = pending = Completer<bool>();
      timer = Timer(debounceDuration, () => completer.complete(true));

      if (!await completer.future) return null;
      return await function(parameter);
    };
  }
}
