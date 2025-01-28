part of 'number_ext.dart';

final class _NumberMathExt {
  const _NumberMathExt(num? value) : _value = value;

  final num? _value;

  /// Linearly interpolate between this number and [end] by [t].
  /// <br> The value of [t] is usually in the range of 0.0 to 1.0.
  /// <br> If [t] is 0.0, the result is this number.
  /// <br> If [t] is 1.0, the result is [end].
  double lerp(double end, double t) {
    final clampT = t.clamp(0.0, 1.0);
    return (_value ?? 0) + (end - (_value ?? 0)) * clampT;
  }
}
