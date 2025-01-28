final class TimestampConverter {
  const TimestampConverter._();

  static DateTime convertToDateTimeLocal(int millisecondsSinceEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  static DateTime convertToDateTimeUTC(int millisecondsSinceEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  static int convertToTimestamp(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }
}
