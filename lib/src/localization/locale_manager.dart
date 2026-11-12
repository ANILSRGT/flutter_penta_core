import 'dart:convert' show jsonDecode;

import 'package:flutter/services.dart' show AssetBundle, rootBundle;
import 'package:flutter/widgets.dart';

part 'locale_controller.dart';
part 'locale_extensions.dart';
part 'locale_manager_provider.dart';

/// Loads JSON translation files and stores them per locale enum value.
///
/// File names must match the enum value names:
///
/// ```text
/// assets/translations/en.json   → AppLocale.en
/// assets/translations/enUS.json → AppLocale.enUS
/// ```
///
/// Nested objects are flattened with dots: `{"home": {"title": "Hi"}}` is
/// available as `home.title`.
final class LocaleManager {
  LocaleManager._();

  static final LocaleManager _instance = LocaleManager._();

  /// Global instance.
  static LocaleManager get I => _instance;

  /// Global instance.
  static LocaleManager get instance => _instance;

  final Map<Enum, Map<String, String>> _strings = {};
  LocaleController<Enum>? _controller;

  /// Controller of the mounted [LocaleManagerProvider], used by the
  /// context-less `tr()` helpers. `null` before the provider is built.
  LocaleController<Enum>? get controller => _controller;

  /// Controller of the mounted [LocaleManagerProvider].
  @Deprecated('Use controller instead. Will be removed in 4.0.0.')
  LocaleController<Enum>? get notifier => _controller;

  /// Locales loaded so far.
  Iterable<Enum> get loadedLocales => _strings.keys;

  /// Loads `<assetFolderPath>/<locale.name>.json` for every value of
  /// [enumValues]. A missing or invalid file logs a warning and leaves that
  /// locale empty (keys are returned as-is).
  Future<void> initialize<T extends Enum>({
    required String assetFolderPath,
    required List<T> enumValues,
    AssetBundle? bundle,
  }) async {
    final assets = bundle ?? rootBundle;
    final folder = assetFolderPath.endsWith('/')
        ? assetFolderPath
        : '$assetFolderPath/';

    await Future.wait(
      enumValues.map((locale) async {
        final path = '$folder${locale.name}.json';
        try {
          final json = jsonDecode(await assets.loadString(path));
          loadFromMap(locale, json as Map<String, dynamic>);
        } on Object catch (error) {
          debugPrint('penta_core: could not load "$path": $error');
          _strings[locale] = const {};
        }
      }),
    );
  }

  /// Registers translations for [locale] from a decoded JSON map.
  /// Useful for tests or for translations fetched from a server.
  void loadFromMap(Enum locale, Map<String, dynamic> json) {
    _strings[locale] = _flatten(json);
  }

  /// Raw translation of [key] for [locale], or `null`.
  String? lookup(Enum locale, String key) => _strings[locale]?[key];

  /// Removes all translations and the registered controller.
  @visibleForTesting
  void reset() {
    _strings.clear();
    _controller = null;
  }

  static Map<String, String> _flatten(
    Map<String, dynamic> map, [
    String prefix = '',
  ]) {
    final result = <String, String>{};
    map.forEach((key, value) {
      final fullKey = prefix.isEmpty ? key : '$prefix.$key';
      if (value is Map<String, dynamic>) {
        result.addAll(_flatten(value, fullKey));
      } else if (value != null) {
        result[fullKey] = value.toString();
      }
    });
    return result;
  }
}
