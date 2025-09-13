import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

part 'penta_draw_arrow_config.dart';
part 'penta_draw_arrow_style.dart';
part 'penta_draw_arrow_custom_paint.dart';

class _PentaDrawArrowPainter extends CustomPainter {
  _PentaDrawArrowPainter({
    required this.from,
    required this.to,
    required this.arrowConfig,
  });

  final Offset? from;
  final Offset? to;
  final PentaDrawArrowConfig arrowConfig;

  @override
  void paint(Canvas canvas, Size size) {
    if (from == null || to == null) return;

    // If you used 'reverse' earlier, keep same semantic:
    final start = arrowConfig.reverse ? from! : to!;
    final end = arrowConfig.reverse ? to! : from!;

    final paint =
        Paint()
          ..strokeWidth = arrowConfig.strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    if (arrowConfig.gradient != null) {
      final rect = Rect.fromPoints(start, end);
      paint.shader = arrowConfig.gradient!.createShader(rect);
    } else {
      paint.color = arrowConfig.color;
    }

    final curveDirection = _drawArrowLine(canvas, start, end, paint);

    // Arrow head
    const arrowHeadLength = 15.0;
    const arrowHeadAngle = math.pi / 6;

    final arrowHead1 = Offset(
      end.dx - math.cos(curveDirection - arrowHeadAngle) * arrowHeadLength,
      end.dy - math.sin(curveDirection - arrowHeadAngle) * arrowHeadLength,
    );
    final arrowHead2 = Offset(
      end.dx - math.cos(curveDirection + arrowHeadAngle) * arrowHeadLength,
      end.dy - math.sin(curveDirection + arrowHeadAngle) * arrowHeadLength,
    );

    canvas
      ..drawLine(end, arrowHead1, paint)
      ..drawLine(end, arrowHead2, paint);
  }

  double _drawArrowLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    const int steps = 100;
    final curveValues = List.generate(
      steps,
      (i) => arrowConfig.curve.transform(i / (steps - 1)),
    );

    final points = List<Offset>.generate(steps, (i) {
      final tCurve = curveValues[i];
      final dx = (end.dx - start.dx) * tCurve + start.dx;
      final dy = (end.dy - start.dy) * (i / (steps - 1)) + start.dy;
      return Offset(dx, dy);
    });

    if (arrowConfig.style == PentaDrawArrowStyle.dotted) {
      _drawDottedPath(canvas, points, paint);
    } else {
      final path = Path()..moveTo(points.first.dx, points.first.dy);
      for (var i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
      canvas.drawPath(path, paint);
    }

    if (points.length >= 2) {
      final last = points.last;
      final prev = points[points.length - 2];
      return (last - prev).direction;
    }

    return (end - start).direction;
  }

  void _drawDottedPath(Canvas canvas, List<Offset> points, Paint paint) {
    if (points.length < 2) return;

    final dashLength = arrowConfig.dashLength;
    final dashSpace = arrowConfig.dashSpace;

    var drawing = true;
    var currentDistance = 0.0;
    var targetDistance = dashLength;

    for (var i = 0; i < points.length - 1; i++) {
      final a = points[i];
      final b = points[i + 1];
      final segLen = (b - a).distance;
      if (segLen == 0) continue;

      var traveled = 0.0;
      var safety = 0;
      while (traveled < segLen - 1e-9 && safety < 2000) {
        safety++;
        final remainingToTarget = targetDistance - currentDistance;
        final take = math.min(remainingToTarget, segLen - traveled);

        final tStart = traveled / segLen;
        final tEnd = (traveled + take) / segLen;

        final pStart = Offset.lerp(a, b, tStart)!;
        final pEnd = Offset.lerp(a, b, tEnd)!;

        if (drawing) canvas.drawLine(pStart, pEnd, paint);

        currentDistance += (pEnd - pStart).distance;
        traveled += take;

        if (currentDistance >= targetDistance - 1e-9) {
          drawing = !drawing;
          targetDistance = drawing ? dashLength : dashSpace;
          currentDistance = 0.0;
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _PentaDrawArrowPainter old) {
    return old.from != from || old.to != to || old.arrowConfig != arrowConfig;
  }
}
