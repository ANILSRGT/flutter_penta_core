part of 'penta_toast.dart';

/// Shows toasts from anywhere, without a `BuildContext`.
///
/// Requires a [PentaToast] in the tree (usually in `MaterialApp.builder`).
/// Toasts requested before it is mounted are shown once it is.
final class PentaToastController {
  PentaToastController._();

  static final PentaToastController _instance = PentaToastController._();

  static PentaToastController get I => _instance;
  static PentaToastController get instance => _instance;

  _PentaToastState? _host;
  final List<_ToastRequest> _pending = [];

  /// Whether a [PentaToast] is mounted.
  bool get isAttached => _host != null;

  /// Whether a toast is visible.
  bool get isShowing => _host?._current != null;

  /// Shows [content] (a widget) in a toast.
  void show({
    required Widget content,
    PentaToastShowOptions options = const PentaToastShowOptions(),
  }) {
    final request = _ToastRequest(content: content, options: options);
    final host = _host;
    if (host == null) {
      if (options.dismissAll) _pending.clear();
      _pending.add(request);
    } else {
      host._enqueue(request);
    }
  }

  /// Shows [text] in a toast.
  void showText({
    required String text,
    PentaToastShowOptions options = const PentaToastShowOptions(),
  }) => show(content: Text(text), options: options);

  /// Hides the visible toast; the next waiting one follows.
  void dismiss() => _host?._dismissCurrent();

  /// Hides the visible toast and drops the waiting ones.
  void dismissAll() {
    _pending.clear();
    _host?._dismissAll();
  }

  @Deprecated('Use dismiss() instead. Will be removed in 4.0.0.')
  void dismissAndShowNext({PentaToastShowOptions? options}) => dismiss();

  @Deprecated('Use dismissAll() instead. Will be removed in 4.0.0.')
  void dispose() => dismissAll();

  void _attach(_PentaToastState host) {
    _host = host;
    final pending = List.of(_pending);
    _pending.clear();
    pending.forEach(host._enqueue);
  }

  void _detach(_PentaToastState host) {
    if (identical(_host, host)) _host = null;
  }
}

class _ToastRequest {
  _ToastRequest({required this.content, required this.options});

  final Widget content;
  final PentaToastShowOptions options;
}
