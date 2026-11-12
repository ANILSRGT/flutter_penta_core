import 'dart:async';

/// Lightweight publish / subscribe bus.
///
/// ```dart
/// final bus = PentaEventBus<AppEvent>();
/// bus.on<UserLoggedOut>().listen((_) => ...);
/// bus.fire(UserLoggedOut());
/// ```
class PentaEventBus<T> {
  PentaEventBus({bool sync = false})
    : _streamController = StreamController<T>.broadcast(sync: sync);

  PentaEventBus.customController(StreamController<T> controller)
    : _streamController = controller;

  final StreamController<T> _streamController;

  StreamController<T> get streamController => _streamController;

  /// All events.
  Stream<T> get stream => _streamController.stream;

  /// Events of type [S] (all events when [S] is omitted).
  Stream<S> on<S extends T>() => S == T
      ? _streamController.stream as Stream<S>
      : _streamController.stream.where((event) => event is S).cast<S>();

  bool get isClosed => _streamController.isClosed;

  void fire(T event) {
    if (!_streamController.isClosed) _streamController.add(event);
  }

  Future<void> destroy() => _streamController.close();
}
