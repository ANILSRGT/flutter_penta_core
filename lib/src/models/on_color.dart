import 'package:flutter/material.dart';

/// A [Color] that also carries the color to draw on top of it.
class OnColor extends Color {
  OnColor({required Color value, required this.onColor})
    : super(value.toARGB32());

  final Color onColor;
}

/// [OnColor] pair for light and dark themes.
@immutable
class BrightnessOnColor {
  const BrightnessOnColor({required this.dark, required this.light});

  final OnColor dark;
  final OnColor light;

  OnColor byBrightness(bool isDark) => isDark ? dark : light;

  /// Picks the variant matching the current [Theme] brightness.
  OnColor of(BuildContext context) =>
      byBrightness(Theme.of(context).brightness == Brightness.dark);
}
