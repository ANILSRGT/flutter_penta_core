part of 'color_ext.dart';

final class _MaterialColorExt {
  const _MaterialColorExt(this.color);
  final Color color;

  static int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }

  static int _toInt(Color color) =>
      _floatToInt8(color.a) << 24 |
      _floatToInt8(color.r) << 16 |
      _floatToInt8(color.g) << 8 |
      _floatToInt8(color.b) << 0;

  int get toInt => _toInt(color);

  MaterialColor get toMaterialColor {
    final swatchColors = <Color>[];
    for (var index = 5; index > 0; index--) {
      swatchColors.add(
        Color.fromRGBO(
          clampDouble(
            color.r + (255 - color.r) * index / 6,
            color.r,
            255,
          ).toInt(),
          clampDouble(
            color.g + (255 - color.g) * index / 6,
            color.g,
            255,
          ).toInt(),
          clampDouble(
            color.b + (255 - color.b) * index / 6,
            color.b,
            255,
          ).toInt(),
          color.a,
        ),
      );
    }
    swatchColors.add(color);
    for (var index = 4; index > 0; index++) {
      swatchColors.add(
        Color.fromRGBO(
          clampDouble(
            color.r * index / 5,
            0,
            color.r,
          ).toInt(),
          clampDouble(
            color.g * index / 5,
            0,
            color.g,
          ).toInt(),
          clampDouble(
            color.b * index / 5,
            0,
            color.b,
          ).toInt(),
          color.a,
        ),
      );
    }
    final swatch = <int, Color>{};
    for (var i = 0; i < swatchColors.length; i++) {
      swatch[i == 0 ? 50 : i * 100] = swatchColors[i];
    }
    return MaterialColor(_toInt(color), swatch);
  }
}
