import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'material_color_ext.dart';

extension ColorExt on Color {
  _ColorExt get ext => _ColorExt(this);
}

final class _ColorExt with _MaterialColorExt {
  const _ColorExt(Color color) : _color = color;

  @override
  final Color _color;
}
