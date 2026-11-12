import 'package:flutter/material.dart';
import 'package:penta_core/src/extensions/iterable_ext.dart';

/// Gives access to [ContextExt] through `context.ext`.
extension ContextExtension on BuildContext {
  ContextExt get ext => ContextExt(this);
}

/// Screen, theme and navigation shortcuts for a [BuildContext].
///
/// Screen getters use the granular `MediaQuery.xOf` lookups so a widget only
/// rebuilds when the aspect it reads changes.
extension type const ContextExt(BuildContext _context) {
  // ---------------------------------------------------------------- screen

  Size get size => MediaQuery.sizeOf(_context);
  double get width => size.width;
  double get height => size.height;
  EdgeInsets get padding => MediaQuery.paddingOf(_context);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(_context);
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(_context);
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(_context);
  TextScaler get textScaler => MediaQuery.textScalerOf(_context);
  Orientation get orientation => MediaQuery.orientationOf(_context);
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  /// Whether the software keyboard currently covers part of the screen.
  bool get isKeyboardOpen => viewInsets.bottom > 0;

  /// [width] * [percent] / 100.
  double widthPercent(double percent) => width * percent / 100;

  /// [height] * [percent] / 100.
  double heightPercent(double percent) => height * percent / 100;

  T byOrientation<T>({required T portrait, required T landscape}) =>
      isPortrait ? portrait : landscape;

  // ----------------------------------------------------------------- theme

  ThemeData get theme => Theme.of(_context);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  Brightness get brightness => theme.brightness;
  bool get isDark => brightness == Brightness.dark;
  bool get isLight => brightness == Brightness.light;

  T convertByBrightness<T>({required T light, required T dark}) =>
      isLight ? light : dark;

  // ------------------------------------------------------------ navigation

  NavigatorState get navigator => Navigator.of(_context);
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(_context);

  /// Removes focus from the current text field (closes the keyboard).
  void unfocus() => FocusScope.of(_context).unfocus();

  // --------------------------------------------------------------- widgets

  /// Inserts [separator] between [widgets].
  @Deprecated(
    'Use widgets.ext.separatedBy(separator) instead. Will be removed in 4.0.0.',
  )
  List<Widget> seperateGenerator(List<Widget> widgets, Widget separator) =>
      widgets.ext.separatedBy(separator);
}
