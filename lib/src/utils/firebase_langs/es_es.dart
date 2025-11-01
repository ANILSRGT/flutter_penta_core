part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesEsES {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'Email ya está en uso, por favor use otra dirección de email.',
      'invalid-email' ||
      'auth/invalid-email' => 'La dirección de email no es válida.',
      'operation-not-allowed' =>
        'Las cuentas de email/contraseña no están habilitadas.',
      'weak-password' => 'La contraseña no es lo suficientemente fuerte.',
      'too-many-requests' =>
        'Demasiadas solicitudes, por favor inténtelo más tarde.',
      'user-token-expired' =>
        'Token de usuario expirado, por favor inicie sesión nuevamente.',
      'network-request-failed' =>
        'Solicitud de red fallida, por favor inténtelo de nuevo.',
      'user-disabled' => 'El usuario ha sido deshabilitado.',
      'user-not-found' || 'auth/user-not-found' => 'Usuario no encontrado.',
      'wrong-password' => 'Email o contraseña incorrectos.',
      'INVALID_LOGIN_CREDENTIALS' => 'Email o contraseña incorrectos.',
      _ => 'Ocurrió un error, por favor inténtelo más tarde.',
    };
  }
}
