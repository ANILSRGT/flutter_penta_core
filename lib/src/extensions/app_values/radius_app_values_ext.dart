part of 'app_values_ext.dart';

final class _RadiusAppValuesExt {
  const _RadiusAppValuesExt(AppValues value) : _value = value;
  final AppValues _value;

  Radius get circular => Radius.circular(_value.value);
  _BorderRadiusAppValuesExt get border => _BorderRadiusAppValuesExt(_value);
}

final class _BorderRadiusAppValuesExt {
  const _BorderRadiusAppValuesExt(AppValues value) : _value = value;
  final AppValues _value;

  BorderRadius get all => BorderRadius.circular(_value.value);
  _BoderRadiusOnlyAppValuesExt get directional =>
      _BoderRadiusOnlyAppValuesExt(_value);
}

final class _BoderRadiusOnlyAppValuesExt {
  const _BoderRadiusOnlyAppValuesExt(AppValues value) : _value = value;
  final AppValues _value;

  BorderRadius get tl =>
      BorderRadius.only(topLeft: Radius.circular(_value.value));
  BorderRadius get tr =>
      BorderRadius.only(topRight: Radius.circular(_value.value));
  BorderRadius get bl =>
      BorderRadius.only(bottomLeft: Radius.circular(_value.value));
  BorderRadius get br =>
      BorderRadius.only(bottomRight: Radius.circular(_value.value));
  BorderRadius get top => tl + tr;
  BorderRadius get bottom => bl + br;
  BorderRadius get left => tl + bl;
  BorderRadius get right => tr + br;
}
