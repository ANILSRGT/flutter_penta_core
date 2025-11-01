part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesPtPT {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'E-mail já está em uso, use outro endereço de e-mail.',
      'invalid-email' ||
      'auth/invalid-email' => 'O endereço de e-mail não é válido.',
      'operation-not-allowed' =>
        'Contas de e-mail/senha não estão habilitadas.',
      'weak-password' => 'A senha não é forte o suficiente.',
      'too-many-requests' => 'Muitas solicitações, tente novamente mais tarde.',
      'user-token-expired' =>
        'Token do usuário expirado, faça login novamente.',
      'network-request-failed' =>
        'Solicitação de rede falhou, tente novamente.',
      'user-disabled' => 'Usuário foi desabilitado.',
      'user-not-found' || 'auth/user-not-found' => 'Usuário não encontrado.',
      'wrong-password' => 'E-mail ou senha incorretos.',
      'INVALID_LOGIN_CREDENTIALS' => 'E-mail ou senha incorretos.',
      _ => 'Ocorreu um erro, tente novamente mais tarde.',
    };
  }
}
