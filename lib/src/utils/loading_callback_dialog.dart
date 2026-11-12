import 'dart:async';

import 'package:flutter/material.dart';

enum LoadingCallbackDialogCloseTypes {
  /// Close the dialog as soon as the future completes.
  beforeCallback,

  /// Keep the dialog open until the callback completes.
  afterCallback,
}

/// Shows a blocking loading dialog while a future runs.
abstract final class LoadingCallbackDialog {
  /// Runs [future] behind a loading dialog, then calls [callback].
  ///
  /// - The dialog is always closed, even when [future] or [callback] throws.
  /// - Only the loading dialog is removed; other routes are never popped.
  /// - With [cancelable], the user can dismiss the dialog (barrier, back
  ///   button or cancel button). [cancelableCallback] is called and
  ///   [callback] is skipped.
  /// - Errors are passed to [onError] when given, otherwise rethrown.
  static Future<void> showLoadingDialog<T>({
    required BuildContext context,
    required Future<T> Function() future,
    required FutureOr<void> Function(T value) callback,
    LoadingCallbackDialogCloseTypes closeType =
        LoadingCallbackDialogCloseTypes.beforeCallback,
    Widget? customLoading,
    bool cancelable = false,
    FutureOr<void> Function()? cancelableCallback,
    String cancelButtonText = 'Cancel',
    FutureOr<void> Function(Object error, StackTrace stackTrace)? onError,
    bool useRootNavigator = true,
    Color? barrierColor,
  }) async {
    final navigator = Navigator.of(context, rootNavigator: useRootNavigator);
    var closedByUs = false;
    var canceled = false;

    late final DialogRoute<void> route;
    route = DialogRoute<void>(
      context: context,
      barrierDismissible: cancelable,
      barrierColor: barrierColor ?? Colors.black54,
      useSafeArea: false,
      builder: (dialogContext) => PopScope(
        canPop: cancelable,
        child:
            customLoading ??
            _DefaultLoading(
              cancelButtonText: cancelable ? cancelButtonText : null,
              onCancel: () => _removeRoute(navigator, route),
            ),
      ),
    );

    void close() {
      if (closedByUs) return;
      closedByUs = true;
      _removeRoute(navigator, route);
    }

    unawaited(
      navigator.push(route).then((_) async {
        if (closedByUs) return;
        closedByUs = true;
        canceled = true;
        await cancelableCallback?.call();
      }),
    );

    try {
      final value = await future();
      if (canceled) return;
      if (closeType == LoadingCallbackDialogCloseTypes.beforeCallback) close();
      await callback(value);
    } on Object catch (error, stackTrace) {
      close();
      if (canceled) return;
      if (onError == null) rethrow;
      await onError(error, stackTrace);
    } finally {
      close();
    }
  }
}

/// Pops [route] with its animation when it is on top, otherwise removes it
/// without touching the routes above.
void _removeRoute(NavigatorState navigator, Route<void> route) {
  if (!route.isActive) return;
  if (route.isCurrent) {
    navigator.pop();
  } else {
    navigator.removeRoute(route);
  }
}

class _DefaultLoading extends StatelessWidget {
  const _DefaultLoading({required this.onCancel, this.cancelButtonText});

  final String? cancelButtonText;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          if (cancelButtonText != null) ...[
            const SizedBox(height: 12),
            ElevatedButton(onPressed: onCancel, child: Text(cancelButtonText!)),
          ],
        ],
      ),
    );
  }
}
