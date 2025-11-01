part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesViVN {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'Email đã được sử dụng, vui lòng sử dụng địa chỉ email khác.',
      'invalid-email' || 'auth/invalid-email' => 'Địa chỉ email không hợp lệ.',
      'operation-not-allowed' =>
        'Tài khoản email/mật khẩu chưa được kích hoạt.',
      'weak-password' => 'Mật khẩu không đủ mạnh.',
      'too-many-requests' => 'Quá nhiều yêu cầu, vui lòng thử lại sau.',
      'user-token-expired' =>
        'Token người dùng đã hết hạn, vui lòng đăng nhập lại.',
      'network-request-failed' => 'Yêu cầu mạng thất bại, vui lòng thử lại.',
      'user-disabled' => 'Người dùng đã bị vô hiệu hóa.',
      'user-not-found' || 'auth/user-not-found' => 'Không tìm thấy người dùng.',
      'wrong-password' => 'Email hoặc mật khẩu không đúng.',
      'INVALID_LOGIN_CREDENTIALS' => 'Email hoặc mật khẩu không đúng.',
      _ => 'Đã xảy ra lỗi, vui lòng thử lại sau.',
    };
  }
}
