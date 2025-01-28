part of 'date_time_ext.dart';

final class _CalcDateTimeExt {
  const _CalcDateTimeExt(DateTime value) : _value = value;

  final DateTime _value;

  DateTime minus({
    int year = 0,
    int month = 0,
    int day = 0,
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  }) {
    return DateTime(
      _value.year - year,
      _value.month - month,
      _value.day - day,
      _value.hour - hour,
      _value.minute - minute,
      _value.second - second,
      _value.millisecond - millisecond,
      _value.microsecond - microsecond,
    );
  }

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
    return DateTime(
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
}
