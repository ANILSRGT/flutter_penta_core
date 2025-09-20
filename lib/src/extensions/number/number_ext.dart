part 'math_number_ext.dart';

extension NumberExt on num {
  _NumberExt get ext => _NumberExt(this);
}

final class _NumberExt with _NumberMathExt {
  const _NumberExt(num value) : _value = value;

  @override
  final num _value;
}
