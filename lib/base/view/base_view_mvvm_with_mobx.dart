import 'package:mobx/mobx.dart';

import 'base_view_mvvm.dart';

class BaseViewMVVMWithMobx<T extends Store> extends BaseViewMVVM<T> {
  const BaseViewMVVMWithMobx({
    super.key,
    required super.viewModel,
    required super.onPageBuilder,
    required super.onModelReady,
  });
}
