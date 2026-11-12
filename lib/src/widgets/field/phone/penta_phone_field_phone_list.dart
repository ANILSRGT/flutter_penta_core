part of 'penta_phone_field.dart';

/// Phone info of every supported country.
abstract final class PhoneList {
  /// All countries with names in [languageCode], in enum order.
  static Map<PentaPhoneFieldCountryCodesEnum, PentaPhoneFieldPhoneInfo>
  phoneList({String languageCode = 'en'}) => {
    for (final country in PentaPhoneFieldCountryCodesEnum.values)
      country: country.info(languageCode),
  };
}
