import 'package:flutter/widgets.dart';

/// Gives access to [NumExt] through `number.ext`.
extension NumExtension on num {
  NumExt get ext => NumExt(this);
}

/// Gives access to [IntExt] through `integer.ext`.
extension IntExtension on int {
  IntExt get ext => IntExt(this);
}

extension type const NumExt(num _value) {
  /// Linear interpolation between this value and [end] by [t] (clamped 0..1).
  double lerp(double end, double t) {
    final clampT = t.clamp(0.0, 1.0);
    return _value + (end - _value) * clampT;
  }

  /// Maps the value from range [inMin]..[inMax] to [outMin]..[outMax].
  double remap(num inMin, num inMax, num outMin, num outMax) {
    if (inMax == inMin) return outMin.toDouble();
    return outMin + (_value - inMin) * (outMax - outMin) / (inMax - inMin);
  }

  /// Whether the value is between [min] and [max] (inclusive).
  bool isBetween(num min, num max) => _value >= min && _value <= max;

  /// Compact notation: `1500` → `1.5K`, `2300000` → `2.3M`.
  ///
  /// Turkish suffixes are used when [locale] language is `tr`.
  String formatShort({Locale? locale, int fractionDigits = 1}) {
    const suffixesByLanguage = <String, List<String>>{
      'en': ['', 'K', 'M', 'B', 'T', 'Q'],
      'tr': ['', 'B', 'Mn', 'Mr', 'Tr', 'Ktr'],
    };
    final suffixes =
        suffixesByLanguage[locale?.languageCode] ?? suffixesByLanguage['en']!;

    final sign = _value < 0 ? '-' : '';
    var number = _value.abs().toDouble();
    var index = 0;
    while (number >= 1000 && index < suffixes.length - 1) {
      number /= 1000;
      index++;
    }

    var text = number.toStringAsFixed(fractionDigits);
    // Rounding can produce "1000.0" – promote to the next suffix.
    if (double.parse(text) >= 1000 && index < suffixes.length - 1) {
      number /= 1000;
      index++;
      text = number.toStringAsFixed(fractionDigits);
    }
    if (text.contains('.')) {
      text = text.replaceFirst(RegExp(r'\.?0+$'), '');
    }
    return '$sign$text${suffixes[index]}';
  }

  /// `Duration` in milliseconds.
  Duration get milliseconds => Duration(microseconds: (_value * 1000).round());

  /// `Duration` in seconds.
  Duration get seconds =>
      Duration(microseconds: (_value * Duration.microsecondsPerSecond).round());

  /// `Duration` in minutes.
  Duration get minutes =>
      Duration(microseconds: (_value * Duration.microsecondsPerMinute).round());
}

extension type const IntExt(int _value) implements NumExt {
  /// Number of digits, ignoring the sign.
  int get digitsCount => _value == 0 ? 1 : _value.abs().toString().length;
}
