import 'package:flutter/material.dart';

part 'padding_context_ext.dart';
part 'screen_context_ext.dart';
part 'values_context_ext.dart';
part 'sizedbox_context_ext.dart';
part 'theme_context_ext.dart';
part 'radius_context_ext.dart';
part 'widget_context_ext.dart';

extension ContextExt on BuildContext {
  _ContextExt get ext => _ContextExt(this);
}

final class _ContextExt {
  const _ContextExt(BuildContext context) : _context = context;

  final BuildContext _context;

  _ValuesContextExt get values => const _ValuesContextExt();
  _ScreenContextExt get screen => _ScreenContextExt(_context);
  _PaddingContextExt get padding => _PaddingContextExt(_context);
  _SizedBoxContextExt get sizedBox => _SizedBoxContextExt(_context);
  _ThemeContextExt get theme => _ThemeContextExt(_context);
  _RadiusContextExt get radius => _RadiusContextExt(_context);
  _WidgetContextExt get widget => _WidgetContextExt(_context);
}
