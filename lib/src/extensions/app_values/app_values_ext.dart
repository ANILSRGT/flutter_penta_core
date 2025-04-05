import 'package:flutter/material.dart';
import 'package:penta_core/src/constants/app_values.dart';

part 'padding_app_values_ext.dart';
part 'sizedbox_app_values_ext.dart';
part 'radius_app_values_ext.dart';

extension AppValuesExt on AppValues {
  _AppValuesExt get ext => _AppValuesExt(this);
}

final class _AppValuesExt {
  const _AppValuesExt(AppValues value) : _value = value;

  final AppValues _value;

  _PaddingAppValuesExt get padding => _PaddingAppValuesExt(_value);
  _SizedBoxAppValuesExt get sizedBox => _SizedBoxAppValuesExt(_value);
  _RadiusAppValuesExt get radius => _RadiusAppValuesExt(_value);
}
