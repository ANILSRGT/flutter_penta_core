import 'package:mobx/mobx.dart';

import '../index.dart';

class BaseViewMVVMWithMobx<T extends Store> extends BaseViewMVVM<T> {
  const BaseViewMVVMWithMobx({
    super.key,
    required super.viewModel,
    required super.onPageBuilder,
    required super.onModelReady,
  });
}
