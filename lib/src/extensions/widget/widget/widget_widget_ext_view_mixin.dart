part of '../widget_ext.dart';

mixin _WidgetWidgetExtViewMixin {
  Widget? get _value;

  Widget get toFullWidth {
    return SizedBox(
      width: double.infinity,
      child: _value,
    );
  }

  Widget visible(bool isVisible) {
    return Visibility(
      visible: isVisible,
      child: _value ?? const SizedBox(),
    );
  }

  Widget get toCenter {
    return Center(
      child: _value,
    );
  }
}
