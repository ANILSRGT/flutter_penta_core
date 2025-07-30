import 'package:flutter/material.dart';

class FirebaseExceptionConverter {
  const FirebaseExceptionConverter._();

  static String getMessage(String code, {Locale? locale}) {
    if (locale == null) return _getMessageEnUS(code);

    final fullLocale = '${locale.languageCode}_${locale.countryCode}';

    return switch (fullLocale) {
      'tr_TR' => _getMessageTrTR(code),
      'de_DE' => _getMessageDeDE(code),
      'fr_FR' => _getMessageFrFR(code),
      'es_ES' => _getMessageEsES(code),
      'ar_SA' => _getMessageArSA(code),
      'en_UK' => _getMessageEnUK(code),
      _ => _getMessageEnUS(code),
    };
  }

  static String _getMessageEnUS(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'Email already in use, please use another email address.',
      'invalid-email' ||
      'auth/invalid-email' => 'The email address is not valid.',
      'operation-not-allowed' => 'Email/password accounts are not enabled.',
      'weak-password' => 'The password is not strong enough.',
      'too-many-requests' => 'Too many requests, please try again later.',
      'user-token-expired' => 'User token expired, please login again.',
      'network-request-failed' => 'Network request failed, please try again.',
      'user-disabled' => 'User has been disabled.',
      'user-not-found' || 'auth/user-not-found' => 'User not found.',
      'wrong-password' => 'Email or password is incorrect.',
      'INVALID_LOGIN_CREDENTIALS' => 'Email or password is incorrect.',
      _ => 'An error occurred, please try again later.',
    };
  }

  static String _getMessageTrTR(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'Email zaten kullanımda, lütfen başka bir email adresi kullanın.',
      'invalid-email' || 'auth/invalid-email' => 'Email adresi geçersiz.',
      'operation-not-allowed' => 'Email/şifre hesapları etkin değil.',
      'weak-password' => 'Şifre yeterince güçlü değil.',
      'too-many-requests' =>
        'Çok fazla istek, lütfen daha sonra tekrar deneyin.',
      'user-token-expired' =>
        'Kullanıcı jetonu süresi doldu, lütfen tekrar giriş yapın.',
      'network-request-failed' =>
        'Ağ isteği başarısız oldu, lütfen tekrar deneyin.',
      'user-disabled' => 'Kullanıcı devre dışı bırakıldı.',
      'user-not-found' || 'auth/user-not-found' => 'Kullanıcı bulunamadı.',
      'wrong-password' => 'Email veya şifre yanlış.',
      'INVALID_LOGIN_CREDENTIALS' => 'Email veya şifre yanlış.',
      _ => 'Bir hata oluştu, lütfen daha sonra tekrar deneyin.',
    };
  }

  static String _getMessageDeDE(String code) {
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

  static String _getMessageFrFR(String code) {
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

  static String _getMessageEsES(String code) {
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

  static String _getMessageArSA(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'البريد الإلكتروني مستخدم بالفعل، يرجى استخدام عنوان بريد إلكتروني آخر.',
      'invalid-email' ||
      'auth/invalid-email' => 'عنوان البريد الإلكتروني غير صالح.',
      'operation-not-allowed' =>
        'حسابات البريد الإلكتروني/كلمة المرور غير مفعلة.',
      'weak-password' => 'كلمة المرور ليست قوية بما يكفي.',
      'too-many-requests' => 'طلبات كثيرة جداً، يرجى المحاولة مرة أخرى لاحقاً.',
      'user-token-expired' =>
        'انتهت صلاحية رمز المستخدم، يرجى تسجيل الدخول مرة أخرى.',
      'network-request-failed' => 'فشل طلب الشبكة، يرجى المحاولة مرة أخرى.',
      'user-disabled' => 'تم تعطيل المستخدم.',
      'user-not-found' ||
      'auth/user-not-found' => 'لم يتم العثور على المستخدم.',
      'wrong-password' => 'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
      'INVALID_LOGIN_CREDENTIALS' =>
        'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
      _ => 'حدث خطأ، يرجى المحاولة مرة أخرى لاحقاً.',
    };
  }

  static String _getMessageEnUK(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'Email already in use, please use another email address.',
      'invalid-email' ||
      'auth/invalid-email' => 'The email address is not valid.',
      'operation-not-allowed' => 'Email/password accounts are not enabled.',
      'weak-password' => 'The password is not strong enough.',
      'too-many-requests' => 'Too many requests, please try again later.',
      'user-token-expired' => 'User token expired, please log in again.',
      'network-request-failed' => 'Network request failed, please try again.',
      'user-disabled' => 'User has been disabled.',
      'user-not-found' || 'auth/user-not-found' => 'User not found.',
      'wrong-password' => 'Email or password is incorrect.',
      'INVALID_LOGIN_CREDENTIALS' => 'Email or password is incorrect.',
      _ => 'An error occurred, please try again later.',
    };
  }
}
