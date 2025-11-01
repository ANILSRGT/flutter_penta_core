part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesPlPL {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'E-mail jest już używany, użyj innego adresu e-mail.',
      'invalid-email' ||
      'auth/invalid-email' => 'Adres e-mail jest nieprawidłowy.',
      'operation-not-allowed' => 'Konta e-mail/hasło nie są włączone.',
      'weak-password' => 'Hasło nie jest wystarczająco silne.',
      'too-many-requests' => 'Zbyt wiele żądań, spróbuj ponownie później.',
      'user-token-expired' => 'Token użytkownika wygasł, zaloguj się ponownie.',
      'network-request-failed' =>
        'Żądanie sieciowe nie powiodło się, spróbuj ponownie.',
      'user-disabled' => 'Użytkownik został wyłączony.',
      'user-not-found' ||
      'auth/user-not-found' => 'Nie znaleziono użytkownika.',
      'wrong-password' => 'E-mail lub hasło jest nieprawidłowe.',
      'INVALID_LOGIN_CREDENTIALS' => 'E-mail lub hasło jest nieprawidłowe.',
      _ => 'Wystąpił błąd, spróbuj ponownie później.',
    };
  }
}
