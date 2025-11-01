part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesNlNL {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'E-mail wordt al gebruikt, gebruik een ander e-mailadres.',
      'invalid-email' ||
      'auth/invalid-email' => 'Het e-mailadres is niet geldig.',
      'operation-not-allowed' =>
        'E-mail/wachtwoord accounts zijn niet ingeschakeld.',
      'weak-password' => 'Het wachtwoord is niet sterk genoeg.',
      'too-many-requests' => 'Te veel verzoeken, probeer het later opnieuw.',
      'user-token-expired' => 'Gebruikerstoken verlopen, log opnieuw in.',
      'network-request-failed' =>
        'Netwerkverzoek mislukt, probeer het opnieuw.',
      'user-disabled' => 'Gebruiker is uitgeschakeld.',
      'user-not-found' || 'auth/user-not-found' => 'Gebruiker niet gevonden.',
      'wrong-password' => 'E-mail of wachtwoord is onjuist.',
      'INVALID_LOGIN_CREDENTIALS' => 'E-mail of wachtwoord is onjuist.',
      _ => 'Er is een fout opgetreden, probeer het later opnieuw.',
    };
  }
}
