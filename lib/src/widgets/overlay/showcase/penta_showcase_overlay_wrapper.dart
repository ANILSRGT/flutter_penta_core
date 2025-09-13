part of 'penta_showcase.dart';

class PentaShowcaseOverlayWrapper extends StatelessWidget {
  PentaShowcaseOverlayWrapper({
    required this.child,
    required this.infoChild,
    required this.showcaseOpen,
    required this.layerLink,
    required this.showcaseKey,
    required this.showcaseChild,
    required this.infoAlign,
    super.key,
    this.onBarrierTap,
    this.arrowConfig = const PentaDrawArrowConfig(),
    this.updateEventBus,
  }) : infoKey = GlobalKey();

  final Widget child;
  final Widget infoChild;
  final bool showcaseOpen;
  final LayerLink layerLink;
  final GlobalKey showcaseKey;
  final Widget showcaseChild;
  final Alignment infoAlign;
  final VoidCallback? onBarrierTap;
  final GlobalKey infoKey;
  final PentaDrawArrowConfig arrowConfig;
  final PentaEventBus<void>? updateEventBus;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),

        if (showcaseOpen) ...[
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onBarrierTap,
            child: Container(
              color: Colors.black.withValues(alpha: 0.7),
            ),
          ),
          if (arrowConfig.visible)
            Positioned.fill(
              child: PentaDrawArrowCustomPaint(
                fromWidgetKey: showcaseKey,
                toWidgetKey: infoKey,
                arrowConfig: arrowConfig,
                updateEventBus: updateEventBus,
              ),
            ),

          SafeArea(
            child: Align(
              alignment: infoAlign,
              child: KeyedSubtree(
                key: infoKey,
                child: infoChild,
              ),
            ),
          ),

          CompositedTransformFollower(
            link: layerLink,
            child: showcaseChild,
          ),
        ],
      ],
    );
  }
}
