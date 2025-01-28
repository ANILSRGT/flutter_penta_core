import 'package:flutter/material.dart';

@immutable
final class RemovePaddingList {
  const RemovePaddingList._();

  /// Generate a list of widgets with padding.
  /// <br>If a widget is a [RemovePaddingIgnore], it will not have padding.
  /// <br>Otherwise, it will have padding.
  static List<Widget> generate({
    required EdgeInsets padding,
    required List<Widget> Function(EdgeInsets padding) children,
  }) {
    return children(padding).map((child) {
      if (child is RemovePaddingIgnore) {
        return child;
      }

      return Padding(
        padding: padding,
        child: child,
      );
    }).toList(growable: false);
  }
}

class RemovePaddingIgnore extends StatelessWidget {
  const RemovePaddingIgnore({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

extension RemovePaddingX on Widget {
  RemovePaddingIgnore get toRemovePaddingIgnore {
    return RemovePaddingIgnore(
      child: this,
    );
  }
}
