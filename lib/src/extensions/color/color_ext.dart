import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'material_color_ext.dart';

extension ColorExt on Color {
  _ColorExt get ext => _ColorExt(this);
}

final class _ColorExt {
  const _ColorExt(Color color) : _color = color;

  final Color _color;

  _MaterialColorExt get material => _MaterialColorExt(_color);
}
