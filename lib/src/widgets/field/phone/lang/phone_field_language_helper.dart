part of '../penta_phone_field.dart';

class _PhoneFieldLanguageHelper {
  static _PhoneFieldStrings getPhoneFieldStrings(String languageCode) {
    switch (languageCode) {
      case 'ar':
        return _ArabicCountryNames.phoneFieldStrings;
      case 'bn':
        return _BengaliCountryNames.phoneFieldStrings;
      case 'de':
        return _GermanCountryNames.phoneFieldStrings;
      case 'el':
        return _GreekCountryNames.phoneFieldStrings;
      case 'en':
        return _EnglishCountryNames.phoneFieldStrings;
      case 'es':
        return _SpanishCountryNames.phoneFieldStrings;
      case 'fa':
        return _PersianCountryNames.phoneFieldStrings;
      case 'fr':
        return _FrenchCountryNames.phoneFieldStrings;
      case 'hi':
        return _HindiCountryNames.phoneFieldStrings;
      case 'id':
        return _IndonesianCountryNames.phoneFieldStrings;
      case 'it':
        return _ItalianCountryNames.phoneFieldStrings;
      case 'ja':
        return _JapaneseCountryNames.phoneFieldStrings;
      case 'ko':
        return _KoreanCountryNames.phoneFieldStrings;
      case 'nl':
        return _DutchCountryNames.phoneFieldStrings;
      case 'pl':
        return _PolishCountryNames.phoneFieldStrings;
      case 'pt':
        return _PortugueseCountryNames.phoneFieldStrings;
      case 'ru':
        return _RussianCountryNames.phoneFieldStrings;
      case 'sv':
        return _SwedishCountryNames.phoneFieldStrings;
      case 'th':
        return _ThaiCountryNames.phoneFieldStrings;
      case 'tr':
        return _TurkishCountryNames.phoneFieldStrings;
      case 'uk':
        return _UkrainianCountryNames.phoneFieldStrings;
      case 'ur':
        return _UrduCountryNames.phoneFieldStrings;
      case 'vi':
        return _VietnameseCountryNames.phoneFieldStrings;
      case 'zh':
        return _ChineseCountryNames.phoneFieldStrings;
      default:
        return _EnglishCountryNames.phoneFieldStrings;
    }
  }
}
