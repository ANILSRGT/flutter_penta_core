import 'package:flutter/widgets.dart';
import 'package:penta_core/src/constants/app_values.dart';
import 'package:penta_core/src/widgets/gap/gap.dart';

/// Gives access to [AppValuesExt] through `AppValues.md.ext`.
extension AppValuesExtension on AppValues {
  AppValuesExt get ext => AppValuesExt(this);
}

/// Widgets and geometry built from an [AppValues] token.
extension type const AppValuesExt(AppValues _token) {
  double get value => _token.value;

  /// `EdgeInsets` helpers, e.g. `AppValues.md.ext.padding.all`.
  AppValuesPaddingExt get padding => AppValuesPaddingExt(_token);

  /// `SizedBox` helpers, e.g. `AppValues.md.ext.sizedBox.vertical`.
  AppValuesSizedBoxExt get sizedBox => AppValuesSizedBoxExt(_token);

  /// `Radius` / `BorderRadius` helpers, e.g. `AppValues.md.ext.radius.border.all`.
  AppValuesRadiusExt get radius => AppValuesRadiusExt(_token);

  /// A [Gap] that follows the axis of the parent `Flex` or scrollable.
  Gap get gap => Gap(_token.value);
}

extension type const AppValuesPaddingExt(AppValues _token) {
  EdgeInsets get all => EdgeInsets.all(_token.value);
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: _token.value);
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: _token.value);
  AppValuesDirectionalPaddingExt get directional =>
      AppValuesDirectionalPaddingExt(_token);
}

extension type const AppValuesDirectionalPaddingExt(AppValues _token) {
  double get _v => _token.value;

  EdgeInsets get left => EdgeInsets.only(left: _v);
  EdgeInsets get right => EdgeInsets.only(right: _v);
  EdgeInsets get top => EdgeInsets.only(top: _v);
  EdgeInsets get bottom => EdgeInsets.only(bottom: _v);

  EdgeInsets get lt => EdgeInsets.only(left: _v, top: _v);
  EdgeInsets get rt => EdgeInsets.only(right: _v, top: _v);
  EdgeInsets get lb => EdgeInsets.only(left: _v, bottom: _v);
  EdgeInsets get rb => EdgeInsets.only(right: _v, bottom: _v);

  EdgeInsets get ltb => EdgeInsets.only(left: _v, top: _v, bottom: _v);
  EdgeInsets get rtb => EdgeInsets.only(right: _v, top: _v, bottom: _v);
  EdgeInsets get lrt => EdgeInsets.only(left: _v, right: _v, top: _v);
  EdgeInsets get lrb => EdgeInsets.only(left: _v, right: _v, bottom: _v);

  /// Start (left in LTR, right in RTL).
  EdgeInsetsDirectional get start => EdgeInsetsDirectional.only(start: _v);

  /// End (right in LTR, left in RTL).
  EdgeInsetsDirectional get end => EdgeInsetsDirectional.only(end: _v);
}

extension type const AppValuesSizedBoxExt(AppValues _token) {
  SizedBox get horizontal => SizedBox(width: _token.value);
  SizedBox get vertical => SizedBox(height: _token.value);
  SizedBox get square => SizedBox.square(dimension: _token.value);
}

extension type const AppValuesRadiusExt(AppValues _token) {
  Radius get circular => Radius.circular(_token.value);
  AppValuesBorderRadiusExt get border => AppValuesBorderRadiusExt(_token);
}

extension type const AppValuesBorderRadiusExt(AppValues _token) {
  BorderRadius get all => BorderRadius.circular(_token.value);
  AppValuesBorderRadiusOnlyExt get directional =>
      AppValuesBorderRadiusOnlyExt(_token);
}

extension type const AppValuesBorderRadiusOnlyExt(AppValues _token) {
  Radius get _r => Radius.circular(_token.value);

  BorderRadius get tl => BorderRadius.only(topLeft: _r);
  BorderRadius get tr => BorderRadius.only(topRight: _r);
  BorderRadius get bl => BorderRadius.only(bottomLeft: _r);
  BorderRadius get br => BorderRadius.only(bottomRight: _r);
  BorderRadius get top => BorderRadius.vertical(top: _r);
  BorderRadius get bottom => BorderRadius.vertical(bottom: _r);
  BorderRadius get left => BorderRadius.horizontal(left: _r);
  BorderRadius get right => BorderRadius.horizontal(right: _r);
}
