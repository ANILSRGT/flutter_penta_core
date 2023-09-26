import 'package:flutter/material.dart';

import '../state/penta_base_state.dart';

class PentaBaseView extends StatefulWidget {
  const PentaBaseView({
    Key? key,
    required this.init,
    required this.onPageBuilder,
    this.onDispose,
  }) : super(key: key);
  final Widget Function(BuildContext context) onPageBuilder;
  final VoidCallback? init;
  final VoidCallback? onDispose;

  @override
  State createState() => _PentaBaseViewState();
}

class _PentaBaseViewState extends PentaBaseState<PentaBaseView> {
  @override
  void initState() {
    if (widget.init != null) widget.init?.call();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose?.call();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context);
  }
}
