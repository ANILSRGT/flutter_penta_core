part of 'penta_showcase.dart';

class PentaShowcaseOverlayWrapper extends StatefulWidget {
  PentaShowcaseOverlayWrapper({
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
  }) : infoKey = GlobalKey();

  final Widget child;
  final Widget infoChild;
  final LayerLink layerLink;
  final bool showcaseOpen;
  final GlobalKey showcaseKey;
  final Alignment infoAlign;
  final VoidCallback? onBarrierTap;
  final GlobalKey infoKey;
  final PentaDrawArrowConfig arrowConfig;
  final PentaEventBus<void>? updateEventBus;

  @override
  State<PentaShowcaseOverlayWrapper> createState() =>
      _PentaShowcaseOverlayWrapperState();
}

class _PentaShowcaseOverlayWrapperState
    extends State<PentaShowcaseOverlayWrapper> {
  Widget? showcaseWidget;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showcaseWidget = _getShowcaseWidget();
      setState(() {});
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
              behavior: HitTestBehavior.translucent,
              onTap: widget.onBarrierTap,
              child: Container(
                color: Colors.black.withValues(alpha: 0.7),
              ),
            ),
          ),
          if (widget.arrowConfig.visible)
            PentaDrawArrowCustomPaint(
              fromWidgetKey: widget.showcaseKey,
              toWidgetKey: widget.infoKey,
              arrowConfig: widget.arrowConfig,
              updateEventBus: widget.updateEventBus,
            ),

          SafeArea(
            child: Align(
              alignment: widget.infoAlign,
              child: KeyedSubtree(
                key: widget.infoKey,
                child: widget.infoChild,
              ),
            ),
          ),

          if (showcaseWidget != null)
            CompositedTransformFollower(
              link: widget.layerLink,
              child: showcaseWidget,
            ),
        ],
      ],
    );
  }

  /// GlobalKey'den PentaShowcase widget'ına ulaşıp showcaseWidget'ı döndürür
  Widget? _getShowcaseWidget() {
    final context = widget.showcaseKey.currentContext;
    if (context == null) return null;

    final state = context.findAncestorWidgetOfExactType<PentaShowcase>();
    if (state == null) return null;

    return state.showcaseWidget;
  }
}
