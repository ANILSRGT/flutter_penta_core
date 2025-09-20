part of 'int_ext.dart';

mixin _ConverterIntExt {
  int get _value;

  String formatShort({Locale? locale}) {
    final suffixesLocale = <String, List<String>>{
      'en': ['', 'K', 'M', 'B', 'T', 'Q'],
      'tr': ['', 'B', 'Mn', 'Mr', 'Tr', 'Ktr'],
    };

    var langCode = locale?.languageCode ?? 'en';
    if (!suffixesLocale.containsKey(langCode)) langCode = 'en';
    final suffixes = suffixesLocale[langCode]!;

    var index = 0;
    var num = _value.toDouble();

    while (num >= 1000 && index < suffixes.length - 1) {
      num /= 1000;
      index++;
    }

    return '${num.toStringAsFixed(1).replaceAll('.0', '')}${suffixes[index]}';
  }
}
