import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:penta_core/src/constants/disposable_email_domains.dart';

/// Gives access to [StringExt] through `text.ext` (also on nullable strings).
extension StringExtension on String? {
  StringExt get ext => StringExt(this);
}

final RegExp _emailRegex = RegExp(
  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\.[a-zA-Z]{2,}$",
);
final RegExp _phoneWithPlusRegex = RegExp(r'^\+[0-9]{7,15}$');
final RegExp _phoneWithoutPlusRegex = RegExp(r'^[0-9]{1,15}$');
final RegExp _phoneSeparators = RegExp(r'[\s\-().]');
final math.Random _random = math.Random();

extension type const StringExt(String? _value) {
  // ----------------------------------------------------------- validation

  bool get isNullOrEmpty => _value == null || _value.isEmpty;

  /// `null`, empty or whitespace only.
  bool get isNullOrBlank => _value == null || _value.trim().isEmpty;

  /// `null` when the string is empty, otherwise the string.
  String? get nullIfEmpty => isNullOrEmpty ? null : _value;

  /// Syntax-only e-mail check.
  bool get validEmailRegex => _emailRegex.hasMatch(_value?.trim() ?? '');

  /// Syntax check and the domain is not a known disposable provider.
  bool get validEmail => validEmailRegex && !isDisposableEmail;

  /// Syntax check and the domain is in [whiteList].
  bool validEmailWithWhiteList(List<String> whiteList) =>
      validEmailRegex &&
      whiteList.map((e) => e.toLowerCase()).contains(_emailDomain);

  /// Whether the e-mail domain is a known disposable provider.
  bool get isDisposableEmail =>
      disposableEmailDomains.contains(_emailDomain ?? '');

  String? get _emailDomain {
    final value = _value?.trim();
    if (value == null) return null;
    final at = value.lastIndexOf('@');
    return at < 0 ? null : value.substring(at + 1).toLowerCase();
  }

  /// E.164 style number with a leading `+`, e.g. `+90 555 123 45 67`.
  /// Spaces, dashes, dots and parentheses are ignored.
  bool get validPhoneWithPlus => _phoneWithPlusRegex.hasMatch(
    _value?.replaceAll(_phoneSeparators, '') ?? '',
  );

  /// Digits only (max 15), e.g. `0555 123 45 67`.
  /// Spaces, dashes, dots and parentheses are ignored.
  bool get validPhoneWithoutPlus => _phoneWithoutPlusRegex.hasMatch(
    _value?.replaceAll(_phoneSeparators, '') ?? '',
  );

  // -------------------------------------------------------------- casing

  /// First letter upper-cased: `hello world` → `Hello world`.
  String get capitalized {
    final value = _value;
    if (value == null || value.isEmpty) return '';
    return value[0].toUpperCase() + value.substring(1);
  }

  /// Every word capitalized: `hello world` → `Hello World`.
  String get titleCase =>
      (_value ?? '').split(' ').map((w) => StringExt(w).capitalized).join(' ');

  // ---------------------------------------------------------- conversion

  /// Decodes base64 (plain or `data:*;base64,` URI). Empty on `null`.
  Uint8List get toUint8List {
    final value = _value;
    if (value == null || value.isEmpty) return Uint8List(0);
    if (value.startsWith('data:')) {
      return UriData.parse(value).contentAsBytes();
    }
    return base64Decode(value);
  }

  int? get toIntOrNull => _value == null ? null : int.tryParse(_value.trim());
  double? get toDoubleOrNull =>
      _value == null ? null : double.tryParse(_value.trim());

  // -------------------------------------------------- placeholder images

  String get imagePortrait => _picsum(_value, 300, 400);
  String get imageLandscape => _picsum(_value, 400, 300);
  String get imageSquare => _picsum(_value, 300, 300);

  String get randomImagePortrait => _picsum(_randomSeed(), 300, 400);
  String get randomImageLandscape => _picsum(_randomSeed(), 400, 300);
  String get randomImageSquare => _picsum(_randomSeed(), 300, 300);
}

String _picsum(String? seed, int width, int height) =>
    seed != null && seed.isNotEmpty
    ? 'https://picsum.photos/seed/${Uri.encodeComponent(seed)}/$width/$height'
    : 'https://picsum.photos/$width/$height';

String _randomSeed() =>
    _random.nextInt(0xFFFFFFFF).toRadixString(36).padLeft(7, '0');
