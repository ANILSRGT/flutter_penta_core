part of '../penta_phone_field.dart';

abstract final class _PhoneFieldLanguageHelper {
  static const Map<String, Map<PentaPhoneFieldCountryCodesEnum, String>>
  _names = {
    'ar': _ArabicSaCountryNames.names,
    'bn': _BengaliBdCountryNames.names,
    'de': _GermanDeCountryNames.names,
    'el': _GreekGrCountryNames.names,
    'en': _EnglishGbCountryNames.names,
    'es': _SpanishEsCountryNames.names,
    'fa': _PersianIrCountryNames.names,
    'fr': _FrenchFrCountryNames.names,
    'hi': _HindiInCountryNames.names,
    'id': _IndonesianIdCountryNames.names,
    'it': _ItalianItCountryNames.names,
    'ja': _JapaneseJpCountryNames.names,
    'ko': _KoreanKrCountryNames.names,
    'nl': _DutchNlCountryNames.names,
    'pl': _PolishPlCountryNames.names,
    'pt': _PortuguesePtCountryNames.names,
    'ru': _RussianRuCountryNames.names,
    'sv': _SwedishSeCountryNames.names,
    'th': _ThaiThCountryNames.names,
    'tr': _TurkishTrCountryNames.names,
    'uk': _UkrainianUaCountryNames.names,
    'ur': _UrduPkCountryNames.names,
    'vi': _VietnameseVnCountryNames.names,
    'zh': _ChineseCnCountryNames.names,
  };

  static const Map<String, PentaPhoneFieldStrings> _strings = {
    'ar': _ArabicSaCountryNames.phoneFieldStrings,
    'bn': _BengaliBdCountryNames.phoneFieldStrings,
    'de': _GermanDeCountryNames.phoneFieldStrings,
    'el': _GreekGrCountryNames.phoneFieldStrings,
    'en': _EnglishGbCountryNames.phoneFieldStrings,
    'es': _SpanishEsCountryNames.phoneFieldStrings,
    'fa': _PersianIrCountryNames.phoneFieldStrings,
    'fr': _FrenchFrCountryNames.phoneFieldStrings,
    'hi': _HindiInCountryNames.phoneFieldStrings,
    'id': _IndonesianIdCountryNames.phoneFieldStrings,
    'it': _ItalianItCountryNames.phoneFieldStrings,
    'ja': _JapaneseJpCountryNames.phoneFieldStrings,
    'ko': _KoreanKrCountryNames.phoneFieldStrings,
    'nl': _DutchNlCountryNames.phoneFieldStrings,
    'pl': _PolishPlCountryNames.phoneFieldStrings,
    'pt': _PortuguesePtCountryNames.phoneFieldStrings,
    'ru': _RussianRuCountryNames.phoneFieldStrings,
    'sv': _SwedishSeCountryNames.phoneFieldStrings,
    'th': _ThaiThCountryNames.phoneFieldStrings,
    'tr': _TurkishTrCountryNames.phoneFieldStrings,
    'uk': _UkrainianUaCountryNames.phoneFieldStrings,
    'ur': _UrduPkCountryNames.phoneFieldStrings,
    'vi': _VietnameseVnCountryNames.phoneFieldStrings,
    'zh': _ChineseCnCountryNames.phoneFieldStrings,
  };

  /// Language codes with built-in translations.
  static Iterable<String> get supportedLanguages => _names.keys;

  static String _language(String code) =>
      code.split(RegExp('[-_]')).first.toLowerCase();

  static PentaPhoneFieldStrings strings(String languageCode) =>
      _strings[_language(languageCode)] ?? _strings['en']!;

  static String countryName(
    PentaPhoneFieldCountryCodesEnum country,
    String languageCode,
  ) =>
      _names[_language(languageCode)]?[country] ??
      _names['en']![country] ??
      country.name;
}
