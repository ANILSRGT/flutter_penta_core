part of 'uint8list_ext.dart';

mixin _ConvertUint8listExt {
  Uint8List get _value;

  String get toBase64 => base64.encode(_value);
}
