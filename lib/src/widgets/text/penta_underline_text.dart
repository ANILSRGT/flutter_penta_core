import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Rich text whose underline offset, color and thickness can be tuned per
/// span (unlike [TextDecoration.underline]).
class PentaUnderlineText extends StatefulWidget {
  const PentaUnderlineText({
    required this.children,
    super.key,
    this.offset = 1,
    this.underlineColor,
    this.underlineThickness,
    this.textColor,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.onTap,
  });

  final List<PentaUnderlineTextSpan> children;

  /// Gap between the text baseline box and the underline.
  final double offset;
  final Color? underlineColor;

  /// Line thickness. Defaults to 10% of the font size.
  final double? underlineThickness;
  final Color? textColor;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final VoidCallback? onTap;

  @override
  State<PentaUnderlineText> createState() => _PentaUnderlineTextState();
}

class _PentaUnderlineTextState extends State<PentaUnderlineText> {
  final List<TapGestureRecognizer> _recognizers = [];

  void _disposeRecognizers() {
    for (final recognizer in _recognizers) {
      recognizer.dispose();
    }
    _recognizers.clear();
  }

  @override
  void dispose() {
    _disposeRecognizers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _disposeRecognizers();
    final baseStyle = DefaultTextStyle.of(context).style.merge(widget.style);

    final textSpan = TextSpan(
      style: baseStyle,
      children: [
        for (final span in widget.children)
          TextSpan(
            text: span.text,
            recognizer: span.onTap == null
                ? null
                : (TapGestureRecognizer()..onTap = span.onTap).also(
                    _recognizers.add,
                  ),
            style: baseStyle
                .merge(span.style)
                .copyWith(
                  decoration: TextDecoration.none,
                  color: span.textColor ?? widget.textColor,
                ),
          ),
      ],
    );

    final textAlign = widget.textAlign ?? TextAlign.start;
    final textDirection = Directionality.of(context);
    final textScaler = MediaQuery.textScalerOf(context);

    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.translucent,
      child: CustomPaint(
        foregroundPainter: _UnderlinePainter(
          textSpan: textSpan,
          spans: widget.children,
          baseStyle: baseStyle,
          defaultColor:
              widget.underlineColor ??
              widget.textColor ??
              baseStyle.color ??
              Colors.black,
          defaultOffset: widget.offset,
          defaultThickness: widget.underlineThickness,
          textAlign: textAlign,
          textDirection: textDirection,
          textScaler: textScaler,
          maxLines: widget.maxLines,
        ),
        child: Text.rich(
          textSpan,
          textAlign: textAlign,
          textDirection: textDirection,
          textScaler: textScaler,
          maxLines: widget.maxLines,
          overflow: widget.overflow,
        ),
      ),
    );
  }
}

extension<T> on T {
  T also(void Function(T value) action) {
    action(this);
    return this;
  }
}

class _UnderlinePainter extends CustomPainter {
  const _UnderlinePainter({
    required this.textSpan,
    required this.spans,
    required this.baseStyle,
    required this.defaultColor,
    required this.defaultOffset,
    required this.textAlign,
    required this.textDirection,
    required this.textScaler,
    this.defaultThickness,
    this.maxLines,
  });

  final TextSpan textSpan;
  final List<PentaUnderlineTextSpan> spans;
  final TextStyle baseStyle;
  final Color defaultColor;
  final double defaultOffset;
  final double? defaultThickness;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final TextScaler textScaler;
  final int? maxLines;

  @override
  void paint(Canvas canvas, Size size) {
    final painter = TextPainter(
      text: textSpan,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaler: textScaler,
      maxLines: maxLines,
    )..layout(maxWidth: size.width);

    var start = 0;
    for (final span in spans) {
      final end = start + span.text.length;
      if (span.isUnderlined && span.text.trim().isNotEmpty) {
        final fontSize = baseStyle.merge(span.style).fontSize ?? 14;
        final paint = Paint()
          ..color = span.underlineColor ?? defaultColor
          ..strokeWidth =
              span.thickness ??
              defaultThickness ??
              textScaler.scale(fontSize) * .1
          ..style = PaintingStyle.stroke;

        final boxes = painter.getBoxesForSelection(
          TextSelection(baseOffset: start, extentOffset: end),
        );
        for (final box in boxes) {
          final y = box.bottom + (span.offset ?? defaultOffset);
          canvas.drawLine(Offset(box.left, y), Offset(box.right, y), paint);
        }
      }
      start = end;
    }
    painter.dispose();
  }

  @override
  bool shouldRepaint(_UnderlinePainter old) =>
      old.textSpan != textSpan ||
      old.defaultColor != defaultColor ||
      old.defaultOffset != defaultOffset ||
      old.defaultThickness != defaultThickness ||
      old.textAlign != textAlign ||
      old.textDirection != textDirection ||
      old.textScaler != textScaler ||
      old.maxLines != maxLines ||
      old.spans != spans;
}

/// A piece of [PentaUnderlineText].
@immutable
class PentaUnderlineTextSpan {
  const PentaUnderlineTextSpan({
    required this.text,
    this.isUnderlined = true,
    this.offset,
    this.underlineColor,
    this.thickness,
    this.textColor,
    this.style,
    this.onTap,
  });

  const PentaUnderlineTextSpan.underlined({
    required String text,
    double? offset,
    Color? underlineColor,
    double? thickness,
    TextStyle? style,
    Color? textColor,
    VoidCallback? onTap,
  }) : this(
         text: text,
         offset: offset,
         underlineColor: underlineColor,
         thickness: thickness,
         textColor: textColor,
         style: style,
         onTap: onTap,
       );

  const PentaUnderlineTextSpan.notUnderlined({
    required String text,
    Color? textColor,
    TextStyle? style,
    VoidCallback? onTap,
  }) : this(
         text: text,
         isUnderlined: false,
         textColor: textColor,
         style: style,
         onTap: onTap,
       );

  final String text;
  final bool isUnderlined;
  final double? offset;
  final Color? underlineColor;
  final double? thickness;
  final TextStyle? style;
  final Color? textColor;
  final VoidCallback? onTap;
}
