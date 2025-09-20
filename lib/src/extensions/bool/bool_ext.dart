part 'operator_bool_ext.dart';

extension BoolExt on bool {
  _BoolExt get ext => _BoolExt(value: this);
}

final class _BoolExt with _OperatorBoolExt {
  const _BoolExt({required bool value}) : _value = value;

  @override
  final bool _value;
}
