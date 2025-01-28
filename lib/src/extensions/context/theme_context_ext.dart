part of 'context_ext.dart';

final class _ThemeContextExt {
  const _ThemeContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  ThemeData get theme => Theme.of(_context);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  Brightness get brightness => theme.brightness;
  bool get isDark => brightness == Brightness.dark;
  bool get isLight => brightness == Brightness.light;

  T convertByBrightness<T>({
    required T light,
    required T dark,
  }) =>
      isLight ? light : dark;
}
