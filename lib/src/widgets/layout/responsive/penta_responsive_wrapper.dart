import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/src/widgets/layout/responsive/penta_responsive_resolutions.dart';

class PentaResponsiveWrapper extends StatelessWidget {
  const PentaResponsiveWrapper({
    required this.breakPoints,
    required this.child,
    super.key,
  });
  final Map<PentaResponsiveResolutions, int> breakPoints;
  final Widget child;

  static Map<PentaResponsiveResolutions, int> get defaultBreakPoints => {
        PentaResponsiveResolutions.sm:
            PentaResponsiveResolutions.sm.defaultBreakpointValue,
        PentaResponsiveResolutions.md:
            PentaResponsiveResolutions.md.defaultBreakpointValue,
        PentaResponsiveResolutions.lg:
            PentaResponsiveResolutions.lg.defaultBreakpointValue,
        PentaResponsiveResolutions.xl:
            PentaResponsiveResolutions.xl.defaultBreakpointValue,
        PentaResponsiveResolutions.xxl:
            PentaResponsiveResolutions.xxl.defaultBreakpointValue,
      };

  static int get smPoint => defaultBreakPoints[PentaResponsiveResolutions.sm]!;
  static int get mdPoint => defaultBreakPoints[PentaResponsiveResolutions.md]!;
  static int get lgPoint => defaultBreakPoints[PentaResponsiveResolutions.lg]!;
  static int get xlPoint => defaultBreakPoints[PentaResponsiveResolutions.xl]!;
  static int get xxlPoint =>
      defaultBreakPoints[PentaResponsiveResolutions.xxl]!;

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
    final media = PlatformDispatcher.instance.views.first.physicalSize;
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

  @override
  Widget build(BuildContext context) {
    breakPoints.forEach((key, value) {
      defaultBreakPoints[key] = value;
    });
    return child;
  }
}

/// Default PentaResponsiveWrapper with default breakpoints
/// [PentaResponsiveResolutions.sm] = 576
/// [PentaResponsiveResolutions.md] = 768
/// [PentaResponsiveResolutions.lg] = 992
/// [PentaResponsiveResolutions.xl] = 1200
/// [PentaResponsiveResolutions.xxl] = 1400
class DefaultPentaResponsiveWrapper extends PentaResponsiveWrapper {
  DefaultPentaResponsiveWrapper({
    required super.child,
    super.key,
  }) : super(
          breakPoints: PentaResponsiveWrapper.defaultBreakPoints,
        );
}
