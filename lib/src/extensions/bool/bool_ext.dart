part 'operator_bool_ext.dart';

extension BoolExt on bool {
  _BoolExt get ext => _BoolExt(value: this);
}

final class _BoolExt {
  const _BoolExt({required bool value}) : _value = value;

  final bool _value;

  _OperatorBoolExt get operator => _OperatorBoolExt(value: _value);
}
