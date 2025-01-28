part of 'context_ext.dart';

final class _RadiusContextExt {
  const _RadiusContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  _RadiusCircularContextExt get circular => _RadiusCircularContextExt(_context);
  _BorderRadiusContextExt get border => _BorderRadiusContextExt(_context);
}

final class _RadiusCircularContextExt {
  const _RadiusCircularContextExt(BuildContext context) : _context = context;
  final BuildContext _context;
  Radius get zero => Radius.zero;
  Radius get xs => Radius.circular(_context.ext.values.xs);
  Radius get sm => Radius.circular(_context.ext.values.sm);
  Radius get md => Radius.circular(_context.ext.values.md);
  Radius get lg => Radius.circular(_context.ext.values.lg);
  Radius get xl => Radius.circular(_context.ext.values.xl);
  Radius get xl2 => Radius.circular(_context.ext.values.xl2);
  Radius get xl3 => Radius.circular(_context.ext.values.xl3);
  Radius get xl4 => Radius.circular(_context.ext.values.xl4);
  Radius get xl5 => Radius.circular(_context.ext.values.xl5);
  Radius get xl6 => Radius.circular(_context.ext.values.xl6);
  Radius get full => const Radius.circular(9999);
}

final class _BorderRadiusContextExt {
  const _BorderRadiusContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  BorderRadius get zero => BorderRadius.zero;

  _BorderRadiusCircularContextExt get all =>
      _BorderRadiusCircularContextExt(_context);
  _BoderRadiusOnlyContextExt get directional =>
      _BoderRadiusOnlyContextExt(_context);
}

final class _BorderRadiusCircularContextExt {
  const _BorderRadiusCircularContextExt(BuildContext context)
      : _context = context;
  final BuildContext _context;
  BorderRadius get xs => BorderRadius.circular(_context.ext.values.xs);
  BorderRadius get sm => BorderRadius.circular(_context.ext.values.sm);
  BorderRadius get md => BorderRadius.circular(_context.ext.values.md);
  BorderRadius get lg => BorderRadius.circular(_context.ext.values.lg);
  BorderRadius get xl => BorderRadius.circular(_context.ext.values.xl);
  BorderRadius get xl2 => BorderRadius.circular(_context.ext.values.xl2);
  BorderRadius get xl3 => BorderRadius.circular(_context.ext.values.xl3);
  BorderRadius get xl4 => BorderRadius.circular(_context.ext.values.xl4);
  BorderRadius get xl5 => BorderRadius.circular(_context.ext.values.xl5);
  BorderRadius get xl6 => BorderRadius.circular(_context.ext.values.xl6);
  BorderRadius get full => BorderRadius.circular(9999);
}

final class _BoderRadiusOnlyContextExt {
  const _BoderRadiusOnlyContextExt(BuildContext context) : _context = context;
  final BuildContext _context;
  BorderRadius get xsTL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.xs));
  BorderRadius get xsTR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.xs));
  BorderRadius get xsBL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.xs));
  BorderRadius get xsBR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.xs));
  BorderRadius get xsT => xsTL + xsTR;
  BorderRadius get xsB => xsBL + xsBR;
  BorderRadius get xsL => xsTL + xsBL;
  BorderRadius get xsR => xsTR + xsBR;
  BorderRadius get smTL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.sm));
  BorderRadius get smTR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.sm));
  BorderRadius get smBL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.sm));
  BorderRadius get smBR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.sm));
  BorderRadius get smT => smTL + smTR;
  BorderRadius get smB => smBL + smBR;
  BorderRadius get smL => smTL + smBL;
  BorderRadius get smR => smTR + smBR;
  BorderRadius get mdTL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.md));
  BorderRadius get mdTR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.md));
  BorderRadius get mdBL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.md));
  BorderRadius get mdBR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.md));
  BorderRadius get mdT => mdTL + mdTR;
  BorderRadius get mdB => mdBL + mdBR;
  BorderRadius get mdL => mdTL + mdBL;
  BorderRadius get mdR => mdTR + mdBR;
  BorderRadius get lgTL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.lg));
  BorderRadius get lgTR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.lg));
  BorderRadius get lgBL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.lg));
  BorderRadius get lgBR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.lg));
  BorderRadius get lgT => lgTL + lgTR;
  BorderRadius get lgB => lgBL + lgBR;
  BorderRadius get lgL => lgTL + lgBL;
  BorderRadius get lgR => lgTR + lgBR;
  BorderRadius get xlTL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.xl));
  BorderRadius get xlTR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.xl));
  BorderRadius get xlBL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.xl));
  BorderRadius get xlBR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.xl));
  BorderRadius get xlT => xlTL + xlTR;
  BorderRadius get xlB => xlBL + xlBR;
  BorderRadius get xlL => xlTL + xlBL;
  BorderRadius get xlR => xlTR + xlBR;
  BorderRadius get xl2TL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.xl2));
  BorderRadius get xl2TR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.xl2));
  BorderRadius get xl2BL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.xl2));
  BorderRadius get xl2BR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.xl2));
  BorderRadius get xl2T => xl2TL + xl2TR;
  BorderRadius get xl2B => xl2BL + xl2BR;
  BorderRadius get xl2L => xl2TL + xl2BL;
  BorderRadius get xl2R => xl2TR + xl2BR;
  BorderRadius get xl3TL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.xl3));
  BorderRadius get xl3TR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.xl3));
  BorderRadius get xl3BL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.xl3));
  BorderRadius get xl3BR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.xl3));
  BorderRadius get xl3T => xl3TL + xl3TR;
  BorderRadius get xl3B => xl3BL + xl3BR;
  BorderRadius get xl3L => xl3TL + xl3BL;
  BorderRadius get xl3R => xl3TR + xl3BR;
  BorderRadius get xl4TL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.xl4));
  BorderRadius get xl4TR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.xl4));
  BorderRadius get xl4BL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.xl4));
  BorderRadius get xl4BR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.xl4));
  BorderRadius get xl4T => xl4TL + xl4TR;
  BorderRadius get xl4B => xl4BL + xl4BR;
  BorderRadius get xl4L => xl4TL + xl4BL;
  BorderRadius get xl4R => xl4TR + xl4BR;
  BorderRadius get xl5TL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.xl5));
  BorderRadius get xl5TR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.xl5));
  BorderRadius get xl5BL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.xl5));
  BorderRadius get xl5BR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.xl5));
  BorderRadius get xl5T => xl5TL + xl5TR;
  BorderRadius get xl5B => xl5BL + xl5BR;
  BorderRadius get xl5L => xl5TL + xl5BL;
  BorderRadius get xl5R => xl5TR + xl5BR;
  BorderRadius get xl6TL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.xl6));
  BorderRadius get xl6TR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.xl6));
  BorderRadius get xl6BL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.xl6));
  BorderRadius get xl6BR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.xl6));
  BorderRadius get xl6T => xl6TL + xl6TR;
  BorderRadius get xl6B => xl6BL + xl6BR;
  BorderRadius get xl6L => xl6TL + xl6BL;
  BorderRadius get xl6R => xl6TR + xl6BR;
}
