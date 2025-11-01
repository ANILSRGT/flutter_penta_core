part of 'package:penta_core/src/utils/firebase_exception_converter.dart';

class _FirebaseExceptionMessagesTrTR {
  static String getMessage(String code) {
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
}
