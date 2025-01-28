import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

@immutable
class PentaAdaptiveWidget extends StatelessWidget {
  /// Creates a widget that can be adapted to different platforms.
  /// <br>The [defaultWidget] is used when the platform is not specified.
  /// <br>The [mobile] is used for Android and iOS.
  /// <br>The [desktop] is used for Linux, macOS, and Windows.
  /// <br>The [web] is used for web.
  const PentaAdaptiveWidget.compact({
    required this.defaultWidget,
    super.key,
    Widget? mobile,
    Widget? desktop,
    this.web,
  })  : android = mobile,
        ios = mobile,
        fuchsia = mobile,
        linux = desktop,
        macos = desktop,
        windows = desktop;

  /// Creates a widget that can be adapted to different platforms.
  /// <br>The [defaultWidget] is used when the platform is not specified.
  /// <br>The [android], [ios], [fuchsia], [linux], [macos], [windows], and
  /// [web]
  const PentaAdaptiveWidget.withPlatform({
    required this.defaultWidget,
    super.key,
    this.android,
    this.ios,
    this.fuchsia,
    this.linux,
    this.macos,
    this.windows,
    this.web,
  });

  final Widget defaultWidget;
  final Widget? android;
  final Widget? ios;
  final Widget? fuchsia;
  final Widget? linux;
  final Widget? macos;
  final Widget? windows;
  final Widget? web;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return web ?? defaultWidget;
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      return android ?? defaultWidget;
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      return ios ?? defaultWidget;
    } else if (Theme.of(context).platform == TargetPlatform.fuchsia) {
      return fuchsia ?? defaultWidget;
    } else if (Theme.of(context).platform == TargetPlatform.linux) {
      return linux ?? defaultWidget;
    } else if (Theme.of(context).platform == TargetPlatform.macOS) {
      return macos ?? defaultWidget;
    } else if (Theme.of(context).platform == TargetPlatform.windows) {
      return windows ?? defaultWidget;
    }

    return defaultWidget;
  }
}
