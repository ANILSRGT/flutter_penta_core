import 'dart:async';
import 'package:flutter/material.dart';

part 'penta_toast_config.dart';
part 'penta_toast_positions_enum.dart';
part 'penta_toast_show_options.dart';
part 'penta_toast_data.dart';
part 'penta_toast_controller.dart';

class PentaToast extends StatefulWidget {
  const PentaToast({
    this.child,
    super.key,
    PentaToastConfig? config,
  }) : _config = config ?? const PentaToastConfig();

  final Widget? child;
  final PentaToastConfig _config;

  @override
  State<PentaToast> createState() => _PentaToastState();
}

class _PentaToastState extends State<PentaToast> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (ctx) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              PentaToastController.I.init(
                overlayState: Overlay.of(ctx),
                config: widget._config,
                vsync: this,
              );
            });
            return widget.child ?? const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
