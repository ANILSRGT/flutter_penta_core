part of '../widget_ext.dart';

mixin _WidgetWidgetExtPaddingMixin {
  Widget? get _value;

  Widget allPadding(AppValues padding) {
    return Padding(
      padding: padding.ext.padding.all,
      child: _value,
    );
  }

  Widget horizontalPadding(AppValues padding) {
    return Padding(
      padding: padding.ext.padding.horizontal,
      child: _value,
    );
  }

  Widget verticalPadding(AppValues padding) {
    return Padding(
      padding: padding.ext.padding.vertical,
      child: _value,
    );
  }

  Widget onlyPadding({
    AppValues? left,
    AppValues? right,
    AppValues? top,
    AppValues? bottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left?.value ?? 0,
        right: right?.value ?? 0,
        top: top?.value ?? 0,
        bottom: bottom?.value ?? 0,
      ),
      child: _value,
    );
  }
}
