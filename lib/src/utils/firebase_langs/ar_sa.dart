part of '../firebase_exception_converter.dart';

class _FirebaseExceptionMessagesArSA {
  static String getMessage(String code) {
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
}
