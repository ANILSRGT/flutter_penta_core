import 'package:flutter/foundation.dart';

/// Spacing / sizing scale used by [AppValues].
///
/// Configure it once at startup:
///
/// ```dart
/// AppValues.configure(const AppValuesConfig(md: 14, lg: 18));
/// ```
@immutable
final class AppValuesConfig {
  const AppValuesConfig({
    this.infinity = double.infinity,
    this.zero = 0,
    this.xxs = 2,
    this.xs = 4,
    this.sm = 8,
    this.md = 12,
    this.lg = 16,
    this.xl = 20,
    this.xl2 = 24,
    this.xl3 = 28,
    this.xl4 = 32,
    this.xl5 = 36,
    this.xl6 = 40,
    this.full = 9999,
  });

  /// Active configuration.
  @Deprecated('Use AppValues.config instead. Will be removed in 4.0.0.')
  static AppValuesConfig get I => AppValues.config;

  /// Replaces the active configuration with the given values.
  @Deprecated(
    'Use AppValues.configure(AppValuesConfig(...)) instead. '
    'Will be removed in 4.0.0.',
  )
  static void initialize({
    double? infinity,
    double? zero,
    double? xxs,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xl2,
    double? xl3,
    double? xl4,
    double? xl5,
    double? xl6,
    double? full,
  }) {
    AppValues.configure(
      const AppValuesConfig().copyWith(
        infinity: infinity,
        zero: zero,
        xxs: xxs,
        xs: xs,
        sm: sm,
        md: md,
        lg: lg,
        xl: xl,
        xl2: xl2,
        xl3: xl3,
        xl4: xl4,
        xl5: xl5,
        xl6: xl6,
        full: full,
      ),
    );
  }

  final double infinity;
  final double zero;
  final double xxs;
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xl2;
  final double xl3;
  final double xl4;
  final double xl5;
  final double xl6;
  final double full;

  /// Returns the configured value of [value].
  double resolve(AppValues value) => switch (value) {
    AppValues.infinity => infinity,
    AppValues.zero => zero,
    AppValues.xxs => xxs,
    AppValues.xs => xs,
    AppValues.sm => sm,
    AppValues.md => md,
    AppValues.lg => lg,
    AppValues.xl => xl,
    AppValues.xl2 => xl2,
    AppValues.xl3 => xl3,
    AppValues.xl4 => xl4,
    AppValues.xl5 => xl5,
    AppValues.xl6 => xl6,
    AppValues.full => full,
  };

  AppValuesConfig copyWith({
    double? infinity,
    double? zero,
    double? xxs,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xl2,
    double? xl3,
    double? xl4,
    double? xl5,
    double? xl6,
    double? full,
  }) {
    return AppValuesConfig(
      infinity: infinity ?? this.infinity,
      zero: zero ?? this.zero,
      xxs: xxs ?? this.xxs,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xl2: xl2 ?? this.xl2,
      xl3: xl3 ?? this.xl3,
      xl4: xl4 ?? this.xl4,
      xl5: xl5 ?? this.xl5,
      xl6: xl6 ?? this.xl6,
      full: full ?? this.full,
    );
  }
}

/// Design token scale for paddings, gaps and radii.
///
/// Values come from the active [AppValuesConfig]; change it with
/// [AppValues.configure].
enum AppValues {
  /// `double.infinity`
  infinity,

  /// 0
  zero,

  /// 2
  xxs,

  /// 4
  xs,

  /// 8
  sm,

  /// 12
  md,

  /// 16
  lg,

  /// 20
  xl,

  /// 24
  xl2,

  /// 28
  xl3,

  /// 32
  xl4,

  /// 36
  xl5,

  /// 40
  xl6,

  /// 9999
  full;

  static AppValuesConfig _config = const AppValuesConfig();

  /// The active configuration.
  static AppValuesConfig get config => _config;

  /// Replaces the active configuration. Call before `runApp`.
  static void configure(AppValuesConfig config) => _config = config;

  /// Restores the default configuration.
  @visibleForTesting
  static void reset() => _config = const AppValuesConfig();

  /// Configured value of this token.
  double get value => _config.resolve(this);
}
