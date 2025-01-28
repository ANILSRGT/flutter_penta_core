import 'dart:async';

class PentaEventBus<T> {
  PentaEventBus({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);

  PentaEventBus.customController(StreamController<T> controller)
      : _streamController = controller;
  final StreamController<T> _streamController;

  StreamController<T> get streamController => _streamController;

  Stream<T> get on => _streamController.stream;

  void fire(T event) {
    streamController.add(event);
  }

  void destroy() {
    _streamController.close();
  }
}
