part of '../widget_ext.dart';

mixin _WidgetWidgetExtOperatorMixin {
  Widget? get _value;

  List<Widget> operator *(int count) {
    if (_value == null) {
      return [];
    }

    return List.generate(count, (_) => _value);
  }
}
