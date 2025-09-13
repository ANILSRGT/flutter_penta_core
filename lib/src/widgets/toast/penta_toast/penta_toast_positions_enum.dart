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

  DismissDirection get dismissDirection => switch (this) {
    PentaToastPosition.topLeft => DismissDirection.endToStart,
    PentaToastPosition.topCenter => DismissDirection.up,
    PentaToastPosition.topRight => DismissDirection.startToEnd,
    PentaToastPosition.centerLeft => DismissDirection.endToStart,
    PentaToastPosition.centerMiddle => DismissDirection.none,
    PentaToastPosition.centerRight => DismissDirection.startToEnd,
    PentaToastPosition.bottomLeft => DismissDirection.endToStart,
    PentaToastPosition.bottomCenter => DismissDirection.down,
    PentaToastPosition.bottomRight => DismissDirection.startToEnd,
  };

  Alignment get alignment => switch (this) {
    PentaToastPosition.topLeft => Alignment.topLeft,
    PentaToastPosition.topCenter => Alignment.topCenter,
    PentaToastPosition.topRight => Alignment.topRight,
    PentaToastPosition.centerLeft => Alignment.centerLeft,
    PentaToastPosition.centerMiddle => Alignment.center,
    PentaToastPosition.centerRight => Alignment.centerRight,
    PentaToastPosition.bottomLeft => Alignment.bottomLeft,
    PentaToastPosition.bottomCenter => Alignment.bottomCenter,
    PentaToastPosition.bottomRight => Alignment.bottomRight,
  };

  EdgeInsets margin(double margin) => switch (this) {
    PentaToastPosition.topLeft => EdgeInsets.only(top: margin, left: margin),
    PentaToastPosition.topCenter => EdgeInsets.only(top: margin),
    PentaToastPosition.topRight => EdgeInsets.only(top: margin, right: margin),
    PentaToastPosition.centerLeft => EdgeInsets.only(left: margin),
    PentaToastPosition.centerMiddle => EdgeInsets.zero,
    PentaToastPosition.centerRight => EdgeInsets.only(right: margin),
    PentaToastPosition.bottomLeft => EdgeInsets.only(
      bottom: margin,
      left: margin,
    ),
    PentaToastPosition.bottomCenter => EdgeInsets.only(
      bottom: margin,
    ),
    PentaToastPosition.bottomRight => EdgeInsets.only(
      bottom: margin,
      right: margin,
    ),
  };
}
