part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesSvSE {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'E-post används redan, använd en annan e-postadress.',
      'invalid-email' ||
      'auth/invalid-email' => 'E-postadressen är inte giltig.',
      'operation-not-allowed' => 'E-post/lösenordskonton är inte aktiverade.',
      'weak-password' => 'Lösenordet är inte tillräckligt starkt.',
      'too-many-requests' => 'För många förfrågningar, försök igen senare.',
      'user-token-expired' => 'Användartoken har gått ut, logga in igen.',
      'network-request-failed' =>
        'Nätverksförfrågan misslyckades, försök igen.',
      'user-disabled' => 'Användaren har inaktiverats.',
      'user-not-found' || 'auth/user-not-found' => 'Användare hittades inte.',
      'wrong-password' => 'E-post eller lösenord är felaktigt.',
      'INVALID_LOGIN_CREDENTIALS' => 'E-post eller lösenord är felaktigt.',
      _ => 'Ett fel uppstod, försök igen senare.',
    };
  }
}
