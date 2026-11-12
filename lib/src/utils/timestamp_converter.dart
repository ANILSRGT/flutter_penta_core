/// Conversions between epoch milliseconds and [DateTime].
abstract final class TimestampConverter {
  static DateTime convertToDateTimeLocal(int millisecondsSinceEpoch) =>
      DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);

  static DateTime convertToDateTimeUTC(int millisecondsSinceEpoch) =>
      DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch, isUtc: true);

  static int convertToTimestamp(DateTime dateTime) =>
      dateTime.millisecondsSinceEpoch;
}
