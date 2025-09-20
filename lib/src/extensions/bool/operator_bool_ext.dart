part of 'bool_ext.dart';

mixin _OperatorBoolExt {
  bool get _value;

  bool get not => !_value;
}
