import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PentaUnderlineText extends StatelessWidget {
  const PentaUnderlineText({
    required this.children,
    super.key,
    this.offset = 1,
    this.underlineColor,
    this.textColor,
    this.style,
    this.textAlign,
    this.onTap,
  });

  final List<PentaUnderlineTextSpan> children;
  final double offset;
  final Color? underlineColor;
  final Color? textColor;
  final TextStyle? style;
  final TextAlign? textAlign;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? DefaultTextStyle.of(context).style;

    final textSpan = TextSpan(
      children:
          children.map((e) {
            return TextSpan(
              recognizer:
                  e.onTap != null
                      ? (TapGestureRecognizer()..onTap = e.onTap)
                      : null,
              text: e.text,
              style: effectiveStyle
                  .merge(e.style)
                  .copyWith(
                    decoration: TextDecoration.none,
                    color: e.textColor ?? textColor,
                  ),
            );
          }).toList(),
    );

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: CustomPaint(
        painter: _UnderlinePainter(
          textSpan: textSpan,
          children: children,
          defaultStyle: effectiveStyle,
          defaultColor:
              underlineColor ??
              textColor ??
              effectiveStyle.color ??
              Colors.black,
          defaultOffset: offset,
          textAlign: textAlign,
        ),
        child: Text.rich(textSpan, textAlign: textAlign),
      ),
    );
  }
}

class _UnderlinePainter extends CustomPainter {
  const _UnderlinePainter({
    required this.textSpan,
    required this.children,
    required this.defaultStyle,
    required this.defaultColor,
    required this.defaultOffset,
    this.textAlign,
  });

  final TextSpan textSpan;
  final List<PentaUnderlineTextSpan> children;
  final TextStyle defaultStyle;
  final Color defaultColor;
  final double defaultOffset;
  final TextAlign? textAlign;

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: textAlign ?? TextAlign.start,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width);

    var start = 0.0;
    for (var i = 0; i < children.length; i++) {
      final span = children[i];
      final spanText = span.text;
      final spanStyle = defaultStyle.merge(span.style);
      final textLength = spanText.length;

      if (span.isUnderlined && spanText.trim().isNotEmpty) {
        final boxes = textPainter.getBoxesForSelection(
          TextSelection(
            baseOffset: start.toInt(),
            extentOffset: (start + textLength).toInt(),
          ),
        );

        for (final box in boxes) {
          final y = box.bottom + (span.offset ?? defaultOffset);
          final paint =
              Paint()
                ..color = span.underlineColor ?? defaultColor
                ..strokeWidth = (spanStyle.fontSize ?? 14) * 0.1
                ..style = PaintingStyle.stroke;

          canvas.drawLine(Offset(box.left, y), Offset(box.right, y), paint);
        }
      }

      start += textLength;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PentaUnderlineTextSpan {
  const PentaUnderlineTextSpan._({
    required this.text,
    this.isUnderlined = true,
    this.offset,
    this.textColor,
    this.underlineColor,
    this.style,
    this.textAlign,
    this.onTap,
  });

  const PentaUnderlineTextSpan.underlined({
    required String text,
    double? offset,
    Color? underlineColor,
    TextStyle? style,
    Color? textColor,
    TextAlign? textAlign,
    VoidCallback? onTap,
  }) : this._(
         text: text,
         isUnderlined: true,
         offset: offset,
         underlineColor: underlineColor,
         textColor: textColor,
         style: style,
         textAlign: textAlign,
         onTap: onTap,
       );

  const PentaUnderlineTextSpan.notUnderlined({
    required String text,
    double? offset,
    Color? underlineColor,
    Color? textColor,
    TextStyle? style,
    TextAlign? textAlign,
    VoidCallback? onTap,
  }) : this._(
         text: text,
         isUnderlined: false,
         offset: offset,
         underlineColor: underlineColor,
         textColor: textColor,
         style: style,
         textAlign: textAlign,
         onTap: onTap,
       );

  final String text;
  final double? offset;
  final Color? underlineColor;
  final TextStyle? style;
  final Color? textColor;
  final TextAlign? textAlign;
  final bool isUnderlined;
  final VoidCallback? onTap;
}
