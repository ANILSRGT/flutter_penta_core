part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesFrFR {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'Email déjà utilisé, veuillez utiliser une autre adresse email.',
      'invalid-email' ||
      'auth/invalid-email' => "L'adresse email n'est pas valide.",
      'operation-not-allowed' =>
        'Les comptes email/mot de passe ne sont pas activés.',
      'weak-password' => "Le mot de passe n'est pas assez fort.",
      'too-many-requests' => 'Trop de demandes, veuillez réessayer plus tard.',
      'user-token-expired' =>
        'Jeton utilisateur expiré, veuillez vous reconnecter.',
      'network-request-failed' =>
        'Échec de la requête réseau, veuillez réessayer.',
      'user-disabled' => "L'utilisateur a été désactivé.",
      'user-not-found' || 'auth/user-not-found' => 'Utilisateur non trouvé.',
      'wrong-password' => 'Email ou mot de passe incorrect.',
      'INVALID_LOGIN_CREDENTIALS' => 'Email ou mot de passe incorrect.',
      _ => "Une erreur s'est produite, veuillez réessayer plus tard.",
    };
  }
}
