import 'dart:convert';
import 'dart:typed_data';

/// Gives access to [Uint8ListExt] through `bytes.ext`.
extension Uint8ListExtension on Uint8List {
  Uint8ListExt get ext => Uint8ListExt(this);
}

extension type const Uint8ListExt(Uint8List _value) {
  String get toBase64 => base64.encode(_value);

  /// `data:<mimeType>;base64,...` URI.
  String toDataUri({String mimeType = 'application/octet-stream'}) =>
      'data:$mimeType;base64,$toBase64';
}
