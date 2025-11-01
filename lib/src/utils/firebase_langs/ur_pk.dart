part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesUrPK {
  static String getMessage(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'ای میل پہلے سے استعمال میں ہے، براہ کرم دوسرا ای میل ایڈریس استعمال کریں۔',
      'invalid-email' || 'auth/invalid-email' => 'ای میل ایڈریس درست نہیں ہے۔',
      'operation-not-allowed' => 'ای میل/پاس ورڈ اکاؤنٹس فعال نہیں ہیں۔',
      'weak-password' => 'پاس ورڈ کافی مضبوط نہیں ہے۔',
      'too-many-requests' =>
        'بہت زیادہ درخواستیں، براہ کرم بعد میں دوبارہ کوشش کریں۔',
      'user-token-expired' =>
        'صارف کا ٹوکن ختم ہو گیا، براہ کرم دوبارہ لاگ ان کریں۔',
      'network-request-failed' =>
        'نیٹ ورک کی درخواست ناکام، براہ کرم دوبارہ کوشش کریں۔',
      'user-disabled' => 'صارف غیر فعال کر دیا گیا ہے۔',
      'user-not-found' || 'auth/user-not-found' => 'صارف نہیں ملا۔',
      'wrong-password' => 'ای میل یا پاس ورڈ غلط ہے۔',
      'INVALID_LOGIN_CREDENTIALS' => 'ای میل یا پاس ورڈ غلط ہے۔',
      _ => 'ایک خرابی ہوئی، براہ کرم بعد میں دوبارہ کوشش کریں۔',
    };
  }
}
