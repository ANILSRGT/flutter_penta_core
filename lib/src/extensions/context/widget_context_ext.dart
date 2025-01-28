part of 'context_ext.dart';

final class _WidgetContextExt {
  const _WidgetContextExt(BuildContext context) : _context = context;

  final BuildContext _context;

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
