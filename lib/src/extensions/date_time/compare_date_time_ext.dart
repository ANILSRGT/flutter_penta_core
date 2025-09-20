part of 'date_time_ext.dart';

mixin _CompareDateTimeExt {
  DateTime get _value;

  bool isSameDay(DateTime other) {
    return _value.toUtc().year == other.toUtc().year &&
        _value.toUtc().month == other.toUtc().month &&
        _value.toUtc().day == other.toUtc().day;
  }

  bool isSameMonth(DateTime other) {
    return _value.toUtc().year == other.toUtc().year &&
        _value.toUtc().month == other.toUtc().month;
  }

  bool isSameYear(DateTime other) {
    return _value.toUtc().year == other.toUtc().year;
  }
}
