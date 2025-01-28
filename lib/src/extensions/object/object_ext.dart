part 'object_where_ext.dart';

extension ObjectExt on Object? {
  _ObjectExt get objExt => _ObjectExt(this);
}

final class _ObjectExt {
  const _ObjectExt(Object? value) : _value = value;

  final Object? _value;

  _ObjectWhereExt get where => _ObjectWhereExt(_value);
}
