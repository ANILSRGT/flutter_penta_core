part of 'penta_draw_arrow_painter.dart';

/// Draws an arrow between the widgets owning [fromWidgetKey] and
/// [toWidgetKey].
///
/// Positions are measured after layout, when the screen metrics change and
/// whenever [updateEventBus] fires (e.g. after scrolling).
class PentaDrawArrowCustomPaint extends StatefulWidget {
  const PentaDrawArrowCustomPaint({
    required this.fromWidgetKey,
    required this.toWidgetKey,
    this.arrowConfig = const PentaDrawArrowConfig(),
    super.key,
    this.updateEventBus,
  });

  final GlobalKey fromWidgetKey;
  final GlobalKey toWidgetKey;
  final PentaDrawArrowConfig arrowConfig;
  final PentaEventBus<void>? updateEventBus;

  @override
  State<PentaDrawArrowCustomPaint> createState() =>
      _PentaDrawArrowCustomPaintState();
}

class _PentaDrawArrowCustomPaintState extends State<PentaDrawArrowCustomPaint>
    with WidgetsBindingObserver {
  final GlobalKey _paintKey = GlobalKey();
  StreamSubscription<void>? _subscription;
  Offset? _from;
  Offset? _to;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _subscribe();
    _scheduleUpdate();
  }

  @override
  void didUpdateWidget(covariant PentaDrawArrowCustomPaint oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.updateEventBus != widget.updateEventBus) {
      unawaited(_subscription?.cancel());
      _subscribe();
    }
    _scheduleUpdate();
  }

  @override
  void didChangeMetrics() => _scheduleUpdate();

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    super.dispose();
  }

  void _subscribe() {
    _subscription = widget.updateEventBus?.stream.listen(
      (_) => _scheduleUpdate(),
    );
  }

  void _scheduleUpdate() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _updatePositions());
  }

  void _updatePositions() {
    if (!mounted) return;
    final fromBox = widget.fromWidgetKey.currentContext?.findRenderObject();
    final toBox = widget.toWidgetKey.currentContext?.findRenderObject();
    final paintBox = _paintKey.currentContext?.findRenderObject();
    if (fromBox is! RenderBox ||
        toBox is! RenderBox ||
        paintBox is! RenderBox ||
        !fromBox.hasSize ||
        !toBox.hasSize) {
      return;
    }

    // Coordinates are local to this painter, so it works inside any parent.
    final fromPos = paintBox.globalToLocal(fromBox.localToGlobal(Offset.zero));
    final toPos = paintBox.globalToLocal(toBox.localToGlobal(Offset.zero));
    final gap = widget.arrowConfig.gap;
    final fromIsAbove = fromPos.dy < toPos.dy;

    final from = Offset(
      fromPos.dx + fromBox.size.width / 2,
      fromIsAbove ? fromPos.dy + fromBox.size.height + gap : fromPos.dy - gap,
    );
    final to = Offset(
      toPos.dx + toBox.size.width / 2,
      fromIsAbove ? toPos.dy - gap : toPos.dy + toBox.size.height + gap,
    );

    if (from != _from || to != _to) {
      setState(() {
        _from = from;
        _to = to;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Zero sized: the arrow is painted outside the box, in coordinates
    // relative to its top-left corner.
    return IgnorePointer(
      child: CustomPaint(
        key: _paintKey,
        painter: _PentaDrawArrowPainter(
          from: _from,
          to: _to,
          arrowConfig: widget.arrowConfig,
        ),
      ),
    );
  }
}
