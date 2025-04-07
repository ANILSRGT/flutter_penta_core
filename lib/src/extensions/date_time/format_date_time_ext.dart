part of 'date_time_ext.dart';

final class _ConverterDateTimeExt {
  const _ConverterDateTimeExt(DateTime? value) : _value = value;

  final DateTime? _value;

  String get timeAgo {
    if (_value == null) return '';

    final now = DateTime.now();
    final diff = now.difference(_value);

    return diff.inDays > 0
        ? DateFormat('dd/MM/yyyy').format(_value)
        : diff.inHours > 0
        ? '${diff.inHours}h'
        : diff.inMinutes > 0
        ? '${diff.inMinutes}m'
        : '${diff.inSeconds}s';
  }

  String get timeWhen {
    if (_value == null) return '';

    final now = DateTime.now();
    final diff = _value.difference(now);

    return diff.inDays > 1
        ? DateFormat('dd/MM/yyyy').format(_value)
        : diff.inDays == 1
        ? 'Tomorrow'
        : diff.inDays == 0
        ? 'Today'
        : 'Past';
  }

  /// Formats the date to a string using the provided format and locale.
  /// <br/>If no format is provided, it defaults to `dd/MM/yyyy`.
  /// <br/>If no locale is provided, it defaults to `en_US`.
  /// <br/>Returns an empty string if the date is null.
  /// <br/>`d` - `day (1-31)`
  /// <br/>`dd` - `day (01-31)`
  /// <br/>`E` - `day of the week (3-letter abbreviation)`
  /// <br/>`EEEE` - `day of the week (full name)`
  /// <br/>`EEEEE` - `day of the week (1-letter abbreviation)`
  /// <br/>`H` - `hour (0-23)`
  /// <br/>`HH` - `hour (00-23)`
  /// <br/>`j` - `hour (1-12 AM/PM)`
  /// <br/>`jj` - `hour (01-12 AM/PM)`
  /// <br/>`LLL` - `month (3-letter abbreviation)`
  /// <br/>`LLLL` - `month (full name)`
  /// <br/>`M` - `month (1-12)`
  /// <br/>`MM` - `month (01-12)`
  /// <br/>`MMM` - `month (3-letter abbreviation)`
  /// <br/>`MMMM` - `month (full name)`
  /// <br/>`QQQ` - `quarter (1Q-4Q)`
  /// <br/>`QQQQ` - `quarter (1st-4th quarter)`
  /// <br/>`m` - `minute (0-59)`
  /// <br/>`mm` - `minute (00-59)`
  /// <br/>`s` - `second (0-59)`
  /// <br/>`ss` - `second (00-59)`
  /// <br/>`S` - `millisecond (000-999)`
  /// <br/>`y` - `year`
  /// <br/>`yy` - `year (2 digits)`
  String format({String? format, String? locale}) {
    if (_value == null) return '';

    final dateFormat = DateFormat(format ?? 'dd/MM/yyyy', locale ?? 'en_US');
    return dateFormat.format(_value);
  }
}
