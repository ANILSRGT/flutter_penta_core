part of 'penta_showcase.dart';

/// Dims [child] and highlights the [PentaShowcase] identified by
/// [showcaseKey], with [infoChild] and an arrow pointing at it.
class PentaShowcaseOverlayWrapper extends StatefulWidget {
  const PentaShowcaseOverlayWrapper({
    required this.child,
    required this.infoChild,
    required this.layerLink,
    required this.showcaseKey,
    required this.infoAlign,
    required this.showcaseOpen,
    super.key,
    this.onBarrierTap,
    this.arrowConfig = const PentaDrawArrowConfig(),
    this.updateEventBus,
    this.barrierColor = const Color(0xB3000000),
  });

  final Widget child;
  final Widget infoChild;
  final LayerLink layerLink;
  final bool showcaseOpen;
  final GlobalKey showcaseKey;
  final Alignment infoAlign;
  final VoidCallback? onBarrierTap;
  final PentaDrawArrowConfig arrowConfig;

  /// Fire it to re-measure the arrow (e.g. after the target scrolls).
  final PentaEventBus<void>? updateEventBus;
  final Color barrierColor;

  @override
  State<PentaShowcaseOverlayWrapper> createState() =>
      _PentaShowcaseOverlayWrapperState();
}

class _PentaShowcaseOverlayWrapperState
    extends State<PentaShowcaseOverlayWrapper> {
  final GlobalKey _infoKey = GlobalKey();
  Widget? _showcaseWidget;

  @override
  void initState() {
    super.initState();
    _scheduleLookup();
  }

  @override
  void didUpdateWidget(covariant PentaShowcaseOverlayWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.showcaseKey != widget.showcaseKey ||
        oldWidget.showcaseOpen != widget.showcaseOpen) {
      _scheduleLookup();
    }
  }

  void _scheduleLookup() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final showcase = widget.showcaseKey.currentContext
          ?.findAncestorWidgetOfExactType<PentaShowcase>();
      if (showcase?.showcaseWidget != _showcaseWidget) {
        setState(() => _showcaseWidget = showcase?.showcaseWidget);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: widget.child),
        if (widget.showcaseOpen) ...[
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.onBarrierTap,
              child: ColoredBox(color: widget.barrierColor),
            ),
          ),
          if (widget.arrowConfig.visible)
            PentaDrawArrowCustomPaint(
              fromWidgetKey: widget.showcaseKey,
              toWidgetKey: _infoKey,
              arrowConfig: widget.arrowConfig,
              updateEventBus: widget.updateEventBus,
            ),
          SafeArea(
            child: Align(
              alignment: widget.infoAlign,
              child: KeyedSubtree(key: _infoKey, child: widget.infoChild),
            ),
          ),
          if (_showcaseWidget != null)
            CompositedTransformFollower(
              link: widget.layerLink,
              showWhenUnlinked: false,
              child: _showcaseWidget,
            ),
        ],
      ],
    );
  }
}
