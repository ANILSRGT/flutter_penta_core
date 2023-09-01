import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'responsive_size.dart';

class Responsive extends StatelessWidget {
  final Map<ResponsiveSize, int> breakPoints;
  final Widget child;

  static final Map<ResponsiveSize, int> _breakPoints = {
    ResponsiveSize.sm: ResponsiveSize.sm.defaultBreakpointValue,
    ResponsiveSize.md: ResponsiveSize.md.defaultBreakpointValue,
    ResponsiveSize.lg: ResponsiveSize.lg.defaultBreakpointValue,
    ResponsiveSize.xl: ResponsiveSize.xl.defaultBreakpointValue,
    ResponsiveSize.xxl: ResponsiveSize.xxl.defaultBreakpointValue,
  };

  static int get smPoint => _breakPoints[ResponsiveSize.sm]!;
  static int get mdPoint => _breakPoints[ResponsiveSize.md]!;
  static int get lgPoint => _breakPoints[ResponsiveSize.lg]!;
  static int get xlPoint => _breakPoints[ResponsiveSize.xl]!;
  static int get xxlPoint => _breakPoints[ResponsiveSize.xxl]!;

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

  const Responsive({
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
