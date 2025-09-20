part of 'string_ext.dart';

mixin _ValidationStringExt {
  String? get _value;

  bool get isNullOrEmpty => _value == null || _value.isEmpty;

  bool get validEmailRegex =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_value ?? '');

  bool get validEmail =>
      validEmailRegex &&
      EmailValidationConstants.validEmailByDomain(_value ?? '');

  bool validEmailWithWhiteList(List<String> whiteList) =>
      validEmailRegex &&
      EmailValidationConstants.validEmailByDomain(
        _value ?? '',
        domainWhiteList: whiteList,
      );

  /// Example: +0 123 456 789
  bool get validPhoneWithPlus =>
      RegExp(r'^\+(?:[0-9]●?){6,14}[0-9]$').hasMatch(_value ?? '');

  /// Example: 0 123 456 789
  bool get validPhoneWithoutPlus =>
      RegExp(r'^\d{1,15}$').hasMatch(_value ?? '');
}
