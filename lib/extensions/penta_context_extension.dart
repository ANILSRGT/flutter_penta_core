part of 'extensions.dart';

extension PentaContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;

  double get safePaddingTop => MediaQuery.of(this).padding.top;
  double get safePaddingBottom => MediaQuery.of(this).padding.bottom;
  double get safePaddingLeft => MediaQuery.of(this).padding.left;
  double get safePaddingRight => MediaQuery.of(this).padding.right;

  double get lowValue => 10;
  double get mediumValue => 20;
  double get highValue => 40;
  double get extraHighValue => 80;

  double dynamicHeight(double value) => height * value;
  double dynamicWidth(double value) => width * value;

  double dynamicOrientationSize(double value) =>
      dynamicOrientation(dynamicHeight(value), dynamicWidth(value))!;
  double dynamicOrientationWidth(double portraitValue, double landscapeValue) =>
      dynamicOrientation(dynamicWidth(portraitValue), dynamicWidth(landscapeValue))!;
  double dynamicOrientationHeight(double portraitValue, double landscapeValue) =>
      dynamicOrientation(dynamicHeight(portraitValue), dynamicHeight(landscapeValue))!;

  double? staticOrientationWidth(double? portraitValue, double? landscapeValue) =>
      dynamicOrientation(portraitValue, landscapeValue);
  double? staticOrientationHeight(double? portraitValue, double? landscapeValue) =>
      dynamicOrientation(portraitValue, landscapeValue);

  T? dynamicBrightness<T>(T forLight, T forDark) =>
      brightness == Brightness.light ? forLight : forDark;
  T? dynamicOrientation<T>(T? forPortrait, T? forLandscape) =>
      width > height ? forLandscape : forPortrait;

  double dynamicResponsivePerBeetweenSize(double beetween, double increaseAmount) {
    return width / beetween + increaseAmount;
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  Brightness get brightness => theme.brightness;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(dynamicOrientationSize(0.015));
  EdgeInsets get paddingMedium => EdgeInsets.all(dynamicOrientationSize(0.025));
  EdgeInsets get paddingHigh => EdgeInsets.all(dynamicOrientationSize(0.035));
  EdgeInsets get paddingExtraHigh => EdgeInsets.all(dynamicOrientationSize(0.045));

  EdgeInsets get paddingLowVertical =>
      EdgeInsets.symmetric(vertical: dynamicOrientationSize(0.015));
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: dynamicOrientationSize(0.025));
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: dynamicOrientationSize(0.035));
  EdgeInsets get paddingExtraHighVertical =>
      EdgeInsets.symmetric(vertical: dynamicOrientationSize(0.045));

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: dynamicOrientationSize(0.015));
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: dynamicOrientationSize(0.025));
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: dynamicOrientationSize(0.035));
  EdgeInsets get paddingExtraHighHorizontal =>
      EdgeInsets.symmetric(horizontal: dynamicOrientationSize(0.045));
}

extension IconSizeExtension on BuildContext {
  double get iconLow => 20;
  double get iconMedium => 28;
  double get iconHigh => 32;
  double get iconExtraHigh => 48;
}

extension RadiusExtension on BuildContext {
  Radius get radiusLow => const Radius.circular(15);
  Radius get radiusMedium => const Radius.circular(20);
  Radius get radiusHigh => const Radius.circular(25);
  Radius get radiusExtraHigh => const Radius.circular(30);
  Radius get radiusCircular => const Radius.circular(100);

  Radius get radiusResponsiveLow => Radius.circular(dynamicOrientationSize(0.01));
  Radius get radiusResponsiveMedium => Radius.circular(dynamicOrientationSize(0.015));
  Radius get radiusResponsiveHigh => Radius.circular(dynamicOrientationSize(0.02));
  Radius get radiusResponsiveExtraHigh => Radius.circular(dynamicOrientationSize(0.03));
}

extension DurationExtension on BuildContext {
  Duration get durationLow => const Duration(milliseconds: 200);
  Duration get durationMedium => const Duration(milliseconds: 400);
  Duration get durationHigh => const Duration(milliseconds: 600);
  Duration get durationExtraHigh => const Duration(milliseconds: 800);

  Duration get animationDurationLow => const Duration(milliseconds: 250);
  Duration get animationDurationMedium => const Duration(milliseconds: 500);
  Duration get animationDurationHigh => const Duration(milliseconds: 750);
  Duration get animationDurationExtraHigh => const Duration(milliseconds: 1000);
}
