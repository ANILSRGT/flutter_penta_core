part of '../penta_phone_field.dart';

/// Texts used by [PentaPhoneField]. Pass your own through
/// [PentaPhoneField.strings] to override the built-in translations.
@immutable
class PentaPhoneFieldStrings {
  const PentaPhoneFieldStrings({
    required this.phoneNumber,
    required this.selectCountry,
    required this.searchCountries,
    required this.noCountriesFound,
    required this.phoneNumberValidationError,
  });

  /// Built-in strings for [languageCode] (English when unsupported).
  factory PentaPhoneFieldStrings.of(String languageCode) =>
      _PhoneFieldLanguageHelper.strings(languageCode);

  /// Language codes with built-in translations.
  static Iterable<String> get supportedLanguages =>
      _PhoneFieldLanguageHelper.supportedLanguages;

  final String phoneNumber;
  final String selectCountry;
  final String searchCountries;
  final String noCountriesFound;

  /// May contain `{minLength}` and `{maxLength}` placeholders.
  final String phoneNumberValidationError;

  String lengthError(int minLength, int maxLength) => phoneNumberValidationError
      .replaceAll('{minLength}', '$minLength')
      .replaceAll('{maxLength}', '$maxLength');
}
