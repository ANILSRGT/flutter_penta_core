part of 'date_time_ext.dart';

final class _CompareDateTimeExt {
  const _CompareDateTimeExt(DateTime? value) : _value = value;

  final DateTime? _value;

  bool isSameDay(DateTime other) {
    return _value?.year == other.year &&
        _value?.month == other.month &&
        _value?.day == other.day;
  }

  bool isSameMonth(DateTime other) {
    return _value?.year == other.year && _value?.month == other.month;
  }

  bool isSameYear(DateTime other) {
    return _value?.year == other.year;
  }
}
