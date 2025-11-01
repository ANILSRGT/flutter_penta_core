part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesRuRU {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'Электронная почта уже используется, используйте другой адрес электронной почты.',
      'invalid-email' ||
      'auth/invalid-email' => 'Адрес электронной почты недействителен.',
      'operation-not-allowed' =>
        'Учетные записи электронной почты/пароля не включены.',
      'weak-password' => 'Пароль недостаточно надежный.',
      'too-many-requests' => 'Слишком много запросов, попробуйте позже.',
      'user-token-expired' => 'Токен пользователя истек, войдите снова.',
      'network-request-failed' => 'Сетевой запрос не удался, попробуйте снова.',
      'user-disabled' => 'Пользователь отключен.',
      'user-not-found' || 'auth/user-not-found' => 'Пользователь не найден.',
      'wrong-password' => 'Электронная почта или пароль неверны.',
      'INVALID_LOGIN_CREDENTIALS' => 'Электронная почта или пароль неверны.',
      _ => 'Произошла ошибка, попробуйте позже.',
    };
  }
}
