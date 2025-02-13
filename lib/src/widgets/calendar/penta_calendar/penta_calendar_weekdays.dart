part of 'penta_calendar.dart';

enum PentaCalendarWeekdays {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  PentaCalendarWeekdays get endWeekday {
    return PentaCalendarWeekdays.values[(index + 7) % 7];
  }

  static PentaCalendarWeekdays fromDateTime(
    DateTime date, {
    PentaCalendarWeekdays firstDayOfWeek = PentaCalendarWeekdays.sunday,
  }) {
    return PentaCalendarWeekdays
        .values[(date.weekday - firstDayOfWeek.index + 7) % 7];
  }
}
