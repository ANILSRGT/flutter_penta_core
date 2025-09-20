import 'dart:convert';
import 'dart:typed_data';

part 'convert_uint8list_ext.dart';

extension Uint8listExt on Uint8List {
  _Uint8listExt get ext => _Uint8listExt(this);
}

final class _Uint8listExt with _ConvertUint8listExt {
  const _Uint8listExt(Uint8List value) : _value = value;

  @override
  final Uint8List _value;
}
