import 'dart:async';

import 'package:flutter/material.dart';

mixin SafeStateMixin<T extends StatefulWidget> on State<T> {
  void runMounted<X>(X Function() fn) {
    if (mounted) fn();
  }

  Future<void> runAsyncMounted<X>(Future<X> Function() fn) async {
    if (mounted) await fn();
  }
}
