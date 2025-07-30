/// Configuration class for app values that can be initialized at app startup
class AppValuesConfig {
  AppValuesConfig._init();
  static final AppValuesConfig _instance = AppValuesConfig._init();
  static AppValuesConfig get I => _instance;

  /// Initialize app values with custom values
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
    AppValuesConfig.I
      .._infinity = infinity ?? double.infinity
      .._zero = zero ?? 0
      .._xxs = xxs ?? 2
      .._xs = xs ?? 4
      .._sm = sm ?? 8
      .._md = md ?? 12
      .._lg = lg ?? 16
      .._xl = xl ?? 20
      .._xl2 = xl2 ?? 24
      .._xl3 = xl3 ?? 28
      .._xl4 = xl4 ?? 32
      .._xl5 = xl5 ?? 36
      .._xl6 = xl6 ?? 40
      .._full = full ?? 9999;
  }

  // Private fields with default values
  double _infinity = double.infinity;
  double _zero = 0;
  double _xxs = 2;
  double _xs = 4;
  double _sm = 8;
  double _md = 12;
  double _lg = 16;
  double _xl = 20;
  double _xl2 = 24;
  double _xl3 = 28;
  double _xl4 = 32;
  double _xl5 = 36;
  double _xl6 = 40;
  double _full = 9999;

  // Getters
  double get infinity => _infinity;
  double get zero => _zero;
  double get xxs => _xxs;
  double get xs => _xs;
  double get sm => _sm;
  double get md => _md;
  double get lg => _lg;
  double get xl => _xl;
  double get xl2 => _xl2;
  double get xl3 => _xl3;
  double get xl4 => _xl4;
  double get xl5 => _xl5;
  double get xl6 => _xl6;
  double get full => _full;
}

/// AppValues enum that provides the same API as before but uses configurable values
enum AppValues {
  /// double.infinity
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

  /// Get the configurable value for this enum
  double get value {
    final config = AppValuesConfig.I;
    switch (this) {
      case AppValues.infinity:
        return config.infinity;
      case AppValues.zero:
        return config.zero;
      case AppValues.xxs:
        return config.xxs;
      case AppValues.xs:
        return config.xs;
      case AppValues.sm:
        return config.sm;
      case AppValues.md:
        return config.md;
      case AppValues.lg:
        return config.lg;
      case AppValues.xl:
        return config.xl;
      case AppValues.xl2:
        return config.xl2;
      case AppValues.xl3:
        return config.xl3;
      case AppValues.xl4:
        return config.xl4;
      case AppValues.xl5:
        return config.xl5;
      case AppValues.xl6:
        return config.xl6;
      case AppValues.full:
        return config.full;
    }
  }
}
