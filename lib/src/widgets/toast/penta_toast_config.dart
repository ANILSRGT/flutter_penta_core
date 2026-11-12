part of 'penta_toast.dart';

/// Builds a custom enter / exit animation. [animation] runs 0 → 1 on enter
/// and 1 → 0 on exit.
typedef PentaToastAnimationBuilder =
    Widget Function(Widget child, Animation<double> animation);

/// Look and timing of toasts.
@immutable
class PentaToastConfig {
  const PentaToastConfig({
    this.position = PentaToastPosition.bottomCenter,
    this.duration = const Duration(seconds: 3),
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.margin = 24,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeOutCubic,
    this.boxShadow,
    this.customAnimation,
    this.maxToasts = 2,
    this.delayBetweenToasts = const Duration(milliseconds: 500),
    this.style = const TextStyle(fontSize: 16, color: Colors.white),
    this.textAlign = TextAlign.center,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.maxWidth = 560,
  }) : assert(maxToasts > 0, 'maxToasts must be greater than 0');

  final PentaToastPosition position;

  /// How long a toast stays fully visible.
  final Duration duration;

  /// Defaults to 80% opaque black.
  final Color? backgroundColor;

  /// Defaults to `BorderRadius.circular(8)`.
  final BorderRadius? borderRadius;

  /// Defaults to `EdgeInsets.symmetric(horizontal: 16, vertical: 12)`.
  final EdgeInsetsGeometry? padding;

  /// Distance from the screen edge.
  final double margin;
  final Duration animationDuration;
  final Curve animationCurve;
  final List<BoxShadow>? boxShadow;

  /// Replaces the default slide + fade animation.
  final PentaToastAnimationBuilder? customAnimation;

  /// Toasts kept at once (the visible one plus waiting ones). When the limit
  /// is exceeded the oldest waiting toast is dropped.
  final int maxToasts;

  /// Pause between two toasts.
  final Duration delayBetweenToasts;
  final TextStyle style;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;

  /// Maximum width of the toast box.
  final double maxWidth;

  PentaToastConfig copyWith({
    PentaToastPosition? position,
    Duration? duration,
    ValueGetter<Color?>? backgroundColor,
    ValueGetter<BorderRadius?>? borderRadius,
    ValueGetter<EdgeInsetsGeometry?>? padding,
    double? margin,
    Duration? animationDuration,
    Curve? animationCurve,
    ValueGetter<List<BoxShadow>?>? boxShadow,
    ValueGetter<PentaToastAnimationBuilder?>? customAnimation,
    int? maxToasts,
    Duration? delayBetweenToasts,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? maxWidth,
  }) {
    return PentaToastConfig(
      position: position ?? this.position,
      duration: duration ?? this.duration,
      backgroundColor: backgroundColor != null
          ? backgroundColor()
          : this.backgroundColor,
      borderRadius: borderRadius != null ? borderRadius() : this.borderRadius,
      padding: padding != null ? padding() : this.padding,
      margin: margin ?? this.margin,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      boxShadow: boxShadow != null ? boxShadow() : this.boxShadow,
      customAnimation: customAnimation != null
          ? customAnimation()
          : this.customAnimation,
      maxToasts: maxToasts ?? this.maxToasts,
      delayBetweenToasts: delayBetweenToasts ?? this.delayBetweenToasts,
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
      maxWidth: maxWidth ?? this.maxWidth,
    );
  }
}
