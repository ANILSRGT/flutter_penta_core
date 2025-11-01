import 'package:flutter/material.dart';

part 'firebase_langs/ar_sa.dart';
part 'firebase_langs/de_de.dart';
part 'firebase_langs/en_gb.dart';
part 'firebase_langs/en_us.dart';
part 'firebase_langs/es_es.dart';
part 'firebase_langs/fr_fr.dart';
part 'firebase_langs/ko_kr.dart';
part 'firebase_langs/nl_nl.dart';
part 'firebase_langs/pl_pl.dart';
part 'firebase_langs/pt_pt.dart';
part 'firebase_langs/ru_ru.dart';
part 'firebase_langs/sv_se.dart';
part 'firebase_langs/th_th.dart';
part 'firebase_langs/tr_tr.dart';
part 'firebase_langs/uk_ua.dart';
part 'firebase_langs/ur_pk.dart';
part 'firebase_langs/vi_vn.dart';
part 'firebase_langs/zh_cn.dart';

class FirebaseExceptionConverter {
  const FirebaseExceptionConverter._();

  static String getMessage(String code, {Locale? locale}) {
    if (locale == null) return _FirebaseExceptionMessagesEnUS.getMessage(code);

    final fullLocale = '${locale.languageCode}_${locale.countryCode}';

    return switch (fullLocale) {
      'ar_SA' => _FirebaseExceptionMessagesArSA.getMessage(code),
      'de_DE' => _FirebaseExceptionMessagesDeDE.getMessage(code),
      'en_GB' => _FirebaseExceptionMessagesEnGB.getMessage(code),
      'en_US' => _FirebaseExceptionMessagesEnUS.getMessage(code),
      'es_ES' => _FirebaseExceptionMessagesEsES.getMessage(code),
      'fr_FR' => _FirebaseExceptionMessagesFrFR.getMessage(code),
      'ko_KR' => _FirebaseExceptionMessagesKoKR.getMessage(code),
      'nl_NL' => _FirebaseExceptionMessagesNlNL.getMessage(code),
      'pl_PL' => _FirebaseExceptionMessagesPlPL.getMessage(code),
      'pt_PT' => _FirebaseExceptionMessagesPtPT.getMessage(code),
      'ru_RU' => _FirebaseExceptionMessagesRuRU.getMessage(code),
      'sv_SE' => _FirebaseExceptionMessagesSvSE.getMessage(code),
      'th_TH' => _FirebaseExceptionMessagesThTH.getMessage(code),
      'tr_TR' => _FirebaseExceptionMessagesTrTR.getMessage(code),
      'uk_UA' => _FirebaseExceptionMessagesUkUA.getMessage(code),
      'ur_PK' => _FirebaseExceptionMessagesUrPK.getMessage(code),
      'vi_VN' => _FirebaseExceptionMessagesViVN.getMessage(code),
      'zh_CN' => _FirebaseExceptionMessagesZhCN.getMessage(code),
      _ => _FirebaseExceptionMessagesEnUS.getMessage(code),
    };
  }
}
