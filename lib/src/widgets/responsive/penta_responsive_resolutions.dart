/// Width breakpoints, smallest first: `normal < sm < md < lg < xl < xxl`.
enum PentaResponsiveResolutions {
  sm(640),
  md(768),
  lg(1024),
  xl(1280),
  xxl(1536);

  const PentaResponsiveResolutions(this.defaultBreakpointValue);

  /// Minimum logical width of this resolution with the default breakpoints.
  final int defaultBreakpointValue;
}
