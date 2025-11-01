part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesEnGB {
  static String getMessage(String code) {
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
