part of 'uint8list_ext.dart';

final class _ConvertUint8listExt {
  const _ConvertUint8listExt(Uint8List value) : _value = value;

  final Uint8List _value;

  String get toBase64 => base64.encode(_value);
}
