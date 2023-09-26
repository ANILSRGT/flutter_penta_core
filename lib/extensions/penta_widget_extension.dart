part of 'extensions.dart';

extension PentaWidgetExtension on Widget {
  SliverToBoxAdapter get toSliverToBoxAdapter => SliverToBoxAdapter(child: this);
}
