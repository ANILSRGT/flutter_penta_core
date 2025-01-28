import 'dart:async';

import 'package:flutter/material.dart';
import 'package:penta_core/src/models/error/error_model.dart';
import 'package:penta_core/src/models/response/response_model.dart';

sealed class _WidgetLifecycleData<S> {
  const _WidgetLifecycleData();

  Widget when({
    required Widget Function() idle,
    required Widget Function() busy,
    required Widget Function(S data) success,
    required Widget Function(ErrorModel error) fail,
  }) {
    return this is _WidgetLifecycleDataBusy<S>
        ? busy()
        : this is _WidgetLifecycleDataSuccess<S>
            ? success((this as _WidgetLifecycleDataSuccess<S>).data)
            : this is _WidgetLifecycleDataFail
                ? fail((this as _WidgetLifecycleDataFail<S>).error)
                : idle();
  }
}

class _WidgetLifecycleDataIdle<S> extends _WidgetLifecycleData<S> {
  const _WidgetLifecycleDataIdle();
}

class _WidgetLifecycleDataBusy<S> extends _WidgetLifecycleData<S> {
  const _WidgetLifecycleDataBusy();
}

class _WidgetLifecycleDataSuccess<S> extends _WidgetLifecycleData<S> {
  const _WidgetLifecycleDataSuccess({required this.data});
  final S data;
}

class _WidgetLifecycleDataFail<S> extends _WidgetLifecycleData<S> {
  const _WidgetLifecycleDataFail({required this.error});

  final ErrorModel error;
}

mixin WidgetStateMixin<T extends StatefulWidget, S> on State<T> {
  final ValueNotifier<_WidgetLifecycleData<S>> widgetStateNotifier =
      ValueNotifier(const _WidgetLifecycleDataIdle());

  @override
  void dispose() {
    widgetStateNotifier.dispose();
    super.dispose();
  }

  Future<void> executeState({
    required FutureOr<ResponseModel<S>> Function() callback,
  }) async {
    widgetStateNotifier.value = _WidgetLifecycleDataBusy();
    final result = await callback();
    widgetStateNotifier.value = result.isSuccess
        ? _WidgetLifecycleDataSuccess(data: result.asSuccess.data)
        : _WidgetLifecycleDataFail(error: result.asFail.error);
  }

  /// Reset the state to WidgetLifecycles.idle
  void resetState() {
    widgetStateNotifier.value = _WidgetLifecycleDataIdle();
  }
}
