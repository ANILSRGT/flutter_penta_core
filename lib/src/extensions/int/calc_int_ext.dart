part of 'int_ext.dart';

mixin _CalcIntExt {
  int get _value;

  /// Returns the number of digits in this integer.
  int get digitsCount {
    if (_value == 0) return 1;
    return _value.abs().toString().length;
  }
}
