part of 'penta_draw_arrow_painter.dart';

/// Appearance of the arrow drawn by [PentaDrawArrowCustomPaint].
@immutable
class PentaDrawArrowConfig {
  const PentaDrawArrowConfig({
    this.color = Colors.white,
    this.gradient,
    this.style = PentaDrawArrowStyle.solid,
    this.strokeWidth = 3.0,
    this.dashLength = 8.0,
    this.dashSpace = 4.0,
    this.reverse = false,
    this.curve = Curves.linear,
    this.visible = true,
    this.headLength = 15.0,
    this.headAngle = math.pi / 6,
    this.gap = 20.0,
  });

  final Color color;

  /// Overrides [color] when set.
  final Gradient? gradient;
  final PentaDrawArrowStyle style;
  final double strokeWidth;

  /// Dash and gap length for [PentaDrawArrowStyle.dotted].
  final double dashLength;
  final double dashSpace;

  /// When false the arrow points from the info widget to the target.
  final bool reverse;

  /// Horizontal easing of the path; vertical progress is linear.
  final Curve curve;
  final bool visible;

  /// Arrow head size and opening angle (radians).
  final double headLength;
  final double headAngle;

  /// Distance kept between the arrow ends and the widgets.
  final double gap;

  @override
  bool operator ==(Object other) =>
      other is PentaDrawArrowConfig &&
      other.color == color &&
      other.gradient == gradient &&
      other.style == style &&
      other.strokeWidth == strokeWidth &&
      other.dashLength == dashLength &&
      other.dashSpace == dashSpace &&
      other.reverse == reverse &&
      other.curve == curve &&
      other.visible == visible &&
      other.headLength == headLength &&
      other.headAngle == headAngle &&
      other.gap == gap;

  @override
  int get hashCode => Object.hash(
    color,
    gradient,
    style,
    strokeWidth,
    dashLength,
    dashSpace,
    reverse,
    curve,
    visible,
    headLength,
    headAngle,
    gap,
  );
}
