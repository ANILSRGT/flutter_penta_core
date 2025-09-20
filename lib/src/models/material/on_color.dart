import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class OnColor extends Color {
  OnColor({required Color value, required this.onColor})
    : super(value.ext.toInt);

  final Color onColor;
}

class BrightnessOnColor {
  BrightnessOnColor({required this.dark, required this.light});

  final OnColor dark;
  final OnColor light;

  OnColor byBrightness(bool isDark) => isDark ? dark : light;
}
