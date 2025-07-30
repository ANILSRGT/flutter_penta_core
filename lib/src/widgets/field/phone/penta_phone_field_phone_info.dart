part of 'penta_phone_field.dart';

@immutable
class PentaPhoneFieldPhoneInfo {
  const PentaPhoneFieldPhoneInfo({
    required this.countryName,
    required this.countryCode,
    required this.dialCode,
    required this.flag,
    required this.minLength,
    required this.maxLength,
  });

  final String countryName;
  final String countryCode;
  final String dialCode;
  final String flag;
  final int minLength;
  final int maxLength;

  @override
  String toString() {
    return 'PhoneInfo(countryName: $countryName, countryCode: $countryCode, dialCode: $dialCode, flag: $flag, minLength: $minLength, maxLength: $maxLength)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PentaPhoneFieldPhoneInfo &&
        other.countryName == countryName &&
        other.countryCode == countryCode &&
        other.dialCode == dialCode &&
        other.flag == flag &&
        other.minLength == minLength &&
        other.maxLength == maxLength;
  }

  @override
  int get hashCode {
    return countryName.hashCode ^
        countryCode.hashCode ^
        dialCode.hashCode ^
        flag.hashCode ^
        minLength.hashCode ^
        maxLength.hashCode;
  }
}
