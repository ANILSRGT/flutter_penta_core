part of 'app_values_ext.dart';

final class _SizedBoxAppValuesExt {
  const _SizedBoxAppValuesExt(AppValues value) : _value = value;
  final AppValues _value;

  SizedBox get horizontal => SizedBox(width: _value.value);
  SizedBox get vertical => SizedBox(height: _value.value);
}
