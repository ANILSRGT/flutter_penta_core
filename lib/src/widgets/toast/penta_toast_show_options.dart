part of 'penta_toast.dart';

/// Per-toast options.
@immutable
class PentaToastShowOptions {
  const PentaToastShowOptions({
    this.config,
    this.onDismissed,
    this.dismissAll = false,
    this.dismissible = true,
    this.dismissOnTap = false,
  });

  /// Overrides the [PentaToast.config] for this toast only.
  final PentaToastConfig? config;

  /// Called once the toast has left the screen (timeout, swipe or tap).
  final VoidCallback? onDismissed;

  /// Removes the visible and waiting toasts before showing this one.
  final bool dismissAll;

  /// Whether the toast can be swiped away.
  final bool dismissible;

  /// Whether tapping the toast dismisses it. Always on for
  /// [PentaToastPosition.centerMiddle] when [dismissible] is true.
  final bool dismissOnTap;
}
