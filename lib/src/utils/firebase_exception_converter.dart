import 'dart:ui' show Locale;

part 'firebase_exception_messages.dart';

/// Converts Firebase Auth error codes into localized, user friendly messages.
///
/// ```dart
/// on FirebaseAuthException catch (e) {
///   final text = FirebaseExceptionConverter.getMessage(
///     e.code,
///     locale: Localizations.localeOf(context),
///   );
/// }
/// ```
///
/// The locale is matched by `language_COUNTRY`, then by language only, and
/// falls back to `en_US`.
abstract final class FirebaseExceptionConverter {
  static const _fallbackLocale = 'en_US';

  static const _aliases = <String, String>{
    'INVALID_LOGIN_CREDENTIALS': 'wrong-password',
    'invalid-login-credentials': 'wrong-password',
    'invalid-credential': 'wrong-password',
  };

  /// Supported `language_COUNTRY` keys.
  static Iterable<String> get supportedLocales => _firebaseMessages.keys;

  static String getMessage(String code, {Locale? locale}) {
    final messages = _messagesFor(locale);
    final normalized = code.startsWith('auth/') ? code.substring(5) : code;
    final key = _aliases[normalized] ?? normalized;
    return messages[key] ?? messages['_default']!;
  }

  static Map<String, String> _messagesFor(Locale? locale) {
    if (locale == null) return _firebaseMessages[_fallbackLocale]!;

    final exact =
        _firebaseMessages['${locale.languageCode}_${locale.countryCode}'];
    if (exact != null) return exact;

    final preferred = locale.languageCode == 'en' ? _fallbackLocale : null;
    if (preferred != null) return _firebaseMessages[preferred]!;

    for (final entry in _firebaseMessages.entries) {
      if (entry.key.startsWith('${locale.languageCode}_')) return entry.value;
    }
    return _firebaseMessages[_fallbackLocale]!;
  }
}
