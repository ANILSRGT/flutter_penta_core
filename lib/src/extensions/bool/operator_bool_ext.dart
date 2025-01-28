part of 'bool_ext.dart';

final class _OperatorBoolExt {
  const _OperatorBoolExt({required bool value}) : _value = value;

  final bool _value;

  bool get not => !_value;
}
