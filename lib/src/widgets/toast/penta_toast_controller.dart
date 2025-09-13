part of 'penta_toast.dart';

class PentaToastController {
  PentaToastController._init();
  static final PentaToastController _instance = PentaToastController._init();
  static PentaToastController get I => _instance;

  late OverlayState _overlayState;
  OverlayEntry? _currentEntry;
  late PentaToastConfig _config;

  final List<_PentaToastData> _stackedConfigs = [];
  bool _isShowing = false;
  bool _isDismissed = true;

  AnimationController? _animationController;
  final CancellableTask _cancellableTask = CancellableTask();

  void init({
    required OverlayState overlayState,
    required TickerProvider vsync,
    PentaToastConfig? config,
  }) {
    _overlayState = overlayState;
    _config = config ?? const PentaToastConfig();

    // Only create AnimationController if it doesn't exist
    _animationController ??= AnimationController(
      duration: _config.animationDuration,
      vsync: vsync,
    );
  }

  void show({
    required Widget content,
    required PentaToastShowOptions options,
  }) {
    final config = options.config ?? _config;
    if (options.dissmissAll) {
      dispose();
    }

    final overlayEntry = OverlayEntry(
      builder: (context) {
        Widget toastWidget = Align(
          alignment: config.position.alignment,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap:
                config.position == PentaToastPosition.centerMiddle
                    ? () {
                      dismissAndShowNext(options: options);
                    }
                    : null,
            child: Dismissible(
              key: UniqueKey(),
              direction: config.position.dismissDirection,
              onDismissed: (direction) {
                dismissAndShowNext(options: options);
              },
              child: Material(
                color: Colors.transparent,
                child: Container(
                  margin: config.position.margin(config.margin),
                  padding:
                      config.padding ??
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color:
                        config.backgroundColor ??
                        Colors.black.withValues(alpha: 0.8),
                    borderRadius:
                        config.borderRadius ?? BorderRadius.circular(8),
                  ),
                  child: DefaultTextStyle(
                    style: config.style,
                    textAlign: config.textAlign,
                    maxLines: config.maxLines,
                    overflow: config.overflow,
                    child: content,
                  ),
                ),
              ),
            ),
          ),
        );

        // Apply custom animation if provided, otherwise use fade animation
        if (config.customAnimation != null) {
          toastWidget = config.customAnimation!(toastWidget);
        } else {
          toastWidget = SlideTransition(
            position: Tween<Offset>(
              begin: switch (config.position) {
                PentaToastPosition.topLeft => const Offset(-1, 0),
                PentaToastPosition.topCenter => const Offset(0, -1),
                PentaToastPosition.topRight => const Offset(1, 0),
                PentaToastPosition.centerLeft => const Offset(-1, 0),
                PentaToastPosition.centerMiddle => Offset.zero,
                PentaToastPosition.centerRight => const Offset(1, 0),
                PentaToastPosition.bottomLeft => const Offset(-1, 0),
                PentaToastPosition.bottomCenter => const Offset(0, 1),
                PentaToastPosition.bottomRight => const Offset(0, 1),
              },
              end: Offset.zero,
            ).animate(_animationController!),
            child: FadeTransition(
              opacity: _animationController!,
              child: toastWidget,
            ),
          );
        }

        return SafeArea(child: toastWidget);
      },
    );

    final data = _PentaToastData(
      id: _stackedConfigs.length + 1,
      overlayEntry: overlayEntry,
      options: options,
    );

    _stackedConfigs.add(data);

    _showStackedToasts(
      data: data,
      duration: config.duration,
      animationDuration: config.animationDuration,
      delayBetweenToasts: config.delayBetweenToasts,
      onDismissed: options.onDismissed,
    );
  }

  void showText({
    required String text,
    required PentaToastShowOptions options,
  }) {
    show(
      options: options,
      content: Text(text),
    );
  }

  void dismissAndShowNext({required PentaToastShowOptions options}) {
    if (!_isDismissed) options.onDismissed?.call();
    _cancellableTask.cancel();
    _currentEntry?.remove();
    _currentEntry = null;
    _isShowing = false;
    if (_stackedConfigs.isNotEmpty) {
      _stackedConfigs.removeAt(0);
    }
    if (_stackedConfigs.isNotEmpty) {
      final data = _stackedConfigs.first;
      _showStackedToasts(
        data: data,
        duration: data.options.config?.duration ?? _config.duration,
        animationDuration:
            data.options.config?.animationDuration ?? _config.animationDuration,
        delayBetweenToasts:
            data.options.config?.delayBetweenToasts ??
            _config.delayBetweenToasts,
        onDismissed: data.options.onDismissed,
      );
    }
  }

  void dispose() {
    _cancellableTask.cancel();
    _animationController?.reset();
    _currentEntry?.remove();
    _currentEntry = null;
    _isShowing = false;
    _stackedConfigs.clear();
    _isDismissed = true;
  }

  Future<void> _showStackedToasts({
    required _PentaToastData data,
    required Duration animationDuration,
    required Duration duration,
    required Duration delayBetweenToasts,
    VoidCallback? onDismissed,
  }) async {
    if (_isShowing || _stackedConfigs.isEmpty) return;
    _isDismissed = false;

    _currentEntry?.remove();
    _currentEntry = data.overlayEntry;

    _isShowing = true;
    _overlayState.insert(_currentEntry!);

    _animationController?.reset();
    _animationController?.duration = animationDuration;

    unawaited(
      _cancellableTask.run((int taskId) async {
        await _animationController?.forward();
        if (taskId != _cancellableTask._taskId) return;
        await Future<void>.delayed(duration);
        if (taskId != _cancellableTask._taskId) return;
        await _animationController?.reverse();
        if (taskId != _cancellableTask._taskId) return;

        _currentEntry?.remove();
        _currentEntry = null;
        onDismissed?.call();
        _isDismissed = true;
        _isShowing = false;
        _stackedConfigs.removeWhere((e) => e.id == data.id);

        if (_stackedConfigs.isNotEmpty) {
          await Future.delayed(delayBetweenToasts, () {});
          if (taskId != _cancellableTask._taskId || _stackedConfigs.isEmpty) {
            return;
          }
          return _showStackedToasts(
            data: _stackedConfigs.first,
            duration: duration,
            animationDuration: animationDuration,
            delayBetweenToasts: delayBetweenToasts,
            onDismissed: onDismissed,
          );
        }
      }),
    );
  }
}

class CancellableTask {
  int _taskId = 0;

  Future<void> run(Future<void> Function(int taskId) task) async {
    final currentId = ++_taskId;
    await task(currentId);
  }

  void cancel() {
    _taskId++;
  }
}
