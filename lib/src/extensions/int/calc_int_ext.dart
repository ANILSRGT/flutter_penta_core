part of 'int_ext.dart';

final class _CalcIntExt {
  const _CalcIntExt(int? value) : _value = value;

  final int? _value;

  /// Returns the number of digits in this integer.
  int get digitsCount {
    if (_value == null) return 0;
    if (_value == 0) return 1;
    return _value.abs().toString().length;
  }
}
