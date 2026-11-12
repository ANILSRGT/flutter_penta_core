// Localized messages for Firebase Auth error codes.
// Keys are codes without the `auth/` prefix; `_default` is the fallback.

// ignore_for_file: avoid_escaping_inner_quotes

part of 'firebase_exception_converter.dart';

const Map<String, Map<String, String>> _firebaseMessages = {
  'ar_SA': {
    'email-already-in-use':
        'البريد الإلكتروني مستخدم بالفعل، يرجى استخدام عنوان بريد إلكتروني آخر.',
    'invalid-email': 'عنوان البريد الإلكتروني غير صالح.',
    'operation-not-allowed': 'حسابات البريد الإلكتروني/كلمة المرور غير مفعلة.',
    'weak-password': 'كلمة المرور ليست قوية بما يكفي.',
    'too-many-requests': 'طلبات كثيرة جداً، يرجى المحاولة مرة أخرى لاحقاً.',
    'user-token-expired':
        'انتهت صلاحية رمز المستخدم، يرجى تسجيل الدخول مرة أخرى.',
    'network-request-failed': 'فشل طلب الشبكة، يرجى المحاولة مرة أخرى.',
    'user-disabled': 'تم تعطيل المستخدم.',
    'user-not-found': 'لم يتم العثور على المستخدم.',
    'wrong-password': 'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
    '_default': 'حدث خطأ، يرجى المحاولة مرة أخرى لاحقاً.',
  },
  'de_DE': {
    'email-already-in-use':
        'E-Mail wird bereits verwendet, bitte verwenden Sie eine andere E-Mail-Adresse.',
    'invalid-email': 'Die E-Mail-Adresse ist nicht gültig.',
    'operation-not-allowed': 'E-Mail/Passwort-Konten sind nicht aktiviert.',
    'weak-password': 'Das Passwort ist nicht stark genug.',
    'too-many-requests':
        'Zu viele Anfragen, bitte versuchen Sie es später erneut.',
    'user-token-expired':
        'Benutzer-Token abgelaufen, bitte melden Sie sich erneut an.',
    'network-request-failed':
        'Netzwerkanfrage fehlgeschlagen, bitte versuchen Sie es erneut.',
    'user-disabled': 'Benutzer wurde deaktiviert.',
    'user-not-found': 'Benutzer nicht gefunden.',
    'wrong-password': 'E-Mail oder Passwort ist falsch.',
    '_default':
        'Ein Fehler ist aufgetreten, bitte versuchen Sie es später erneut.',
  },
  'en_GB': {
    'email-already-in-use':
        'Email already in use, please use another email address.',
    'invalid-email': 'The email address is not valid.',
    'operation-not-allowed': 'Email/password accounts are not enabled.',
    'weak-password': 'The password is not strong enough.',
    'too-many-requests': 'Too many requests, please try again later.',
    'user-token-expired': 'User token expired, please log in again.',
    'network-request-failed': 'Network request failed, please try again.',
    'user-disabled': 'User has been disabled.',
    'user-not-found': 'User not found.',
    'wrong-password': 'Email or password is incorrect.',
    '_default': 'An error occurred, please try again later.',
  },
  'en_US': {
    'email-already-in-use':
        'Email already in use, please use another email address.',
    'invalid-email': 'The email address is not valid.',
    'operation-not-allowed': 'Email/password accounts are not enabled.',
    'weak-password': 'The password is not strong enough.',
    'too-many-requests': 'Too many requests, please try again later.',
    'user-token-expired': 'User token expired, please login again.',
    'network-request-failed': 'Network request failed, please try again.',
    'user-disabled': 'User has been disabled.',
    'user-not-found': 'User not found.',
    'wrong-password': 'Email or password is incorrect.',
    '_default': 'An error occurred, please try again later.',
  },
  'es_ES': {
    'email-already-in-use':
        'Email ya está en uso, por favor use otra dirección de email.',
    'invalid-email': 'La dirección de email no es válida.',
    'operation-not-allowed':
        'Las cuentas de email/contraseña no están habilitadas.',
    'weak-password': 'La contraseña no es lo suficientemente fuerte.',
    'too-many-requests':
        'Demasiadas solicitudes, por favor inténtelo más tarde.',
    'user-token-expired':
        'Token de usuario expirado, por favor inicie sesión nuevamente.',
    'network-request-failed':
        'Solicitud de red fallida, por favor inténtelo de nuevo.',
    'user-disabled': 'El usuario ha sido deshabilitado.',
    'user-not-found': 'Usuario no encontrado.',
    'wrong-password': 'Email o contraseña incorrectos.',
    '_default': 'Ocurrió un error, por favor inténtelo más tarde.',
  },
  'fr_FR': {
    'email-already-in-use':
        'Email déjà utilisé, veuillez utiliser une autre adresse email.',
    'invalid-email': 'L\'adresse email n\'est pas valide.',
    'operation-not-allowed':
        'Les comptes email/mot de passe ne sont pas activés.',
    'weak-password': 'Le mot de passe n\'est pas assez fort.',
    'too-many-requests': 'Trop de demandes, veuillez réessayer plus tard.',
    'user-token-expired':
        'Jeton utilisateur expiré, veuillez vous reconnecter.',
    'network-request-failed': 'Échec de la requête réseau, veuillez réessayer.',
    'user-disabled': 'L\'utilisateur a été désactivé.',
    'user-not-found': 'Utilisateur non trouvé.',
    'wrong-password': 'Email ou mot de passe incorrect.',
    '_default': 'Une erreur s\'est produite, veuillez réessayer plus tard.',
  },
  'ko_KR': {
    'email-already-in-use': '이미 사용 중인 이메일입니다. 다른 이메일 주소를 사용해 주세요.',
    'invalid-email': '이메일 주소가 유효하지 않습니다.',
    'operation-not-allowed': '이메일/비밀번호 계정이 활성화되지 않았습니다.',
    'weak-password': '비밀번호가 충분히 강력하지 않습니다.',
    'too-many-requests': '요청이 너무 많습니다. 나중에 다시 시도해 주세요.',
    'user-token-expired': '사용자 토큰이 만료되었습니다. 다시 로그인해 주세요.',
    'network-request-failed': '네트워크 요청이 실패했습니다. 다시 시도해 주세요.',
    'user-disabled': '사용자가 비활성화되었습니다.',
    'user-not-found': '사용자를 찾을 수 없습니다.',
    'wrong-password': '이메일 또는 비밀번호가 올바르지 않습니다.',
    '_default': '오류가 발생했습니다. 나중에 다시 시도해 주세요.',
  },
  'nl_NL': {
    'email-already-in-use':
        'E-mail wordt al gebruikt, gebruik een ander e-mailadres.',
    'invalid-email': 'Het e-mailadres is niet geldig.',
    'operation-not-allowed':
        'E-mail/wachtwoord accounts zijn niet ingeschakeld.',
    'weak-password': 'Het wachtwoord is niet sterk genoeg.',
    'too-many-requests': 'Te veel verzoeken, probeer het later opnieuw.',
    'user-token-expired': 'Gebruikerstoken verlopen, log opnieuw in.',
    'network-request-failed': 'Netwerkverzoek mislukt, probeer het opnieuw.',
    'user-disabled': 'Gebruiker is uitgeschakeld.',
    'user-not-found': 'Gebruiker niet gevonden.',
    'wrong-password': 'E-mail of wachtwoord is onjuist.',
    '_default': 'Er is een fout opgetreden, probeer het later opnieuw.',
  },
  'pl_PL': {
    'email-already-in-use':
        'E-mail jest już używany, użyj innego adresu e-mail.',
    'invalid-email': 'Adres e-mail jest nieprawidłowy.',
    'operation-not-allowed': 'Konta e-mail/hasło nie są włączone.',
    'weak-password': 'Hasło nie jest wystarczająco silne.',
    'too-many-requests': 'Zbyt wiele żądań, spróbuj ponownie później.',
    'user-token-expired': 'Token użytkownika wygasł, zaloguj się ponownie.',
    'network-request-failed':
        'Żądanie sieciowe nie powiodło się, spróbuj ponownie.',
    'user-disabled': 'Użytkownik został wyłączony.',
    'user-not-found': 'Nie znaleziono użytkownika.',
    'wrong-password': 'E-mail lub hasło jest nieprawidłowe.',
    '_default': 'Wystąpił błąd, spróbuj ponownie później.',
  },
  'pt_PT': {
    'email-already-in-use':
        'E-mail já está em uso, use outro endereço de e-mail.',
    'invalid-email': 'O endereço de e-mail não é válido.',
    'operation-not-allowed': 'Contas de e-mail/senha não estão habilitadas.',
    'weak-password': 'A senha não é forte o suficiente.',
    'too-many-requests': 'Muitas solicitações, tente novamente mais tarde.',
    'user-token-expired': 'Token do usuário expirado, faça login novamente.',
    'network-request-failed': 'Solicitação de rede falhou, tente novamente.',
    'user-disabled': 'Usuário foi desabilitado.',
    'user-not-found': 'Usuário não encontrado.',
    'wrong-password': 'E-mail ou senha incorretos.',
    '_default': 'Ocorreu um erro, tente novamente mais tarde.',
  },
  'ru_RU': {
    'email-already-in-use':
        'Электронная почта уже используется, используйте другой адрес электронной почты.',
    'invalid-email': 'Адрес электронной почты недействителен.',
    'operation-not-allowed':
        'Учетные записи электронной почты/пароля не включены.',
    'weak-password': 'Пароль недостаточно надежный.',
    'too-many-requests': 'Слишком много запросов, попробуйте позже.',
    'user-token-expired': 'Токен пользователя истек, войдите снова.',
    'network-request-failed': 'Сетевой запрос не удался, попробуйте снова.',
    'user-disabled': 'Пользователь отключен.',
    'user-not-found': 'Пользователь не найден.',
    'wrong-password': 'Электронная почта или пароль неверны.',
    '_default': 'Произошла ошибка, попробуйте позже.',
  },
  'sv_SE': {
    'email-already-in-use':
        'E-post används redan, använd en annan e-postadress.',
    'invalid-email': 'E-postadressen är inte giltig.',
    'operation-not-allowed': 'E-post/lösenordskonton är inte aktiverade.',
    'weak-password': 'Lösenordet är inte tillräckligt starkt.',
    'too-many-requests': 'För många förfrågningar, försök igen senare.',
    'user-token-expired': 'Användartoken har gått ut, logga in igen.',
    'network-request-failed': 'Nätverksförfrågan misslyckades, försök igen.',
    'user-disabled': 'Användaren har inaktiverats.',
    'user-not-found': 'Användare hittades inte.',
    'wrong-password': 'E-post eller lösenord är felaktigt.',
    '_default': 'Ett fel uppstod, försök igen senare.',
  },
  'th_TH': {
    'email-already-in-use': 'อีเมลนี้ถูกใช้งานแล้ว กรุณาใช้อีเมลอื่น',
    'invalid-email': 'ที่อยู่อีเมลไม่ถูกต้อง',
    'operation-not-allowed': 'บัญชีอีเมล/รหัสผ่านไม่ได้เปิดใช้งาน',
    'weak-password': 'รหัสผ่านไม่แข็งแรงพอ',
    'too-many-requests': 'คำขอมากเกินไป กรุณาลองใหม่ภายหลัง',
    'user-token-expired': 'โทเค็นผู้ใช้หมดอายุ กรุณาเข้าสู่ระบบใหม่',
    'network-request-failed': 'คำขอเครือข่ายล้มเหลว กรุณาลองใหม่',
    'user-disabled': 'ผู้ใช้ถูกปิดใช้งาน',
    'user-not-found': 'ไม่พบผู้ใช้',
    'wrong-password': 'อีเมลหรือรหัสผ่านไม่ถูกต้อง',
    '_default': 'เกิดข้อผิดพลาด กรุณาลองใหม่ภายหลัง',
  },
  'tr_TR': {
    'email-already-in-use':
        'Email zaten kullanımda, lütfen başka bir email adresi kullanın.',
    'invalid-email': 'Email adresi geçersiz.',
    'operation-not-allowed': 'Email/şifre hesapları etkin değil.',
    'weak-password': 'Şifre yeterince güçlü değil.',
    'too-many-requests': 'Çok fazla istek, lütfen daha sonra tekrar deneyin.',
    'user-token-expired':
        'Kullanıcı jetonu süresi doldu, lütfen tekrar giriş yapın.',
    'network-request-failed':
        'Ağ isteği başarısız oldu, lütfen tekrar deneyin.',
    'user-disabled': 'Kullanıcı devre dışı bırakıldı.',
    'user-not-found': 'Kullanıcı bulunamadı.',
    'wrong-password': 'Email veya şifre yanlış.',
    '_default': 'Bir hata oluştu, lütfen daha sonra tekrar deneyin.',
  },
  'uk_UA': {
    'email-already-in-use':
        'Електронна пошта вже використовується, використовуйте іншу адресу електронної пошти.',
    'invalid-email': 'Адреса електронної пошти недійсна.',
    'operation-not-allowed':
        'Облікові записи електронної пошти/пароля не увімкнені.',
    'weak-password': 'Пароль недостатньо надійний.',
    'too-many-requests': 'Занадто багато запитів, спробуйте пізніше.',
    'user-token-expired': 'Токен користувача закінчився, увійдіть знову.',
    'network-request-failed': 'Мережевий запит не вдався, спробуйте знову.',
    'user-disabled': 'Користувач відключений.',
    'user-not-found': 'Користувача не знайдено.',
    'wrong-password': 'Електронна пошта або пароль неправильні.',
    '_default': 'Сталася помилка, спробуйте пізніше.',
  },
  'ur_PK': {
    'email-already-in-use':
        'ای میل پہلے سے استعمال میں ہے، براہ کرم دوسرا ای میل ایڈریس استعمال کریں۔',
    'invalid-email': 'ای میل ایڈریس درست نہیں ہے۔',
    'operation-not-allowed': 'ای میل/پاس ورڈ اکاؤنٹس فعال نہیں ہیں۔',
    'weak-password': 'پاس ورڈ کافی مضبوط نہیں ہے۔',
    'too-many-requests':
        'بہت زیادہ درخواستیں، براہ کرم بعد میں دوبارہ کوشش کریں۔',
    'user-token-expired':
        'صارف کا ٹوکن ختم ہو گیا، براہ کرم دوبارہ لاگ ان کریں۔',
    'network-request-failed':
        'نیٹ ورک کی درخواست ناکام، براہ کرم دوبارہ کوشش کریں۔',
    'user-disabled': 'صارف غیر فعال کر دیا گیا ہے۔',
    'user-not-found': 'صارف نہیں ملا۔',
    'wrong-password': 'ای میل یا پاس ورڈ غلط ہے۔',
    '_default': 'ایک خرابی ہوئی، براہ کرم بعد میں دوبارہ کوشش کریں۔',
  },
  'vi_VN': {
    'email-already-in-use':
        'Email đã được sử dụng, vui lòng sử dụng địa chỉ email khác.',
    'invalid-email': 'Địa chỉ email không hợp lệ.',
    'operation-not-allowed': 'Tài khoản email/mật khẩu chưa được kích hoạt.',
    'weak-password': 'Mật khẩu không đủ mạnh.',
    'too-many-requests': 'Quá nhiều yêu cầu, vui lòng thử lại sau.',
    'user-token-expired':
        'Token người dùng đã hết hạn, vui lòng đăng nhập lại.',
    'network-request-failed': 'Yêu cầu mạng thất bại, vui lòng thử lại.',
    'user-disabled': 'Người dùng đã bị vô hiệu hóa.',
    'user-not-found': 'Không tìm thấy người dùng.',
    'wrong-password': 'Email hoặc mật khẩu không đúng.',
    '_default': 'Đã xảy ra lỗi, vui lòng thử lại sau.',
  },
  'zh_CN': {
    'email-already-in-use': '邮箱已被使用，请使用其他邮箱地址。',
    'invalid-email': '邮箱地址无效。',
    'operation-not-allowed': '邮箱/密码账户未启用。',
    'weak-password': '密码强度不够。',
    'too-many-requests': '请求过多，请稍后再试。',
    'user-token-expired': '用户令牌已过期，请重新登录。',
    'network-request-failed': '网络请求失败，请重试。',
    'user-disabled': '用户已被禁用。',
    'user-not-found': '未找到用户。',
    'wrong-password': '邮箱或密码错误。',
    '_default': '发生错误，请稍后重试。',
  },
};
