part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesZhCN {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' => '邮箱已被使用，请使用其他邮箱地址。',
      'invalid-email' || 'auth/invalid-email' => '邮箱地址无效。',
      'operation-not-allowed' => '邮箱/密码账户未启用。',
      'weak-password' => '密码强度不够。',
      'too-many-requests' => '请求过多，请稍后再试。',
      'user-token-expired' => '用户令牌已过期，请重新登录。',
      'network-request-failed' => '网络请求失败，请重试。',
      'user-disabled' => '用户已被禁用。',
      'user-not-found' || 'auth/user-not-found' => '未找到用户。',
      'wrong-password' => '邮箱或密码错误。',
      'INVALID_LOGIN_CREDENTIALS' => '邮箱或密码错误。',
      _ => '发生错误，请稍后重试。',
    };
  }
}
