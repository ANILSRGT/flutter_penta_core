part of 'locale_manager.dart';

/// Holds the active locale and translates keys with [LocaleManager] data.
class LocaleController<T extends Enum> extends ChangeNotifier {
  LocaleController({required T defaultLocale, this.fallbackLocale})
    : _currentLocale = defaultLocale;

  /// Used when a key is missing in [currentLocale].
  final T? fallbackLocale;

  T _currentLocale;
  T get currentLocale => _currentLocale;

  /// Switches the locale and rebuilds dependents.
  void changeLocale(T newLocale) {
    if (newLocale == _currentLocale) return;
    _currentLocale = newLocale;
    notifyListeners();
  }

  /// Whether [key] exists for the current (or fallback) locale.
  bool hasKey(String key) => _lookup(key) != null;

  /// Translation of [key], or [key] itself when missing.
  String translate(String key) => _lookup(key) ?? key;

  /// Fills `{}` placeholders in order: `"Hi {} and {}"` + `['A', 'B']`.
  String translateWithArgs(String key, List<Object?> args) {
    final value = _lookup(key);
    if (value == null) return key;
    var index = 0;
    return value.replaceAllMapped(
      '{}',
      (match) => index < args.length ? '${args[index++]}' : match[0]!,
    );
  }

  /// Fills `{name}` placeholders: `"Hi {name}"` + `{'name': 'Ada'}`.
  String translateWithNamedArgs(String key, Map<String, Object?> args) {
    final value = _lookup(key);
    if (value == null) return key;
    return value.replaceAllMapped(
      _namedPlaceholder,
      (match) => args.containsKey(match[1]) ? '${args[match[1]]}' : match[0]!,
    );
  }

  static final RegExp _namedPlaceholder = RegExp(r'\{(\w+)\}');

  String? _lookup(String key) {
    final manager = LocaleManager.I;
    return manager.lookup(_currentLocale, key) ??
        (fallbackLocale == null ? null : manager.lookup(fallbackLocale!, key));
  }
}
