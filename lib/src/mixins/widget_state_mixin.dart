import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:penta_core/src/models/error_model.dart';
import 'package:penta_core/src/models/response_model.dart';

/// Lifecycle of an async operation driven by [WidgetStateMixin].
@immutable
sealed class ViewState<S> {
  const ViewState();

  bool get isIdle => this is ViewStateIdle<S>;
  bool get isBusy => this is ViewStateBusy<S>;
  bool get isSuccess => this is ViewStateSuccess<S>;
  bool get isFail => this is ViewStateFail<S>;

  X when<X>({
    required X Function() idle,
    required X Function() busy,
    required X Function(S data) success,
    required X Function(ErrorModel error) fail,
  }) => switch (this) {
    ViewStateIdle() => idle(),
    ViewStateBusy() => busy(),
    ViewStateSuccess(:final data) => success(data),
    ViewStateFail(:final error) => fail(error),
  };

  X maybeWhen<X>({
    required X Function() orElse,
    X Function()? idle,
    X Function()? busy,
    X Function(S data)? success,
    X Function(ErrorModel error)? fail,
  }) => switch (this) {
    ViewStateIdle() => idle != null ? idle() : orElse(),
    ViewStateBusy() => busy != null ? busy() : orElse(),
    ViewStateSuccess(:final data) => success != null ? success(data) : orElse(),
    ViewStateFail(:final error) => fail != null ? fail(error) : orElse(),
  };
}

final class ViewStateIdle<S> extends ViewState<S> {
  const ViewStateIdle();
}

final class ViewStateBusy<S> extends ViewState<S> {
  const ViewStateBusy();
}

final class ViewStateSuccess<S> extends ViewState<S> {
  const ViewStateSuccess(this.data);
  final S data;
}

final class ViewStateFail<S> extends ViewState<S> {
  const ViewStateFail(this.error);
  final ErrorModel error;
}

/// Adds an idle / busy / success / fail state to a [State].
///
/// ```dart
/// class _PageState extends State<Page> with WidgetStateMixin<Page, User> {
///   @override
///   void initState() {
///     super.initState();
///     executeState(callback: repository.fetchUser);
///   }
///
///   @override
///   Widget build(BuildContext context) => buildState(
///     idle: () => const SizedBox(),
///     busy: () => const CircularProgressIndicator(),
///     success: (user) => Text(user.name),
///     fail: (error) => Text(error.message),
///   );
/// }
/// ```
mixin WidgetStateMixin<T extends StatefulWidget, S> on State<T> {
  final ValueNotifier<ViewState<S>> widgetStateNotifier = ValueNotifier(
    ViewStateIdle<S>(),
  );

  /// Current state.
  ViewState<S> get viewState => widgetStateNotifier.value;

  int _operation = 0;

  @override
  void dispose() {
    widgetStateNotifier.dispose();
    super.dispose();
  }

  /// Runs [callback] and moves through busy → success / fail.
  ///
  /// Exceptions become [ViewStateFail]. Results arriving after `dispose` or
  /// after a newer [executeState] call are ignored.
  Future<void> executeState({
    required FutureOr<ResponseModel<S>> Function() callback,
  }) async {
    final operation = ++_operation;
    widgetStateNotifier.value = ViewStateBusy<S>();

    ViewState<S> next;
    try {
      final result = await callback();
      next = switch (result) {
        ResponseModelSuccess(:final data) => ViewStateSuccess<S>(data),
        ResponseModelFail(:final error) => ViewStateFail<S>(error),
      };
    } on Object catch (error, stackTrace) {
      next = ViewStateFail<S>(ErrorModel.fromException(error, stackTrace));
    }

    if (!mounted || operation != _operation) return;
    widgetStateNotifier.value = next;
  }

  /// Back to idle.
  void resetState() {
    _operation++;
    widgetStateNotifier.value = ViewStateIdle<S>();
  }

  /// Rebuilds with the matching builder whenever the state changes.
  Widget buildState({
    required Widget Function() idle,
    required Widget Function() busy,
    required Widget Function(S data) success,
    required Widget Function(ErrorModel error) fail,
  }) => ValueListenableBuilder<ViewState<S>>(
    valueListenable: widgetStateNotifier,
    builder: (_, state, _) =>
        state.when(idle: idle, busy: busy, success: success, fail: fail),
  );
}
