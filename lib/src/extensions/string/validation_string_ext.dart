part of 'string_ext.dart';

final class _ValidationStringExt {
  const _ValidationStringExt(String? value) : _value = value;

  final String? _value;

  bool get isNullOrEmpty => _value == null || _value.isEmpty;

  bool get validEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_value ?? '') &&
      EmailValidationConstants.validEmailByDomain(_value ?? '');

  /// Example: +0 123 456 789
  bool get validPhoneWithPlus =>
      RegExp(r'^\+(?:[0-9]●?){6,14}[0-9]$').hasMatch(_value ?? '');

  /// Example: 0 123 456 789
  bool get validPhoneWithoutPlus =>
      RegExp(r'^\d{1,15}$').hasMatch(_value ?? '');
}
