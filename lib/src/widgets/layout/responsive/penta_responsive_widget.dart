import 'package:flutter/material.dart';

import 'package:penta_core/src/widgets/layout/responsive/penta_responsive_wrapper.dart';

enum PentaResponsiveSizeTypes { deviceSize, mediaQuery, withContext }

/// normal < sm < md < lg < xl < xxl
/// <br>if [PentaResponsiveSizeTypes.deviceSize] is used, the widget will be
/// responsive to the device size
/// <br>if [PentaResponsiveSizeTypes.withContext] is used, the widget will be
/// responsive to the context size
/// <br>if [PentaResponsiveSizeTypes.mediaQuery] is used, the widget will be
/// responsive to the media query size of parent widget
class PentaResponsiveWidget extends StatefulWidget {
  const PentaResponsiveWidget({
    required this.normal,
    super.key,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
    this.context,
    this.sizeType = PentaResponsiveSizeTypes.mediaQuery,
  }) : assert(
          sizeType != PentaResponsiveSizeTypes.withContext || context != null,
          'context must not be null when using PentaResponsiveSizeTypes.withContext',
        );

  final Widget normal;
  final Widget? sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  final Widget? xxl;
  final BuildContext? context;
  final PentaResponsiveSizeTypes sizeType;

  @override
  State<PentaResponsiveWidget> createState() => _PentaResponsiveWidgetState();
}

class _PentaResponsiveWidgetState extends State<PentaResponsiveWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    if (widget.sizeType == PentaResponsiveSizeTypes.deviceSize) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void didChangeMetrics() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sizeType == PentaResponsiveSizeTypes.deviceSize) {
      return PentaResponsiveWrapper.withPlatformSize(
        normal: widget.normal,
        sm: widget.sm,
        md: widget.md,
        lg: widget.lg,
        xl: widget.xl,
        xxl: widget.xxl,
      );
    }

    if (widget.sizeType == PentaResponsiveSizeTypes.withContext) {
      final mediaQuerySize = MediaQuery.of(widget.context!).size;
      return PentaResponsiveWrapper.withSize(
        mediaQuerySize,
        normal: widget.normal,
        sm: widget.sm,
        md: widget.md,
        lg: widget.lg,
        xl: widget.xl,
        xxl: widget.xxl,
      );
    }

    final mediaQuerySize = MediaQuery.of(context).size;
    return PentaResponsiveWrapper.withSize(
      mediaQuerySize,
      normal: widget.normal,
      sm: widget.sm,
      md: widget.md,
      lg: widget.lg,
      xl: widget.xl,
      xxl: widget.xxl,
    );
  }
}
