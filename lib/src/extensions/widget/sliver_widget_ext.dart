part of 'widget_ext.dart';

final class _SliverWidgetExt {
  const _SliverWidgetExt(Widget? value) : _value = value;

  final Widget? _value;

  SliverToBoxAdapter get toBoxAdapter {
    return SliverToBoxAdapter(
      child: _value,
    );
  }
}
