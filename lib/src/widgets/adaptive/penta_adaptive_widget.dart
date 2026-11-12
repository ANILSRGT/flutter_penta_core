import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

/// Shows a different widget per platform.
///
/// The platform comes from `Theme.of(context).platform`, so it follows
/// `ThemeData.platform` overrides (useful in tests and previews).
class PentaAdaptiveWidget extends StatelessWidget {
  /// [mobile] is used for Android, iOS and Fuchsia, [desktop] for Linux,
  /// macOS and Windows, [web] for the browser. [defaultWidget] fills the gaps.
  const PentaAdaptiveWidget.compact({
    required this.defaultWidget,
    super.key,
    Widget? mobile,
    Widget? desktop,
    this.web,
  }) : android = mobile,
       ios = mobile,
       fuchsia = mobile,
       linux = desktop,
       macos = desktop,
       windows = desktop;

  /// One widget per platform; [defaultWidget] fills the gaps.
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
    if (kIsWeb) return web ?? defaultWidget;
    final platformWidget = switch (Theme.of(context).platform) {
      TargetPlatform.android => android,
      TargetPlatform.iOS => ios,
      TargetPlatform.fuchsia => fuchsia,
      TargetPlatform.linux => linux,
      TargetPlatform.macOS => macos,
      TargetPlatform.windows => windows,
    };
    return platformWidget ?? defaultWidget;
  }
}
