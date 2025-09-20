part of 'widget_ext.dart';

mixin _SliverWidgetExt {
  Widget? get _value;

  SliverToBoxAdapter get toBoxAdapter {
    return SliverToBoxAdapter(
      child: _value,
    );
  }
}
