part of 'penta_draw_arrow_painter.dart';

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
  });

  final Color color;
  final Gradient? gradient;
  final PentaDrawArrowStyle style;
  final double strokeWidth;
  final double dashLength;
  final double dashSpace;
  final bool reverse;
  final Curve curve;
  final bool visible;
}
