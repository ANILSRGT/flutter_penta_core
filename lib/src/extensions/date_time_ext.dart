import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

/// Gives access to [DateTimeExt] through `date.ext`.
extension DateTimeExtension on DateTime {
  DateTimeExt get ext => DateTimeExt(this);
}

/// Labels used by [DateTimeExt.timeAgo] and [DateTimeExt.timeWhen].
@immutable
final class DateTimeLabels {
  const DateTimeLabels({
    this.seconds = 's',
    this.minutes = 'm',
    this.hours = 'h',
    this.today = 'Today',
    this.tomorrow = 'Tomorrow',
    this.past = 'Past',
  });

  const DateTimeLabels.tr()
    : seconds = 'sn',
      minutes = 'dk',
      hours = 'sa',
      today = 'Bugün',
      tomorrow = 'Yarın',
      past = 'Geçmiş';

  final String seconds;
  final String minutes;
  final String hours;
  final String today;
  final String tomorrow;
  final String past;
}

extension type const DateTimeExt(DateTime _value) {
  // ----------------------------------------------------------- arithmetic

  /// Calendar-aware subtraction (e.g. `month: 1` keeps the day of month).
  DateTime minus({
    int year = 0,
    int month = 0,
    int day = 0,
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  }) => plus(
    year: -year,
    month: -month,
    day: -day,
    hour: -hour,
    minute: -minute,
    second: -second,
    millisecond: -millisecond,
    microsecond: -microsecond,
  );

  /// Calendar-aware addition (e.g. `month: 1` keeps the day of month).
  /// The result keeps the UTC/local kind of the original value.
  DateTime plus({
    int year = 0,
    int month = 0,
    int day = 0,
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  }) {
    final build = _value.isUtc ? DateTime.utc : DateTime.new;
    return build(
      _value.year + year,
      _value.month + month,
      _value.day + day,
      _value.hour + hour,
      _value.minute + minute,
      _value.second + second,
      _value.millisecond + millisecond,
      _value.microsecond + microsecond,
    );
  }

  /// 00:00:00.000 of the same day.
  DateTime get startOfDay => (_value.isUtc ? DateTime.utc : DateTime.new)(
    _value.year,
    _value.month,
    _value.day,
  );

  /// 23:59:59.999999 of the same day.
  DateTime get endOfDay => (_value.isUtc ? DateTime.utc : DateTime.new)(
    _value.year,
    _value.month,
    _value.day,
    23,
    59,
    59,
    999,
    999,
  );

  // ----------------------------------------------------------- comparison

  /// [other] converted to the same time zone kind (UTC/local) as this value.
  DateTime _aligned(DateTime other) => other.isUtc == _value.isUtc
      ? other
      : (_value.isUtc ? other.toUtc() : other.toLocal());

  bool isSameDay(DateTime other) {
    final o = _aligned(other);
    return _value.year == o.year &&
        _value.month == o.month &&
        _value.day == o.day;
  }

  bool isSameMonth(DateTime other) {
    final o = _aligned(other);
    return _value.year == o.year && _value.month == o.month;
  }

  bool isSameYear(DateTime other) => _value.year == _aligned(other).year;

  bool get isToday => isSameDay(DateTime.now());
  bool get isTomorrow => isSameDay(DateTimeExt(DateTime.now()).plus(day: 1));
  bool get isYesterday => isSameDay(DateTimeExt(DateTime.now()).minus(day: 1));

  // ----------------------------------------------------------- formatting

  /// Short relative time: `45s`, `12m`, `3h`, or the date when older than a
  /// day.
  String timeAgo({
    DateTimeLabels labels = const DateTimeLabels(),
    String dateFormat = 'dd/MM/yyyy',
    Locale? locale,
    DateTime? now,
  }) {
    final diff = (now ?? DateTime.now()).difference(_value);
    if (diff.inDays > 0) return format(format: dateFormat, locale: locale);
    if (diff.inHours > 0) return '${diff.inHours}${labels.hours}';
    if (diff.inMinutes > 0) return '${diff.inMinutes}${labels.minutes}';
    return '${diff.inSeconds < 0 ? 0 : diff.inSeconds}${labels.seconds}';
  }

  /// `Today` (later today), `Tomorrow`, the formatted date (further in the
  /// future) or `Past`.
  String timeWhen({
    DateTimeLabels labels = const DateTimeLabels(),
    String dateFormat = 'dd/MM/yyyy',
    Locale? locale,
    DateTime? now,
  }) {
    final current = now ?? DateTime.now();
    if (!_value.isAfter(current)) return labels.past;
    if (isSameDay(current)) return labels.today;
    if (isSameDay(DateTimeExt(current).plus(day: 1))) return labels.tomorrow;
    return format(format: dateFormat, locale: locale);
  }

  /// Formats with an `intl` [DateFormat] pattern (default `dd/MM/yyyy`).
  ///
  /// When [locale] is null, `Intl.defaultLocale` (or `en_US`) is used.
  /// Locales other than `en_US` require `initializeDateFormatting()` from
  /// `package:intl/date_symbol_data_local.dart`.
  ///
  /// Common symbols: `d`/`dd` day, `E`/`EEEE` weekday, `M`/`MM`/`MMM`/`MMMM`
  /// month, `y`/`yy` year, `H`/`HH` hour (0-23), `j` hour (12h), `m`/`mm`
  /// minute, `s`/`ss` second, `S` fractional seconds, `QQQ` quarter.
  String format({String? format, Locale? locale}) {
    final localeName = locale?.toLanguageTag().replaceAll('-', '_');
    return DateFormat(format ?? 'dd/MM/yyyy', localeName).format(_value);
  }
}
