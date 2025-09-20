part of 'context_ext.dart';

mixin _WidgetContextExt {
  List<Widget> seperateGenerator(List<Widget> widgets, Widget seperator) {
    final result = <Widget>[];
    for (var i = 0; i < widgets.length; i++) {
      result.add(widgets[i]);
      if (i != widgets.length - 1) {
        result.add(seperator);
      }
    }
    return result;
  }
}
