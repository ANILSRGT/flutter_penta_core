import 'dart:async';

import 'package:flutter/widgets.dart';

/// Guards against calling `setState` or running UI work after `dispose`.
mixin SafeStateMixin<T extends StatefulWidget> on State<T> {
  /// Calls `setState` only while the state is mounted.
  void setStateSafe(VoidCallback fn) {
    if (mounted) setState(fn);
  }

  /// Runs [fn] only while mounted. Returns its result, or `null`.
  X? runMounted<X>(X Function() fn) => mounted ? fn() : null;

  /// Awaits [fn] only while mounted. Returns its result, or `null`.
  Future<X?> runAsyncMounted<X>(Future<X> Function() fn) async =>
      mounted ? await fn() : null;
}
