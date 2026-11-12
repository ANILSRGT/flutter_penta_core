part of 'penta_toast.dart';

enum PentaToastPosition {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  centerMiddle,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight;

  /// Swipe direction that dismisses the toast.
  DismissDirection get dismissDirection => switch (this) {
    topLeft || centerLeft || bottomLeft => DismissDirection.endToStart,
    topRight || centerRight || bottomRight => DismissDirection.startToEnd,
    topCenter => DismissDirection.up,
    bottomCenter => DismissDirection.down,
    centerMiddle => DismissDirection.none,
  };

  Alignment get alignment => switch (this) {
    topLeft => Alignment.topLeft,
    topCenter => Alignment.topCenter,
    topRight => Alignment.topRight,
    centerLeft => Alignment.centerLeft,
    centerMiddle => Alignment.center,
    centerRight => Alignment.centerRight,
    bottomLeft => Alignment.bottomLeft,
    bottomCenter => Alignment.bottomCenter,
    bottomRight => Alignment.bottomRight,
  };

  /// Start offset of the default slide-in animation.
  Offset get slideBegin => switch (this) {
    topLeft || centerLeft || bottomLeft => const Offset(-1, 0),
    topRight || centerRight || bottomRight => const Offset(1, 0),
    topCenter => const Offset(0, -1),
    bottomCenter => const Offset(0, 1),
    centerMiddle => Offset.zero,
  };

  EdgeInsets margin(double margin) => switch (this) {
    topLeft => EdgeInsets.only(top: margin, left: margin),
    topCenter => EdgeInsets.only(top: margin),
    topRight => EdgeInsets.only(top: margin, right: margin),
    centerLeft => EdgeInsets.only(left: margin),
    centerMiddle => EdgeInsets.zero,
    centerRight => EdgeInsets.only(right: margin),
    bottomLeft => EdgeInsets.only(bottom: margin, left: margin),
    bottomCenter => EdgeInsets.only(bottom: margin),
    bottomRight => EdgeInsets.only(bottom: margin, right: margin),
  };
}
