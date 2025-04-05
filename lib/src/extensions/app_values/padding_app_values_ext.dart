part of 'app_values_ext.dart';

final class _PaddingAppValuesExt {
  const _PaddingAppValuesExt(AppValues value) : _value = value;

  final AppValues _value;

  EdgeInsets get all => EdgeInsets.all(_value.value);
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: _value.value);
  EdgeInsets get vertical => EdgeInsets.symmetric(horizontal: _value.value);
  _PaddingAppValuesDirectionalExt get directional =>
      _PaddingAppValuesDirectionalExt(_value);
}

final class _PaddingAppValuesDirectionalExt {
  const _PaddingAppValuesDirectionalExt(AppValues value) : _value = value;

  final AppValues _value;

  EdgeInsets get left => EdgeInsets.only(left: _value.value);
  EdgeInsets get right => EdgeInsets.only(right: _value.value);
  EdgeInsets get top => EdgeInsets.only(top: _value.value);
  EdgeInsets get bottom => EdgeInsets.only(bottom: _value.value);

  EdgeInsets get lt => EdgeInsets.only(left: _value.value, top: _value.value);
  EdgeInsets get rt => EdgeInsets.only(right: _value.value, top: _value.value);
  EdgeInsets get lb =>
      EdgeInsets.only(left: _value.value, bottom: _value.value);
  EdgeInsets get rb =>
      EdgeInsets.only(right: _value.value, bottom: _value.value);

  EdgeInsets get ltb => EdgeInsets.only(
    left: _value.value,
    top: _value.value,
    bottom: _value.value,
  );
  EdgeInsets get rtb => EdgeInsets.only(
    right: _value.value,
    top: _value.value,
    bottom: _value.value,
  );
}
