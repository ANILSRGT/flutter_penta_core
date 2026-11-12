import 'package:flutter/widgets.dart';
import 'package:penta_core/src/constants/app_values.dart';
import 'package:penta_core/src/extensions/app_values_ext.dart';

/// Gives access to [WidgetExt] through `widget.ext`.
extension WidgetExtension on Widget? {
  WidgetExt get ext => WidgetExt(this);
}

/// Wrapping helpers. A `null` widget is treated as an empty box.
extension type const WidgetExt(Widget? _value) {
  Widget get _child => _value ?? const SizedBox.shrink();

  // -------------------------------------------------------------- padding

  Widget allPadding(AppValues padding) =>
      Padding(padding: padding.ext.padding.all, child: _child);

  Widget horizontalPadding(AppValues padding) =>
      Padding(padding: padding.ext.padding.horizontal, child: _child);

  Widget verticalPadding(AppValues padding) =>
      Padding(padding: padding.ext.padding.vertical, child: _child);

  Widget onlyPadding({
    AppValues? left,
    AppValues? right,
    AppValues? top,
    AppValues? bottom,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left?.value ?? 0,
      right: right?.value ?? 0,
      top: top?.value ?? 0,
      bottom: bottom?.value ?? 0,
    ),
    child: _child,
  );

  Widget padding(EdgeInsetsGeometry padding) =>
      Padding(padding: padding, child: _child);

  // --------------------------------------------------------------- layout

  Widget get toFullWidth => SizedBox(width: double.infinity, child: _value);
  Widget get toCenter => Center(child: _value);
  Widget get expanded => Expanded(child: _child);
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: _child);
  Widget align(AlignmentGeometry alignment) =>
      Align(alignment: alignment, child: _value);
  Widget get safeArea => SafeArea(child: _child);

  // ---------------------------------------------------------- visibility

  Widget visible(bool isVisible) =>
      Visibility(visible: isVisible, child: _child);

  Widget opacity(double opacity) => Opacity(opacity: opacity, child: _value);

  // -------------------------------------------------------------- gesture

  Widget onTap(VoidCallback? onTap, {HitTestBehavior? behavior}) =>
      GestureDetector(onTap: onTap, behavior: behavior, child: _value);

  // -------------------------------------------------------------- slivers

  SliverToBoxAdapter get toBoxAdapter => SliverToBoxAdapter(child: _value);

  // ------------------------------------------------------------ operators

  /// `const Divider().ext * 3` → three dividers. Empty when the widget is null.
  List<Widget> operator *(int count) {
    final value = _value;
    return value == null ? const [] : List<Widget>.filled(count, value);
  }
}
