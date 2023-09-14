part of 'extensions.dart';

extension WidgetExtension on Widget {
  SliverToBoxAdapter get toSliverToBoxAdapter => SliverToBoxAdapter(child: this);
}
