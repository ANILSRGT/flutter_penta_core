part of 'date_time_ext.dart';

final class _ConverterDateTimeExt {
  const _ConverterDateTimeExt(DateTime? value) : _value = value;

  final DateTime? _value;

  String formatShort() {
    if (_value == null) {
      return '';
    }

    final now = DateTime.now();
    final diff = now.difference(_value);

    if (diff.inDays > 0) {
      return DateFormat('dd/MM/yyyy').format(_value);
    }

    if (diff.inHours > 0) {
      return '${diff.inHours}h';
    }

    if (diff.inMinutes > 0) {
      return '${diff.inMinutes}m';
    }

    return '${diff.inSeconds}s';
  }
}
