import 'package:flutter/widgets.dart';
import 'package:penta_core/src/widgets/responsive/penta_responsive_wrapper.dart';

enum PentaResponsiveSizeTypes {
  /// Size of the device screen (platform view).
  deviceSize,

  /// `MediaQuery` size of the current context.
  mediaQuery,

  /// `MediaQuery` size of [PentaResponsiveWidget.context].
  withContext,

  /// Width constraints given by the parent (`LayoutBuilder`).
  parentConstraints,
}

/// Picks a child by width: `normal < sm < md < lg < xl < xxl`.
///
/// A missing size falls back to the next smaller one. Breakpoints come from
/// the nearest [PentaResponsiveWrapper] (or the defaults).
class PentaResponsiveWidget extends StatelessWidget {
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
         'context must not be null when using '
         'PentaResponsiveSizeTypes.withContext',
       );

  final Widget normal;
  final Widget? sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  final Widget? xxl;
  final BuildContext? context;
  final PentaResponsiveSizeTypes sizeType;

  Widget _select(BuildContext context, double width) =>
      PentaResponsiveWrapper.of(
        context,
      ).select(width, normal: normal, sm: sm, md: md, lg: lg, xl: xl, xxl: xxl);

  @override
  Widget build(BuildContext context) => switch (sizeType) {
    PentaResponsiveSizeTypes.mediaQuery => _select(
      context,
      MediaQuery.sizeOf(context).width,
    ),
    PentaResponsiveSizeTypes.withContext => _select(
      context,
      MediaQuery.sizeOf(this.context!).width,
    ),
    PentaResponsiveSizeTypes.deviceSize => _DeviceWidthBuilder(
      builder: (width) => _select(context, width),
    ),
    PentaResponsiveSizeTypes.parentConstraints => LayoutBuilder(
      builder: (context, constraints) => _select(context, constraints.maxWidth),
    ),
  };
}

/// Rebuilds with the logical width of the platform view on metric changes.
class _DeviceWidthBuilder extends StatefulWidget {
  const _DeviceWidthBuilder({required this.builder});

  final Widget Function(double width) builder;

  @override
  State<_DeviceWidthBuilder> createState() => _DeviceWidthBuilderState();
}

class _DeviceWidthBuilderState extends State<_DeviceWidthBuilder>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final view = View.of(context);
    return widget.builder(view.physicalSize.width / view.devicePixelRatio);
  }
}
