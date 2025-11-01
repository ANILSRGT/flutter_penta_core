part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesUkUA {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'Електронна пошта вже використовується, використовуйте іншу адресу електронної пошти.',
      'invalid-email' ||
      'auth/invalid-email' => 'Адреса електронної пошти недійсна.',
      'operation-not-allowed' =>
        'Облікові записи електронної пошти/пароля не увімкнені.',
      'weak-password' => 'Пароль недостатньо надійний.',
      'too-many-requests' => 'Занадто багато запитів, спробуйте пізніше.',
      'user-token-expired' => 'Токен користувача закінчився, увійдіть знову.',
      'network-request-failed' => 'Мережевий запит не вдався, спробуйте знову.',
      'user-disabled' => 'Користувач відключений.',
      'user-not-found' || 'auth/user-not-found' => 'Користувача не знайдено.',
      'wrong-password' => 'Електронна пошта або пароль неправильні.',
      'INVALID_LOGIN_CREDENTIALS' => 'Електронна пошта або пароль неправильні.',
      _ => 'Сталася помилка, спробуйте пізніше.',
    };
  }
}
