import 'package:flutter/material.dart';

part 'calc_int_ext.dart';
part 'converter_int_ext.dart';

extension IntExt on int {
  _IntExt get ext => _IntExt(this);
}

final class _IntExt with _CalcIntExt, _ConverterIntExt {
  const _IntExt(int value) : _value = value;

  @override
  final int _value;
}
