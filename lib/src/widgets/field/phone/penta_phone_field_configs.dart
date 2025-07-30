part of 'penta_phone_field.dart';

/// Configuration for country display
class PentaPhoneFieldCountryDisplayConfig {
  const PentaPhoneFieldCountryDisplayConfig({
    this.displayType = PentaPhoneFieldDisplayType.flagAndDialCode,
    this.textStyle,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.shadow,
    this.customBuilder,
  });

  final PentaPhoneFieldDisplayType displayType;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final List<BoxShadow>? shadow;
  final Widget Function(
    BuildContext context,
    PentaPhoneFieldPhoneInfo phoneInfo,
    bool isSelected,
  )?
  customBuilder;
}

/// Configuration for phone number field
class PentaPhoneFieldPhoneNumberConfig {
  const PentaPhoneFieldPhoneNumberConfig({
    this.textStyle,
    this.controller,
    this.hint,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.contentPadding,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderWidth,
    this.borderRadius,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.customBuilder,
  });

  final TextStyle? textStyle;
  final TextEditingController? controller;
  final String? hint;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? suffixText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double? borderWidth;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final Widget Function(BuildContext context, TextEditingController controller)?
  customBuilder;
}

/// Configuration for search and selection styling
class PentaPhoneFieldSearchSelectionConfig {
  const PentaPhoneFieldSearchSelectionConfig({
    this.searchWidget,
    this.selectedWidget,
  });

  final Widget? searchWidget;
  final Widget? selectedWidget;
}

/// Configuration for country selection
class PentaPhoneFieldCountrySelectionConfig {
  const PentaPhoneFieldCountrySelectionConfig({
    this.selectionType = PentaPhoneFieldSelectionType.dialog,
    this.showSearch = true,
    this.searchHint,
    this.searchNoResultsText,
    this.dialogTitle,
    this.dialogContentPadding,
    this.dialogShape,
    this.bottomSheetTitle,
    this.bottomSheetContentPadding,
    this.bottomSheetShape,
    this.dropdownDecoration,
    this.dropdownItemHeight,
    this.dropdownMaxHeight,
    this.customListTileBuilder,
    this.customSelectionBuilder,
    this.styling = const PentaPhoneFieldSearchSelectionConfig(),
  });

  final PentaPhoneFieldSelectionType selectionType;
  final bool showSearch;
  final String? searchHint;
  final String? searchNoResultsText;
  final String? dialogTitle;
  final EdgeInsetsGeometry? dialogContentPadding;
  final ShapeBorder? dialogShape;
  final String? bottomSheetTitle;
  final EdgeInsetsGeometry? bottomSheetContentPadding;
  final ShapeBorder? bottomSheetShape;
  final BoxDecoration? dropdownDecoration;
  final double? dropdownItemHeight;
  final double? dropdownMaxHeight;
  final Widget Function(
    BuildContext context,
    PentaPhoneFieldPhoneInfo phoneInfo,
    bool isSelected,
    VoidCallback onTap,
  )?
  customListTileBuilder;
  final Widget Function(BuildContext context, VoidCallback onTap)?
  customSelectionBuilder;
  final PentaPhoneFieldSearchSelectionConfig styling;
}

/// Configuration for container styling
class PentaPhoneFieldContainerConfig {
  const PentaPhoneFieldContainerConfig({
    this.borderRadius = 8.0,
    this.borderColor = const Color(0xFFE0E0E0), // Default light grey border
    this.focusedBorderColor, // Optional custom focus border color
    this.borderWidth = 1.0,
    this.backgroundColor,
    this.shadow,
    this.gradient,
  });

  final double borderRadius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double borderWidth;
  final Color? backgroundColor;
  final List<BoxShadow>? shadow;
  final Gradient? gradient;
}

/// Configuration for layout
class PentaPhoneFieldLayoutConfig {
  const PentaPhoneFieldLayoutConfig({
    this.fieldSpacing = 12.0,
  });

  final double fieldSpacing;
}

/// Configuration for callbacks
class PentaPhoneFieldCallbacks {
  const PentaPhoneFieldCallbacks({
    this.onCountryChanged,
    this.onPhoneNumberChanged,
    this.onValidPhoneNumber,
    this.onInvalidPhoneNumber,
    this.onSelectionOpened,
    this.onSelectionClosed,
  });

  final void Function(
    PentaPhoneFieldCountryCodesEnum countryCode,
    PentaPhoneFieldPhoneInfo phoneInfo,
  )?
  onCountryChanged;
  final void Function(String phoneNumber)? onPhoneNumberChanged;
  final void Function(
    String fullPhoneNumber,
    PentaPhoneFieldCountryCodesEnum countryCode,
    PentaPhoneFieldPhoneInfo phoneInfo,
  )?
  onValidPhoneNumber;
  final void Function(String phoneNumber, String? errorMessage)?
  onInvalidPhoneNumber;
  final void Function()? onSelectionOpened;
  final void Function()? onSelectionClosed;
}
