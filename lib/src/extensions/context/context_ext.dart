import 'package:flutter/material.dart';

part 'screen_context_ext.dart';
part 'theme_context_ext.dart';
part 'widget_context_ext.dart';

extension ContextExt on BuildContext {
  _ContextExt get ext => _ContextExt(this);
}

final class _ContextExt
    with _ScreenContextExt, _ThemeContextExt, _WidgetContextExt {
  const _ContextExt(BuildContext context) : _context = context;

  @override
  final BuildContext _context;
}
