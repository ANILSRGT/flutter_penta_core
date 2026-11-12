import 'package:flutter/material.dart';

/// Gives access to [ColorExt] through `color.ext`.
extension ColorExtension on Color {
  ColorExt get ext => ColorExt(this);
}

extension type const ColorExt(Color _color) {
  /// 32-bit ARGB value.
  int get toInt => _color.toARGB32();

  /// `#AARRGGBB` (or `#RRGGBB` when [includeAlpha] is false).
  String toHex({bool includeAlpha = true, bool leadingHash = true}) {
    final argb = _color.toARGB32().toRadixString(16).padLeft(8, '0');
    final hex = includeAlpha ? argb : argb.substring(2);
    return '${leadingHash ? '#' : ''}${hex.toUpperCase()}';
  }

  /// Mixes the color with white by [amount] (0..1).
  Color lighten([double amount = .1]) => Color.lerp(
    _color,
    const Color(0xFFFFFFFF),
    amount.clamp(0, 1),
  )!.withValues(alpha: _color.a);

  /// Mixes the color with black by [amount] (0..1).
  Color darken([double amount = .1]) => Color.lerp(
    _color,
    const Color(0xFF000000),
    amount.clamp(0, 1),
  )!.withValues(alpha: _color.a);

  /// Whether the color is perceived as dark.
  bool get isDark =>
      ThemeData.estimateBrightnessForColor(_color) == Brightness.dark;

  /// Readable foreground color (black or white) for this background.
  Color get onColor => isDark ? Colors.white : Colors.black;

  /// Material swatch (50..900) generated around this color as the 500 shade.
  MaterialColor get toMaterialColor {
    const white = Color(0xFFFFFFFF);
    const black = Color(0xFF000000);
    Color tint(double t) => Color.lerp(_color, white, t)!;
    Color shade(double t) => Color.lerp(_color, black, t)!;

    return MaterialColor(_color.toARGB32(), <int, Color>{
      50: tint(.9),
      100: tint(.8),
      200: tint(.6),
      300: tint(.4),
      400: tint(.2),
      500: _color,
      600: shade(.1),
      700: shade(.2),
      800: shade(.3),
      900: shade(.4),
    });
  }
}
