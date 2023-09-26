import 'package:mobx/mobx.dart';

import 'penta_base_view_mvvm.dart';

class PentaBaseViewMVVMWithMobx<T extends Store> extends PentaBaseViewMVVM<T> {
  const PentaBaseViewMVVMWithMobx({
    super.key,
    required super.viewModel,
    required super.onPageBuilder,
    required super.onModelReady,
  });
}
