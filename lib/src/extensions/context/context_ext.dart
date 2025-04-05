import 'package:flutter/material.dart';

part 'screen_context_ext.dart';
part 'theme_context_ext.dart';
part 'widget_context_ext.dart';

extension ContextExt on BuildContext {
  _ContextExt get ext => _ContextExt(this);
}

final class _ContextExt {
  const _ContextExt(BuildContext context) : _context = context;

  final BuildContext _context;

  _ScreenContextExt get screen => _ScreenContextExt(_context);
  _ThemeContextExt get theme => _ThemeContextExt(_context);
  _WidgetContextExt get widget => _WidgetContextExt(_context);
}
