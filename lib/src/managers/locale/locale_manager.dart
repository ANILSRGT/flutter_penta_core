import 'dart:convert' show jsonDecode;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

part 'locale_manager_notifier.dart';
part 'locale_manager_provider.dart';
part 'locale_manager_extension.dart';

class LocaleManager<T extends Enum> {
  LocaleManager._init();
  static final LocaleManager _instance = LocaleManager._init();
  static LocaleManager get I => _instance;

  final Map<T, Map<String, String>> _localizedStrings = {};

  /// ex. json file path: `assets/translations/`
  /// <br/>ex. json file name: `en.json` or `enUS.json`
  /// <br/>ex. enum name: `AppLocales.en` or `AppLocales.enUS`
  /// <br/>`en.json` => `AppLocales.en`
  /// <br/>`enUS.json` => `AppLocales.enUS`
  Future<void> initialize({
    required String assetFolderPath,
    required List<T> enumValues,
  }) async {
    final folderPath =
        assetFolderPath.endsWith('/') ? assetFolderPath : '$assetFolderPath/';
    for (final locale in enumValues) {
      final localeName = locale.name;
      final filePath = '$folderPath$localeName.json';
      try {
        final jsonString = await rootBundle.loadString(filePath);
        final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
        _localizedStrings[locale] = _flattenJson(jsonMap);
      } catch (e) {
        throw FlutterError(
          'Failed to load localization file: $filePath. Error: $e',
        );
      }
    }
  }

  Map<String, String> _flattenJson(
    Map<String, dynamic> map, [
    String prefix = '',
  ]) {
    final result = <String, String>{};

    map.forEach((k, v) {
      final fullKey = prefix.isEmpty ? k : '$prefix.$k';
      if (v is Map<String, dynamic>) {
        result.addAll(_flattenJson(v, fullKey));
      } else {
        result[fullKey] = v.toString();
      }
    });

    return result;
  }
}
