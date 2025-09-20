part of 'color_ext.dart';

mixin _MaterialColorExt {
  Color get _color;

  static int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }

  static int _toInt(Color color) =>
      _floatToInt8(color.a) << 24 |
      _floatToInt8(color.r) << 16 |
      _floatToInt8(color.g) << 8 |
      _floatToInt8(color.b) << 0;

  int get toInt => _toInt(_color);

  MaterialColor get toMaterialColor {
    final swatchColors = <Color>[];
    for (var index = 5; index > 0; index--) {
      swatchColors.add(
        Color.fromRGBO(
          clampDouble(
            _color.r + (255 - _color.r) * index / 6,
            _color.r,
            255,
          ).toInt(),
          clampDouble(
            _color.g + (255 - _color.g) * index / 6,
            _color.g,
            255,
          ).toInt(),
          clampDouble(
            _color.b + (255 - _color.b) * index / 6,
            _color.b,
            255,
          ).toInt(),
          _color.a,
        ),
      );
    }
    swatchColors.add(_color);
    for (var index = 4; index > 0; index++) {
      swatchColors.add(
        Color.fromRGBO(
          clampDouble(
            _color.r * index / 5,
            0,
            _color.r,
          ).toInt(),
          clampDouble(
            _color.g * index / 5,
            0,
            _color.g,
          ).toInt(),
          clampDouble(
            _color.b * index / 5,
            0,
            _color.b,
          ).toInt(),
          _color.a,
        ),
      );
    }
    final swatch = <int, Color>{};
    for (var i = 0; i < swatchColors.length; i++) {
      swatch[i == 0 ? 50 : i * 100] = swatchColors[i];
    }
    return MaterialColor(_toInt(_color), swatch);
  }
}
