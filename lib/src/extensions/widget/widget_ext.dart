import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

part 'sliver_widget_ext.dart';
part 'widget/widget_widget_ext_padding_mixin.dart';
part 'widget/widget_widget_ext_view_mixin.dart';
part 'widget/widget_widget_ext_operator_mixin.dart';

extension WidgetExt on Widget? {
  _WidgetExt get ext => _WidgetExt(this);
}

final class _WidgetExt
    with
        _SliverWidgetExt,
        _WidgetWidgetExtPaddingMixin,
        _WidgetWidgetExtViewMixin,
        _WidgetWidgetExtOperatorMixin {
  const _WidgetExt(Widget? value) : _value = value;

  @override
  final Widget? _value;
}
