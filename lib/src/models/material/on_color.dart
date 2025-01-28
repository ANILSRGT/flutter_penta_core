import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class OnColor extends Color {
  OnColor({
    required Color value,
    required this.onColor,
  }) : super(value.ext.material.toInt);

  final Color onColor;
}

class BrightnessOnColor {
  BrightnessOnColor({
    required OnColor dark,
    required OnColor light,
  })  : _dark = dark,
        _light = light;

  final OnColor _dark;
  final OnColor _light;

  OnColor byBrightness(bool isDark) => isDark ? _dark : _light;
}
