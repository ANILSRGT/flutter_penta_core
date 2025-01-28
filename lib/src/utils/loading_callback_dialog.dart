import 'dart:async';

import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

enum LoadingCallbackDialogCloseTypes { beforeCallback, afterCallback }

final class LoadingCallbackDialog {
  const LoadingCallbackDialog._();

  static Future<void> showLoadingDialog<T>({
    required BuildContext context,
    required Future<T> Function() future,
    required FutureOr<void> Function(T value) callback,
    LoadingCallbackDialogCloseTypes closeType =
        LoadingCallbackDialogCloseTypes.beforeCallback,
    Widget? customLoading,
    bool cancelable = false,
    FutureOr<void> Function()? cancelableCallback,
  }) async {
    var isCanceled = false;

    unawaited(
      () async {
        isCanceled = await showDialog<bool?>(
              barrierDismissible: cancelable,
              context: context,
              builder: (context) {
                return PopScope(
                  canPop: false,
                  child: customLoading ??
                      Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                              context.ext.sizedBox.height.md,
                              ElevatedButton(
                                onPressed: () {
                                  isCanceled = true;
                                  Navigator.pop(context, true);
                                },
                                child: const Text('Cancel'),
                              ),
                            ],
                          ),
                        ),
                      ),
                );
              },
            ) ??
            false;
        if (isCanceled) {
          cancelableCallback?.call();
        }
      }(),
    );

    if (cancelable && isCanceled) return;
    final value = await future();
    if (cancelable && isCanceled) return;
    if (closeType == LoadingCallbackDialogCloseTypes.beforeCallback &&
        context.mounted) {
      Navigator.pop(context);
    }
    await callback(value);
    if (cancelable && isCanceled) return;
    if (closeType == LoadingCallbackDialogCloseTypes.afterCallback &&
        context.mounted) {
      Navigator.pop(context);
    }
  }
}
