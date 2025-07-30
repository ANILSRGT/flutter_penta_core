part of 'penta_phone_field.dart';

/// Display type for country code selector
enum PentaPhoneFieldDisplayType {
  /// Show only flag
  flagOnly,

  /// Show only dial code
  dialCodeOnly,

  /// Show only country name
  countryNameOnly,

  /// Show flag and dial code
  flagAndDialCode,

  /// Show flag and country name
  flagAndCountryName,

  /// Show dial code and country name
  dialCodeAndCountryName,

  /// Show flag, dial code and country name
  flagDialCodeAndCountryName,

  /// Custom display using builder
  custom,
}

/// Selection type for country picker
enum PentaPhoneFieldSelectionType {
  /// Show as dialog
  dialog,

  /// Show as bottom sheet
  bottomSheet,

  /// Show as dropdown
  dropdown,

  /// Custom selection widget
  custom,
}
