part of 'locale_manager.dart';

class _LocaleManagerNotifier<T extends Enum> extends ChangeNotifier {
  _LocaleManagerNotifier({required T defaultLocale})
    : _currentLocale = defaultLocale;

  T _currentLocale;
  T get currentLocale => _currentLocale;

  void changeLocale(T newLocale) {
    if (newLocale != _currentLocale) {
      _currentLocale = newLocale;
      notifyListeners();
    }
  }

  String translate(String key) {
    final localizedStrings =
        LocaleManager.I._localizedStrings[_currentLocale] ?? {};
    return localizedStrings[key] ?? key;
  }

  String translateWithArgs(String key, List<String> args) {
    final localizedStrings =
        LocaleManager.I._localizedStrings[_currentLocale] ?? {};
    if (localizedStrings.containsKey(key)) {
      var translatedString = localizedStrings[key] ?? key;
      for (var i = 0; i < args.length; i++) {
        translatedString = translatedString.replaceFirst('{}', args[i]);
      }
      return translatedString;
    }
    return key;
  }

  String translateWithNamedArgs(String key, Map<String, String> args) {
    final localizedStrings =
        LocaleManager.I._localizedStrings[_currentLocale] ?? {};
    if (localizedStrings.containsKey(key)) {
      var translatedString = localizedStrings[key] ?? key;
      for (final entry in args.entries) {
        translatedString = translatedString.replaceFirst(
          '{${entry.key}}',
          entry.value,
        );
      }
      return translatedString;
    }
    return key;
  }
}
