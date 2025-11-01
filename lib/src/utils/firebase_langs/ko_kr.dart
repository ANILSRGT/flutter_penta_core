part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesKoKR {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' => '이미 사용 중인 이메일입니다. 다른 이메일 주소를 사용해 주세요.',
      'invalid-email' || 'auth/invalid-email' => '이메일 주소가 유효하지 않습니다.',
      'operation-not-allowed' => '이메일/비밀번호 계정이 활성화되지 않았습니다.',
      'weak-password' => '비밀번호가 충분히 강력하지 않습니다.',
      'too-many-requests' => '요청이 너무 많습니다. 나중에 다시 시도해 주세요.',
      'user-token-expired' => '사용자 토큰이 만료되었습니다. 다시 로그인해 주세요.',
      'network-request-failed' => '네트워크 요청이 실패했습니다. 다시 시도해 주세요.',
      'user-disabled' => '사용자가 비활성화되었습니다.',
      'user-not-found' || 'auth/user-not-found' => '사용자를 찾을 수 없습니다.',
      'wrong-password' => '이메일 또는 비밀번호가 올바르지 않습니다.',
      'INVALID_LOGIN_CREDENTIALS' => '이메일 또는 비밀번호가 올바르지 않습니다.',
      _ => '오류가 발생했습니다. 나중에 다시 시도해 주세요.',
    };
  }
}
