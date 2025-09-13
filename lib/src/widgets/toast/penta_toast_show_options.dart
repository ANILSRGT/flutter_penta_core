part of 'penta_toast.dart';

class PentaToastShowOptions {
  const PentaToastShowOptions({
    this.config,
    this.onDismissed,
    this.dissmissAll = false,
    this.stackCount = 1,
    this.dissmissable = true,
  }) : assert(stackCount > 0, 'stackCount must be greater than 0');

  final PentaToastConfig? config;
  final VoidCallback? onDismissed;
  final bool dissmissable;
  final bool dissmissAll;
  final int stackCount;
}
