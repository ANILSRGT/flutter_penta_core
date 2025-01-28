import 'package:intl/intl.dart';

part 'calc_date_time_ext.dart';
part 'converter_date_time_ext.dart';

extension DateTimeExt on DateTime {
  _DateTimeExt get ext => _DateTimeExt(this);
}

final class _DateTimeExt {
  const _DateTimeExt(DateTime value) : _value = value;

  final DateTime _value;

  _CalcDateTimeExt get calc => _CalcDateTimeExt(_value);
  _ConverterDateTimeExt get converter => _ConverterDateTimeExt(_value);
}
