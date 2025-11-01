part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesDeDE {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'E-Mail wird bereits verwendet, bitte verwenden Sie eine andere E-Mail-Adresse.',
      'invalid-email' ||
      'auth/invalid-email' => 'Die E-Mail-Adresse ist nicht gültig.',
      'operation-not-allowed' => 'E-Mail/Passwort-Konten sind nicht aktiviert.',
      'weak-password' => 'Das Passwort ist nicht stark genug.',
      'too-many-requests' =>
        'Zu viele Anfragen, bitte versuchen Sie es später erneut.',
      'user-token-expired' =>
        'Benutzer-Token abgelaufen, bitte melden Sie sich erneut an.',
      'network-request-failed' =>
        'Netzwerkanfrage fehlgeschlagen, bitte versuchen Sie es erneut.',
      'user-disabled' => 'Benutzer wurde deaktiviert.',
      'user-not-found' || 'auth/user-not-found' => 'Benutzer nicht gefunden.',
      'wrong-password' => 'E-Mail oder Passwort ist falsch.',
      'INVALID_LOGIN_CREDENTIALS' => 'E-Mail oder Passwort ist falsch.',
      _ => 'Ein Fehler ist aufgetreten, bitte versuchen Sie es später erneut.',
    };
  }
}
