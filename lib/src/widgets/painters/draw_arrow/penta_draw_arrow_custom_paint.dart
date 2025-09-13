part of 'penta_draw_arrow_painter.dart';

class PentaDrawArrowCustomPaint extends StatefulWidget {
  const PentaDrawArrowCustomPaint({
    required this.fromWidgetKey,
    required this.toWidgetKey,
    required this.arrowConfig,
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
  Offset? from;
  Offset? to;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updatePositions();
    });
    widget.updateEventBus?.on.listen((_) {
      _updatePositions();
    });
  }

  void _updatePositions() {
    final fromBox =
        widget.fromWidgetKey.currentContext?.findRenderObject() as RenderBox?;
    final toBox =
        widget.toWidgetKey.currentContext?.findRenderObject() as RenderBox?;

    if (fromBox != null && toBox != null) {
      final fromPos = fromBox.localToGlobal(Offset.zero);
      final toPos = toBox.localToGlobal(Offset.zero);

      final diffY = fromPos.dy - toPos.dy;

      setState(() {
        from = Offset(
          fromPos.dx + fromBox.size.width / 2,
          fromPos.dy + (diffY < 0 ? fromBox.size.height + 20 : -20),
        );
        to = Offset(
          toPos.dx + toBox.size.width / 2,
          toPos.dy + (diffY > 0 ? toBox.size.height + 20 : -20),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PentaDrawArrowPainter(
        from: from,
        to: to,
        arrowConfig: widget.arrowConfig,
      ),
    );
  }
}
