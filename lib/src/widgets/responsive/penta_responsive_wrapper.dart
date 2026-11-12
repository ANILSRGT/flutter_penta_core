import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/widgets.dart';
import 'package:penta_core/src/widgets/responsive/penta_breakpoints.dart';
import 'package:penta_core/src/widgets/responsive/penta_responsive_resolutions.dart';

/// Provides custom [PentaBreakpoints] to the subtree.
///
/// Widgets below read them with [PentaResponsiveWrapper.of] or
/// [PentaResponsiveWrapper.value]. Without a wrapper the defaults apply.
class PentaResponsiveWrapper extends StatelessWidget {
  /// Overrides individual breakpoints; the rest keep their defaults.
  PentaResponsiveWrapper({
    required Map<PentaResponsiveResolutions, num> breakPoints,
    required this.child,
    super.key,
  }) : breakpoints = PentaBreakpoints.fromMap(breakPoints);

  const PentaResponsiveWrapper.breakpoints({
    required this.breakpoints,
    required this.child,
    super.key,
  });

  final PentaBreakpoints breakpoints;
  final Widget child;

  /// Default breakpoints.
  static Map<PentaResponsiveResolutions, int> get defaultBreakPoints => {
    for (final r in PentaResponsiveResolutions.values)
      r: r.defaultBreakpointValue,
  };

  static int get smPoint =>
      PentaResponsiveResolutions.sm.defaultBreakpointValue;
  static int get mdPoint =>
      PentaResponsiveResolutions.md.defaultBreakpointValue;
  static int get lgPoint =>
      PentaResponsiveResolutions.lg.defaultBreakpointValue;
  static int get xlPoint =>
      PentaResponsiveResolutions.xl.defaultBreakpointValue;
  static int get xxlPoint =>
      PentaResponsiveResolutions.xxl.defaultBreakpointValue;

  /// Breakpoints of the nearest wrapper, or the defaults.
  static PentaBreakpoints of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<_PentaBreakpointsScope>()
          ?.breakpoints ??
      const PentaBreakpoints();

  /// Value for the current screen width using the nearest breakpoints.
  static T value<T>(
    BuildContext context, {
    required T normal,
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
  }) => of(context).select(
    MediaQuery.sizeOf(context).width,
    normal: normal,
    sm: sm,
    md: md,
    lg: lg,
    xl: xl,
    xxl: xxl,
  );

  /// Value for [size] (logical pixels).
  static T withSize<T>(
    Size size, {
    required T normal,
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
    PentaBreakpoints breakpoints = const PentaBreakpoints(),
  }) => breakpoints.select(
    size.width,
    normal: normal,
    sm: sm,
    md: md,
    lg: lg,
    xl: xl,
    xxl: xxl,
  );

  /// Value for the size of the first platform view (logical pixels).
  static T withPlatformSize<T>({
    required T normal,
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
    PentaBreakpoints breakpoints = const PentaBreakpoints(),
  }) {
    final view = PlatformDispatcher.instance.views.first;
    return withSize(
      view.physicalSize / view.devicePixelRatio,
      normal: normal,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
      breakpoints: breakpoints,
    );
  }

  @override
  Widget build(BuildContext context) =>
      _PentaBreakpointsScope(breakpoints: breakpoints, child: child);
}

/// [PentaResponsiveWrapper] with the default breakpoints.
class DefaultPentaResponsiveWrapper extends PentaResponsiveWrapper {
  const DefaultPentaResponsiveWrapper({required super.child, super.key})
    : super.breakpoints(breakpoints: const PentaBreakpoints());
}

class _PentaBreakpointsScope extends InheritedWidget {
  const _PentaBreakpointsScope({
    required this.breakpoints,
    required super.child,
  });

  final PentaBreakpoints breakpoints;

  @override
  bool updateShouldNotify(_PentaBreakpointsScope oldWidget) =>
      breakpoints != oldWidget.breakpoints;
}
