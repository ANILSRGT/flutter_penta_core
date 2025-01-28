part of 'context_ext.dart';

final class _SizedBoxContextExt {
  const _SizedBoxContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  _SizedBoxWidthContextExt get width => _SizedBoxWidthContextExt(_context);
  _SizedBoxHeightContextExt get height => _SizedBoxHeightContextExt(_context);
}

final class _SizedBoxWidthContextExt {
  const _SizedBoxWidthContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  SizedBox get xs => SizedBox(width: _context.ext.values.xs);
  SizedBox get sm => SizedBox(width: _context.ext.values.sm);
  SizedBox get md => SizedBox(width: _context.ext.values.md);
  SizedBox get lg => SizedBox(width: _context.ext.values.lg);
  SizedBox get xl => SizedBox(width: _context.ext.values.xl);
  SizedBox get xl2 => SizedBox(width: _context.ext.values.xl2);
  SizedBox get xl3 => SizedBox(width: _context.ext.values.xl3);
  SizedBox get xl4 => SizedBox(width: _context.ext.values.xl4);
  SizedBox get xl5 => SizedBox(width: _context.ext.values.xl5);
  SizedBox get xl6 => SizedBox(width: _context.ext.values.xl6);
  SizedBox get full => const SizedBox(width: double.infinity);
}

final class _SizedBoxHeightContextExt {
  const _SizedBoxHeightContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  SizedBox get xs => SizedBox(height: _context.ext.values.xs);
  SizedBox get sm => SizedBox(height: _context.ext.values.sm);
  SizedBox get md => SizedBox(height: _context.ext.values.md);
  SizedBox get lg => SizedBox(height: _context.ext.values.lg);
  SizedBox get xl => SizedBox(height: _context.ext.values.xl);
  SizedBox get xl2 => SizedBox(height: _context.ext.values.xl2);
  SizedBox get xl3 => SizedBox(height: _context.ext.values.xl3);
  SizedBox get xl4 => SizedBox(height: _context.ext.values.xl4);
  SizedBox get xl5 => SizedBox(height: _context.ext.values.xl5);
  SizedBox get xl6 => SizedBox(height: _context.ext.values.xl6);
  SizedBox get full => const SizedBox(height: double.infinity);
}
