import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'calc_date_time_ext.dart';
part 'format_date_time_ext.dart';
part 'compare_date_time_ext.dart';

extension DateTimeExt on DateTime {
  _DateTimeExt get ext => _DateTimeExt(this);
}

final class _DateTimeExt
    with _CalcDateTimeExt, _ConverterDateTimeExt, _CompareDateTimeExt {
  const _DateTimeExt(DateTime value) : _value = value;

  @override
  final DateTime _value;
}
