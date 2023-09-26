import 'package:flutter/material.dart';

import 'penta_responsive.dart';

class PentaResponsiveWidget extends StatefulWidget {
  final Widget normal;
  final Widget? sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  final Widget? xxl;
  final bool asToMediaQuery;
  const PentaResponsiveWidget({
    super.key,
    required this.normal,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
    this.asToMediaQuery = true,
  });

  @override
  State<PentaResponsiveWidget> createState() => _PentaResponsiveWidgetState();
}

class _PentaResponsiveWidgetState extends State<PentaResponsiveWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    if (widget.asToMediaQuery) {
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
    if (widget.asToMediaQuery) {
      return PentaResponsive.withPlatformSize(
        normal: widget.normal,
        sm: widget.sm,
        md: widget.md,
        lg: widget.lg,
        xl: widget.xl,
        xxl: widget.xxl,
      );
    }

    return LayoutBuilder(
      builder: (ctx, constraints) {
        return PentaResponsive.withSize(
          constraints.biggest,
          normal: widget.normal,
          sm: widget.sm,
          md: widget.md,
          lg: widget.lg,
          xl: widget.xl,
          xxl: widget.xxl,
        );
      },
    );
  }
}
