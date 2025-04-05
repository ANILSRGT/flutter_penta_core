import 'dart:convert';
import 'dart:typed_data';

import 'package:penta_core/src/constants/email_validation_constants.dart';

part 'validation_string_ext.dart';
part 'random_string_ext.dart';
part 'convert_string_ext.dart';

extension StringExt on String? {
  _StringExt get ext => _StringExt(this);
}

final class _StringExt {
  const _StringExt(String? value) : _value = value;

  final String? _value;

  _ValidationStringExt get validation => _ValidationStringExt(_value);
  _RandomStringExt get random => _RandomStringExt(_value);
  _ConvertStringExt get convert => _ConvertStringExt(_value);
}
