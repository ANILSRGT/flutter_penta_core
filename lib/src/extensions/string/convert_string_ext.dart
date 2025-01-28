part of 'string_ext.dart';

final class _ConvertStringExt {
  const _ConvertStringExt(String? value) : _value = value;

  final String? _value;

  Uint8List get toUint8List {
    if (_value == null) return Uint8List(0);
    return base64Decode(_value);
  }
}
