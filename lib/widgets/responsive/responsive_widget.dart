import 'package:flutter/material.dart';

import 'responsive.dart';

class ResponsiveWidget extends StatefulWidget {
  final Widget normal;
  final Widget? sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  final Widget? xxl;
  final bool asToMediaQuery;
  const ResponsiveWidget({
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
  State<ResponsiveWidget> createState() => _ResponsiveWidgetState();
}

class _ResponsiveWidgetState extends State<ResponsiveWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.asToMediaQuery) {
      return Responsive.withPlatformSize(
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
        return Responsive.withSize(
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
