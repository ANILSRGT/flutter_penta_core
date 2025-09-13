part of 'penta_toast.dart';

/// Configuration class for toast settings
class PentaToastConfig {
  const PentaToastConfig({
    this.position = PentaToastPosition.bottomCenter,
    this.duration = const Duration(seconds: 3),
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.margin = 24,
    this.animationDuration = const Duration(milliseconds: 300),
    this.boxShadow,
    this.customAnimation,
    this.maxToasts = 2,
    this.delayBetweenToasts = const Duration(milliseconds: 500),
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) : textAlign = textAlign ?? TextAlign.center,
       style = style ?? const TextStyle(fontSize: 16, color: Colors.white),
       maxLines = maxLines ?? 1,
       overflow = overflow ?? TextOverflow.ellipsis;

  /// Position for toasts
  final PentaToastPosition position;

  /// Duration for toasts
  final Duration duration;

  /// Background color for toasts
  final Color? backgroundColor;

  /// Border radius for toasts
  final BorderRadius? borderRadius;

  /// Padding for toasts
  final EdgeInsetsGeometry? padding;

  /// Margin for toasts
  final double margin;

  /// Animation duration for toasts
  final Duration animationDuration;

  /// Shadow for toasts
  final List<BoxShadow>? boxShadow;

  /// Custom animation for toasts
  final Widget Function(Widget child)? customAnimation;

  /// Maximum number of toasts that can be shown simultaneously
  final int maxToasts;

  /// Delay between toasts
  final Duration delayBetweenToasts;

  /// Style for toasts
  final TextStyle style;

  /// Text align for toasts
  final TextAlign textAlign;

  /// Max lines for toasts
  final int maxLines;

  /// Overflow for toasts
  final TextOverflow overflow;

  PentaToastConfig copyWith({
    PentaToastPosition? position,
    Duration? duration,
    ValueGetter<Color?>? backgroundColor,
    ValueGetter<BorderRadius?>? borderRadius,
    ValueGetter<EdgeInsetsGeometry?>? padding,
    double? margin,
    Duration? animationDuration,
    ValueGetter<List<BoxShadow>?>? boxShadow,
    int? maxToasts,
    Duration? delayBetweenToasts,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return PentaToastConfig(
      position: position ?? this.position,
      duration: duration ?? this.duration,
      backgroundColor:
          backgroundColor != null ? backgroundColor() : this.backgroundColor,
      borderRadius: borderRadius != null ? borderRadius() : this.borderRadius,
      padding: padding != null ? padding() : this.padding,
      margin: margin ?? this.margin,
      animationDuration: animationDuration ?? this.animationDuration,
      boxShadow: boxShadow != null ? boxShadow() : this.boxShadow,
      customAnimation: customAnimation,
      maxToasts: maxToasts ?? this.maxToasts,
      delayBetweenToasts: delayBetweenToasts ?? this.delayBetweenToasts,
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
    );
  }
}
