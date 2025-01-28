part of 'context_ext.dart';

final class _PaddingContextExt {
  const _PaddingContextExt(BuildContext context) : _context = context;

  final BuildContext _context;

  _PaddingContextAllExt get all => _PaddingContextAllExt(_context);
  _PaddingContextHorizontalExt get horizontal =>
      _PaddingContextHorizontalExt(_context);
  _PaddingContextVerticalExt get vertical =>
      _PaddingContextVerticalExt(_context);
  _PaddingContextDirectionalExt get directional =>
      _PaddingContextDirectionalExt(_context);
}

final class _PaddingContextAllExt {
  const _PaddingContextAllExt(BuildContext context) : _context = context;

  final BuildContext _context;

  EdgeInsets get xs => EdgeInsets.all(_context.ext.values.xs);
  EdgeInsets get sm => EdgeInsets.all(_context.ext.values.sm);
  EdgeInsets get md => EdgeInsets.all(_context.ext.values.md);
  EdgeInsets get lg => EdgeInsets.all(_context.ext.values.lg);
  EdgeInsets get xl => EdgeInsets.all(_context.ext.values.xl);
  EdgeInsets get xl2 => EdgeInsets.all(_context.ext.values.xl2);
  EdgeInsets get xl3 => EdgeInsets.all(_context.ext.values.xl3);
  EdgeInsets get xl4 => EdgeInsets.all(_context.ext.values.xl4);
  EdgeInsets get xl5 => EdgeInsets.all(_context.ext.values.xl5);
  EdgeInsets get xl6 => EdgeInsets.all(_context.ext.values.xl6);
}

final class _PaddingContextHorizontalExt {
  const _PaddingContextHorizontalExt(BuildContext context) : _context = context;

  final BuildContext _context;

  EdgeInsets get xs => EdgeInsets.symmetric(horizontal: _context.ext.values.xs);
  EdgeInsets get sm => EdgeInsets.symmetric(horizontal: _context.ext.values.sm);
  EdgeInsets get md => EdgeInsets.symmetric(horizontal: _context.ext.values.md);
  EdgeInsets get lg => EdgeInsets.symmetric(horizontal: _context.ext.values.lg);
  EdgeInsets get xl => EdgeInsets.symmetric(horizontal: _context.ext.values.xl);
  EdgeInsets get xl2 =>
      EdgeInsets.symmetric(horizontal: _context.ext.values.xl2);
  EdgeInsets get xl3 =>
      EdgeInsets.symmetric(horizontal: _context.ext.values.xl3);
  EdgeInsets get xl4 =>
      EdgeInsets.symmetric(horizontal: _context.ext.values.xl4);
  EdgeInsets get xl5 =>
      EdgeInsets.symmetric(horizontal: _context.ext.values.xl5);
  EdgeInsets get xl6 =>
      EdgeInsets.symmetric(horizontal: _context.ext.values.xl6);
}

final class _PaddingContextVerticalExt {
  const _PaddingContextVerticalExt(BuildContext context) : _context = context;

  final BuildContext _context;

  EdgeInsets get xs => EdgeInsets.symmetric(vertical: _context.ext.values.xs);
  EdgeInsets get sm => EdgeInsets.symmetric(vertical: _context.ext.values.sm);
  EdgeInsets get md => EdgeInsets.symmetric(vertical: _context.ext.values.md);
  EdgeInsets get lg => EdgeInsets.symmetric(vertical: _context.ext.values.lg);
  EdgeInsets get xl => EdgeInsets.symmetric(vertical: _context.ext.values.xl);
  EdgeInsets get xl2 => EdgeInsets.symmetric(vertical: _context.ext.values.xl2);
  EdgeInsets get xl3 => EdgeInsets.symmetric(vertical: _context.ext.values.xl3);
  EdgeInsets get xl4 => EdgeInsets.symmetric(vertical: _context.ext.values.xl4);
  EdgeInsets get xl5 => EdgeInsets.symmetric(vertical: _context.ext.values.xl5);
  EdgeInsets get xl6 => EdgeInsets.symmetric(vertical: _context.ext.values.xl6);
}

final class _PaddingContextDirectionalExt {
  const _PaddingContextDirectionalExt(BuildContext context)
      : _context = context;

  final BuildContext _context;

  EdgeInsets get xsLeft => EdgeInsets.only(left: _context.ext.values.xs);
  EdgeInsets get xsRight => EdgeInsets.only(right: _context.ext.values.xs);
  EdgeInsets get xsTop => EdgeInsets.only(top: _context.ext.values.xs);
  EdgeInsets get xsBottom => EdgeInsets.only(bottom: _context.ext.values.xs);
  EdgeInsets get smLeft => EdgeInsets.only(left: _context.ext.values.sm);
  EdgeInsets get smRight => EdgeInsets.only(right: _context.ext.values.sm);
  EdgeInsets get smTop => EdgeInsets.only(top: _context.ext.values.sm);
  EdgeInsets get smBottom => EdgeInsets.only(bottom: _context.ext.values.sm);
  EdgeInsets get mdLeft => EdgeInsets.only(left: _context.ext.values.md);
  EdgeInsets get mdRight => EdgeInsets.only(right: _context.ext.values.md);
  EdgeInsets get mdTop => EdgeInsets.only(top: _context.ext.values.md);
  EdgeInsets get mdBottom => EdgeInsets.only(bottom: _context.ext.values.md);
  EdgeInsets get lgLeft => EdgeInsets.only(left: _context.ext.values.lg);
  EdgeInsets get lgRight => EdgeInsets.only(right: _context.ext.values.lg);
  EdgeInsets get lgTop => EdgeInsets.only(top: _context.ext.values.lg);
  EdgeInsets get lgBottom => EdgeInsets.only(bottom: _context.ext.values.lg);
  EdgeInsets get xlLeft => EdgeInsets.only(left: _context.ext.values.xl);
  EdgeInsets get xlRight => EdgeInsets.only(right: _context.ext.values.xl);
  EdgeInsets get xlTop => EdgeInsets.only(top: _context.ext.values.xl);
  EdgeInsets get xlBottom => EdgeInsets.only(bottom: _context.ext.values.xl);
  EdgeInsets get xl2Left => EdgeInsets.only(left: _context.ext.values.xl2);
  EdgeInsets get xl2Right => EdgeInsets.only(right: _context.ext.values.xl2);
  EdgeInsets get xl2Top => EdgeInsets.only(top: _context.ext.values.xl2);
  EdgeInsets get xl2Bottom => EdgeInsets.only(bottom: _context.ext.values.xl2);
  EdgeInsets get xl3Left => EdgeInsets.only(left: _context.ext.values.xl3);
  EdgeInsets get xl3Right => EdgeInsets.only(right: _context.ext.values.xl3);
  EdgeInsets get xl3Top => EdgeInsets.only(top: _context.ext.values.xl3);
  EdgeInsets get xl3Bottom => EdgeInsets.only(bottom: _context.ext.values.xl3);
  EdgeInsets get xl4Left => EdgeInsets.only(left: _context.ext.values.xl4);
  EdgeInsets get xl4Right => EdgeInsets.only(right: _context.ext.values.xl4);
  EdgeInsets get xl4Top => EdgeInsets.only(top: _context.ext.values.xl4);
  EdgeInsets get xl4Bottom => EdgeInsets.only(bottom: _context.ext.values.xl4);
  EdgeInsets get xl5Left => EdgeInsets.only(left: _context.ext.values.xl5);
  EdgeInsets get xl5Right => EdgeInsets.only(right: _context.ext.values.xl5);
  EdgeInsets get xl5Top => EdgeInsets.only(top: _context.ext.values.xl5);
  EdgeInsets get xl5Bottom => EdgeInsets.only(bottom: _context.ext.values.xl5);
  EdgeInsets get xl6Left => EdgeInsets.only(left: _context.ext.values.xl6);
  EdgeInsets get xl6Right => EdgeInsets.only(right: _context.ext.values.xl6);
  EdgeInsets get xl6Top => EdgeInsets.only(top: _context.ext.values.xl6);
  EdgeInsets get xl6Bottom => EdgeInsets.only(bottom: _context.ext.values.xl6);
}
