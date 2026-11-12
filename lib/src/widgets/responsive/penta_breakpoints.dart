import 'package:flutter/foundation.dart';
import 'package:penta_core/src/widgets/responsive/penta_responsive_resolutions.dart';

/// Minimum logical widths of each [PentaResponsiveResolutions].
@immutable
final class PentaBreakpoints {
  const PentaBreakpoints({
    this.sm = 640,
    this.md = 768,
    this.lg = 1024,
    this.xl = 1280,
    this.xxl = 1536,
  }) : assert(
         sm <= md && md <= lg && lg <= xl && xl <= xxl,
         'Breakpoints must be in ascending order',
       );

  /// Defaults, with [overrides] applied.
  factory PentaBreakpoints.fromMap(
    Map<PentaResponsiveResolutions, num> overrides,
  ) {
    double value(PentaResponsiveResolutions r) =>
        (overrides[r] ?? r.defaultBreakpointValue).toDouble();
    return PentaBreakpoints(
      sm: value(PentaResponsiveResolutions.sm),
      md: value(PentaResponsiveResolutions.md),
      lg: value(PentaResponsiveResolutions.lg),
      xl: value(PentaResponsiveResolutions.xl),
      xxl: value(PentaResponsiveResolutions.xxl),
    );
  }

  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;

  double operator [](PentaResponsiveResolutions resolution) =>
      switch (resolution) {
        PentaResponsiveResolutions.sm => sm,
        PentaResponsiveResolutions.md => md,
        PentaResponsiveResolutions.lg => lg,
        PentaResponsiveResolutions.xl => xl,
        PentaResponsiveResolutions.xxl => xxl,
      };

  /// Resolution for [width], or `null` when it is below [sm] ("normal").
  PentaResponsiveResolutions? resolve(double width) {
    if (width >= xxl) return PentaResponsiveResolutions.xxl;
    if (width >= xl) return PentaResponsiveResolutions.xl;
    if (width >= lg) return PentaResponsiveResolutions.lg;
    if (width >= md) return PentaResponsiveResolutions.md;
    if (width >= sm) return PentaResponsiveResolutions.sm;
    return null;
  }

  /// Value for [width]. A missing value falls back to the next smaller one,
  /// ending at [normal].
  T select<T>(
    double width, {
    required T normal,
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
  }) => switch (resolve(width)) {
    null => normal,
    PentaResponsiveResolutions.sm => sm ?? normal,
    PentaResponsiveResolutions.md => md ?? sm ?? normal,
    PentaResponsiveResolutions.lg => lg ?? md ?? sm ?? normal,
    PentaResponsiveResolutions.xl => xl ?? lg ?? md ?? sm ?? normal,
    PentaResponsiveResolutions.xxl => xxl ?? xl ?? lg ?? md ?? sm ?? normal,
  };

  @override
  bool operator ==(Object other) =>
      other is PentaBreakpoints &&
      other.sm == sm &&
      other.md == md &&
      other.lg == lg &&
      other.xl == xl &&
      other.xxl == xxl;

  @override
  int get hashCode => Object.hash(sm, md, lg, xl, xxl);
}
