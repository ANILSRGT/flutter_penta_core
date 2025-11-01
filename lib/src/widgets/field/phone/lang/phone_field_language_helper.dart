part of '../penta_phone_field.dart';

class _PhoneFieldLanguageHelper {
  static _PhoneFieldStrings getPhoneFieldStrings(String languageCode) {
    switch (languageCode) {
      case 'ar':
        return _ArabicSaCountryNames.phoneFieldStrings;
      case 'bn':
        return _BengaliBdCountryNames.phoneFieldStrings;
      case 'de':
        return _GermanDeCountryNames.phoneFieldStrings;
      case 'el':
        return _GreekGrCountryNames.phoneFieldStrings;
      case 'en':
        return _EnglishGbCountryNames.phoneFieldStrings;
      case 'es':
        return _SpanishEsCountryNames.phoneFieldStrings;
      case 'fa':
        return _PersianIrCountryNames.phoneFieldStrings;
      case 'fr':
        return _FrenchFrCountryNames.phoneFieldStrings;
      case 'hi':
        return _HindiInCountryNames.phoneFieldStrings;
      case 'id':
        return _IndonesianIdCountryNames.phoneFieldStrings;
      case 'it':
        return _ItalianItCountryNames.phoneFieldStrings;
      case 'ja':
        return _JapaneseJpCountryNames.phoneFieldStrings;
      case 'ko':
        return _KoreanKrCountryNames.phoneFieldStrings;
      case 'nl':
        return _DutchNlCountryNames.phoneFieldStrings;
      case 'pl':
        return _PolishPlCountryNames.phoneFieldStrings;
      case 'pt':
        return _PortuguesePtCountryNames.phoneFieldStrings;
      case 'ru':
        return _RussianRuCountryNames.phoneFieldStrings;
      case 'sv':
        return _SwedishSeCountryNames.phoneFieldStrings;
      case 'th':
        return _ThaiThCountryNames.phoneFieldStrings;
      case 'tr':
        return _TurkishTrCountryNames.phoneFieldStrings;
      case 'uk':
        return _UkrainianUaCountryNames.phoneFieldStrings;
      case 'ur':
        return _UrduPkCountryNames.phoneFieldStrings;
      case 'vi':
        return _VietnameseVnCountryNames.phoneFieldStrings;
      case 'zh':
        return _ChineseCnCountryNames.phoneFieldStrings;
      default:
        return _EnglishGbCountryNames.phoneFieldStrings;
    }
  }
}
