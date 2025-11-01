part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesThTH {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' => 'อีเมลนี้ถูกใช้งานแล้ว กรุณาใช้อีเมลอื่น',
      'invalid-email' || 'auth/invalid-email' => 'ที่อยู่อีเมลไม่ถูกต้อง',
      'operation-not-allowed' => 'บัญชีอีเมล/รหัสผ่านไม่ได้เปิดใช้งาน',
      'weak-password' => 'รหัสผ่านไม่แข็งแรงพอ',
      'too-many-requests' => 'คำขอมากเกินไป กรุณาลองใหม่ภายหลัง',
      'user-token-expired' => 'โทเค็นผู้ใช้หมดอายุ กรุณาเข้าสู่ระบบใหม่',
      'network-request-failed' => 'คำขอเครือข่ายล้มเหลว กรุณาลองใหม่',
      'user-disabled' => 'ผู้ใช้ถูกปิดใช้งาน',
      'user-not-found' || 'auth/user-not-found' => 'ไม่พบผู้ใช้',
      'wrong-password' => 'อีเมลหรือรหัสผ่านไม่ถูกต้อง',
      'INVALID_LOGIN_CREDENTIALS' => 'อีเมลหรือรหัสผ่านไม่ถูกต้อง',
      _ => 'เกิดข้อผิดพลาด กรุณาลองใหม่ภายหลัง',
    };
  }
}
