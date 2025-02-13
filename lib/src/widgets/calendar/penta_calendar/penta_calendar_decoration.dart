part of 'penta_calendar.dart';

class PentaCalendarDecoration {
  const PentaCalendarDecoration({
    this.selectedColor = const PentaCalendarDecorationColor(
      background: Colors.blueAccent,
      text: Colors.white,
      border: Colors.blue,
    ),
    this.unselectedColor = const PentaCalendarDecorationColor(
      background: Colors.white,
      text: Colors.black,
      border: Colors.grey,
    ),
    this.disabledColor = const PentaCalendarDecorationColor(
      background: Colors.blueGrey,
      text: Colors.white,
      border: Colors.blueGrey,
    ),
    this.nowColor = const PentaCalendarDecorationColor(
      background: Colors.redAccent,
      text: Colors.white,
      border: Colors.red,
    ),
    this.otherMonthColor = const PentaCalendarDecorationColor(
      background: Colors.grey,
      text: Colors.white,
      border: Colors.grey,
    ),
  });

  final PentaCalendarDecorationColor selectedColor;
  final PentaCalendarDecorationColor unselectedColor;
  final PentaCalendarDecorationColor disabledColor;
  final PentaCalendarDecorationColor nowColor;
  final PentaCalendarDecorationColor otherMonthColor;
}
