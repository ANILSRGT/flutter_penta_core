part of 'context_ext.dart';

final class _ScreenContextExt {
  const _ScreenContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  MediaQueryData get _mediaQuery => MediaQuery.of(_context);

  Size get size => _mediaQuery.size;
  double get width => size.width;
  double get height => size.height;

  T byOrientation<T>({
    required T portrait,
    required T landscape,
  }) {
    return width < height ? portrait : landscape;
  }
}
