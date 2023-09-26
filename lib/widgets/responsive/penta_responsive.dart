import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'penta_responsive_size.dart';

class PentaResponsive extends StatelessWidget {
  final Map<PentaResponsiveSize, int> breakPoints;
  final Widget child;

  static final Map<PentaResponsiveSize, int> _breakPoints = {
    PentaResponsiveSize.sm: PentaResponsiveSize.sm.defaultBreakpointValue,
    PentaResponsiveSize.md: PentaResponsiveSize.md.defaultBreakpointValue,
    PentaResponsiveSize.lg: PentaResponsiveSize.lg.defaultBreakpointValue,
    PentaResponsiveSize.xl: PentaResponsiveSize.xl.defaultBreakpointValue,
    PentaResponsiveSize.xxl: PentaResponsiveSize.xxl.defaultBreakpointValue,
  };

  static int get smPoint => _breakPoints[PentaResponsiveSize.sm]!;
  static int get mdPoint => _breakPoints[PentaResponsiveSize.md]!;
  static int get lgPoint => _breakPoints[PentaResponsiveSize.lg]!;
  static int get xlPoint => _breakPoints[PentaResponsiveSize.xl]!;
  static int get xxlPoint => _breakPoints[PentaResponsiveSize.xxl]!;

  static T withSize<T>(
    Size size, {
    required T normal,
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
  }) {
    if (size.width >= smPoint && size.width < mdPoint) {
      return sm ?? normal;
    } else if (size.width >= mdPoint && size.width < lgPoint) {
      return md ?? sm ?? normal;
    } else if (size.width >= lgPoint && size.width < xlPoint) {
      return lg ?? md ?? sm ?? normal;
    } else if (size.width >= xlPoint && size.width < xxlPoint) {
      return xl ?? lg ?? md ?? sm ?? normal;
    } else if (size.width >= xxlPoint) {
      return xxl ?? xl ?? lg ?? md ?? sm ?? normal;
    } else {
      return normal;
    }
  }

  static T withPlatformSize<T>({
    required T normal,
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
  }) {
    Size media = PlatformDispatcher.instance.views.first.physicalSize;
    return withSize(
      media,
      normal: normal,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
    );
  }

  const PentaResponsive({
    Key? key,
    required this.breakPoints,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    breakPoints.forEach((key, value) {
      _breakPoints[key] = value;
    });
    return child;
  }
}
