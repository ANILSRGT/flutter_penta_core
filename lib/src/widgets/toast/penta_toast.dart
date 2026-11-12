import 'dart:async';

import 'package:flutter/material.dart';

part 'penta_toast_config.dart';
part 'penta_toast_controller.dart';
part 'penta_toast_position.dart';
part 'penta_toast_show_options.dart';

/// Hosts toasts shown through [PentaToastController].
///
/// Place it in `MaterialApp.builder` so toasts appear above every route and
/// dialog:
///
/// ```dart
/// MaterialApp(
///   builder: (context, child) => PentaToast(child: child!),
/// );
///
/// PentaToastController.I.showText(text: 'Saved');
/// ```
///
/// Toasts are shown one at a time, in order.
class PentaToast extends StatefulWidget {
  const PentaToast({
    this.child,
    super.key,
    this.config = const PentaToastConfig(),
  });

  final Widget? child;

  /// Default config; a toast can override it with
  /// [PentaToastShowOptions.config].
  final PentaToastConfig config;

  @override
  State<PentaToast> createState() => _PentaToastState();
}

class _ActiveToast {
  _ActiveToast(this.request, this.config, this.animation);

  final _ToastRequest request;
  final PentaToastConfig config;
  final AnimationController animation;
  late final CurvedAnimation curved = CurvedAnimation(
    parent: animation,
    curve: config.animationCurve,
  );
  final Key key = UniqueKey();
  Timer? timer;
  bool closing = false;

  void dispose() {
    timer?.cancel();
    curved.dispose();
    animation.dispose();
  }
}

class _PentaToastState extends State<PentaToast> with TickerProviderStateMixin {
  final List<_ToastRequest> _queue = [];
  _ActiveToast? _current;
  Timer? _gapTimer;

  @override
  void initState() {
    super.initState();
    PentaToastController.I._attach(this);
  }

  @override
  void dispose() {
    PentaToastController.I._detach(this);
    _gapTimer?.cancel();
    _current?.dispose();
    super.dispose();
  }

  PentaToastConfig _configOf(_ToastRequest request) =>
      request.options.config ?? widget.config;

  void _enqueue(_ToastRequest request) {
    if (request.options.dismissAll) {
      _queue.clear();
      _removeCurrent(notify: true);
    }
    _queue.add(request);
    final limit = _configOf(request).maxToasts - (_current == null ? 0 : 1);
    while (_queue.length > limit && _queue.length > 1) {
      _queue.removeAt(0);
    }
    _pump();
  }

  void _pump() {
    if (!mounted || _current != null || _queue.isEmpty) return;
    if (_gapTimer?.isActive ?? false) return;

    final request = _queue.removeAt(0);
    final config = _configOf(request);
    final toast = _ActiveToast(
      request,
      config,
      AnimationController(vsync: this, duration: config.animationDuration),
    );
    setState(() => _current = toast);
    unawaited(
      toast.animation.forward().then((_) {
        if (_current != toast) return;
        toast.timer = Timer(config.duration, () => _hide(toast));
      }),
    );
  }

  Future<void> _hide(_ActiveToast toast) async {
    if (toast.closing || _current != toast) return;
    toast.closing = true;
    toast.timer?.cancel();
    await toast.animation.reverse().orCancel.catchError((Object _) {});
    if (_current == toast) _finish(toast);
  }

  void _finish(_ActiveToast toast) {
    toast.dispose();
    if (mounted) setState(() => _current = null);
    toast.request.options.onDismissed?.call();
    if (_queue.isNotEmpty) {
      _gapTimer = Timer(toast.config.delayBetweenToasts, _pump);
    }
  }

  void _removeCurrent({required bool notify}) {
    final toast = _current;
    if (toast == null) return;
    toast.dispose();
    _current = null;
    if (mounted) setState(() {});
    if (notify) toast.request.options.onDismissed?.call();
  }

  void _dismissCurrent() {
    final toast = _current;
    if (toast != null) unawaited(_hide(toast));
  }

  void _dismissAll() {
    _queue.clear();
    _gapTimer?.cancel();
    _dismissCurrent();
  }

  @override
  Widget build(BuildContext context) {
    final toast = _current;
    final textDirection = Directionality.maybeOf(context) ?? TextDirection.ltr;

    return Directionality(
      textDirection: textDirection,
      child: Stack(
        children: [
          if (widget.child != null) Positioned.fill(child: widget.child!),
          if (toast != null)
            Positioned.fill(
              child: Padding(
                padding: MediaQuery.maybePaddingOf(context) ?? EdgeInsets.zero,
                child: _buildToast(toast),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildToast(_ActiveToast toast) {
    final config = toast.config;
    final options = toast.request.options;
    final tapToDismiss =
        options.dismissible &&
        (options.dismissOnTap ||
            config.position == PentaToastPosition.centerMiddle);

    Widget box = Container(
      constraints: BoxConstraints(maxWidth: config.maxWidth),
      margin: config.position.margin(config.margin),
      padding:
          config.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: config.backgroundColor ?? const Color(0xCC000000),
        borderRadius: config.borderRadius ?? BorderRadius.circular(8),
        boxShadow: config.boxShadow,
      ),
      child: DefaultTextStyle(
        style: config.style,
        textAlign: config.textAlign,
        maxLines: config.maxLines,
        overflow: config.overflow,
        child: toast.request.content,
      ),
    );

    box = Material(type: MaterialType.transparency, child: box);

    if (tapToDismiss) {
      box = GestureDetector(onTap: () => _hide(toast), child: box);
    }

    if (options.dismissible &&
        config.position.dismissDirection != DismissDirection.none) {
      box = Dismissible(
        key: toast.key,
        direction: config.position.dismissDirection,
        onDismissed: (_) => _finish(toast),
        child: box,
      );
    }

    final animation = toast.curved;
    final animated =
        config.customAnimation?.call(box, animation) ??
        SlideTransition(
          position: Tween(
            begin: config.position.slideBegin,
            end: Offset.zero,
          ).animate(animation),
          child: FadeTransition(opacity: animation, child: box),
        );

    return Align(alignment: config.position.alignment, child: animated);
  }
}
