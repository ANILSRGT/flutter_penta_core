import 'dart:convert';
import 'dart:math' as math show Random;
import 'dart:typed_data';

import 'package:penta_core/src/constants/email_validation_constants.dart';

part 'validation_string_ext.dart';
part 'random_string_ext.dart';
part 'convert_string_ext.dart';

extension StringExt on String? {
  _StringExt get ext => _StringExt(this);
}

final class _StringExt
    with _ValidationStringExt, _RandomStringExt, _ConvertStringExt {
  const _StringExt(String? value) : _value = value;

  @override
  final String? _value;
}
