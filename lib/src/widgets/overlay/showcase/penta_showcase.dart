import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

part 'penta_showcase_overlay_wrapper.dart';

class PentaShowcase extends StatelessWidget {
  const PentaShowcase({
    required this.widget,
    required this.showcaseWidget,
    required this.layerLink,
    required this.showcaseKey,
    required this.showcaseOpen,
    super.key,
    this.arrowConfig = const PentaDrawArrowConfig(),
  });

  final Widget widget;
  final Widget showcaseWidget;
  final LayerLink layerLink;
  final GlobalKey showcaseKey;
  final PentaDrawArrowConfig arrowConfig;
  final bool showcaseOpen;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: Container(
        key: showcaseKey,
        child: AnimatedOpacity(
          opacity: showcaseOpen ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: widget,
        ),
      ),
    );
  }
}
