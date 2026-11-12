import 'package:flutter/material.dart';
import 'package:penta_core/src/utils/penta_event_bus.dart';
import 'package:penta_core/src/widgets/painters/draw_arrow/penta_draw_arrow_painter.dart';

part 'penta_showcase_overlay_wrapper.dart';

/// Marks a widget that [PentaShowcaseOverlayWrapper] can highlight.
///
/// While [showcaseOpen] is true the original [widget] fades out and
/// [showcaseWidget] is drawn above the dark barrier at the same position.
class PentaShowcase extends StatelessWidget {
  const PentaShowcase({
    required this.widget,
    required this.showcaseWidget,
    required this.layerLink,
    required this.showcaseKey,
    required this.showcaseOpen,
    super.key,
    this.arrowConfig = const PentaDrawArrowConfig(),
    this.fadeDuration = const Duration(milliseconds: 300),
  });

  /// The widget shown normally.
  final Widget widget;

  /// The widget shown above the barrier while the showcase is open.
  final Widget showcaseWidget;

  /// Links this target with the overlay; share it with the wrapper.
  final LayerLink layerLink;

  /// Identifies this target; share it with the wrapper.
  final GlobalKey showcaseKey;
  final bool showcaseOpen;
  final PentaDrawArrowConfig arrowConfig;
  final Duration fadeDuration;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: KeyedSubtree(
        key: showcaseKey,
        child: AnimatedOpacity(
          opacity: showcaseOpen ? 0 : 1,
          duration: fadeDuration,
          child: widget,
        ),
      ),
    );
  }
}
