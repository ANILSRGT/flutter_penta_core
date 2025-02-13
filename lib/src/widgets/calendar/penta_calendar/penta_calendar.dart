import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

part 'penta_calendar_decoration.dart';
part 'penta_calendar_select_modes.dart';
part 'penta_calendar_decoration_color.dart';
part 'penta_calendar_actions.dart';
part 'penta_calendar_weekdays.dart';

class PentaCalendar extends StatefulWidget {
  PentaCalendar({
    super.key,
    DateTime? initialDate,
    this.isInitialDateSelected = false,
    this.selectMode = PentaCalendarSelectModes.single,
    this.minDate,
    this.maxDate,
    this.onDateSelected,
    this.onDatesSelected,
    this.decoration = const PentaCalendarDecoration(),
    this.onAction,
    this.firstDayOfWeek = PentaCalendarWeekdays.sunday,
  })  : initialDate = initialDate ?? DateTime.now(),
        assert(
          minDate == null || maxDate == null || minDate.isBefore(maxDate),
          'minDate must be before maxDate',
        );

  final DateTime initialDate;
  final PentaCalendarSelectModes selectMode;
  final DateTime? minDate;
  final DateTime? maxDate;
  final bool isInitialDateSelected;
  final void Function(DateTime)? onDateSelected;
  final void Function(List<DateTime>)? onDatesSelected;
  final PentaEventBus<PentaCalendarActions>? onAction;
  final PentaCalendarDecoration decoration;
  final PentaCalendarWeekdays firstDayOfWeek;

  @override
  State<PentaCalendar> createState() => _PentaCalendarState();
}

class _PentaCalendarState extends State<PentaCalendar> {
  late int _currentMonth = widget.initialDate.month;
  late int _currentYear = widget.initialDate.year;
  final List<DateTime> _dates = [];
  late final List<DateTime> _selectedDates = [
    if (widget.isInitialDateSelected) widget.initialDate,
  ];

  @override
  void initState() {
    super.initState();
    _onChangeMounth(widget.initialDate);
    widget.onAction?.on.listen((action) {
      if (action == PentaCalendarActions.prev) {
        _prevMonth();
      } else if (action == PentaCalendarActions.next) {
        _nextMonth();
      }
    });
  }

  @override
  void didUpdateWidget(covariant PentaCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectMode != oldWidget.selectMode) {
      _selectedDates.clear();
    }
  }

  void _onChangeMounth(DateTime date) {
    _currentMonth = date.month;
    _currentYear = date.year;
    final firstDay = DateTime(date.year, date.month);
    final lastDay = DateTime(date.year, date.month + 1, 0);

    _dates.addAll([
      for (var i = 0; i < lastDay.day; i++)
        DateTime(date.year, date.month, i + 1),
    ]);

    final firstDifference =
        (firstDay.weekday - widget.firstDayOfWeek.index).abs();
    if (firstDifference != 0) {
      _dates.insertAll(
        0,
        [
          for (var i = 0; i < firstDifference; i++)
            DateTime(firstDay.year, firstDay.month, -i),
        ].reversed,
      );
    }

    final start = PentaCalendarWeekdays.fromDateTime(
      DateTime(date.year, date.month + 1),
      firstDayOfWeek: widget.firstDayOfWeek,
    ).index;
    log('start: $start');
    final lastDifference = 0;
    if (lastDifference != 0) {
      _dates.addAll([
        for (var i = 0; i < lastDifference; i++)
          lastDay.add(Duration(days: i + 1)),
      ]);
    }

    setState(() {});
  }

  void _onDateSelected(DateTime date) {
    widget.onDateSelected?.call(date);

    switch (widget.selectMode) {
      case PentaCalendarSelectModes.single:
        _handleSingleSelection(date);
      case PentaCalendarSelectModes.multiple:
        _handleMultipleSelection(date);
      case PentaCalendarSelectModes.range:
        _handleRangeSelection(date);
    }

    setState(() {});
  }

  void _handleSingleSelection(DateTime date) {
    if (_selectedDates.isNotEmpty &&
        _selectedDates.first.ext.compare.isSameDay(date)) {
      _selectedDates.clear();
    } else {
      _selectedDates
        ..clear()
        ..add(date);
    }
    widget.onDatesSelected?.call([date]);
  }

  void _handleMultipleSelection(DateTime date) {
    final isExists = _selectedDates.any((e) => e.ext.compare.isSameDay(date));
    if (isExists) {
      _selectedDates.removeWhere((e) => e.ext.compare.isSameDay(date));
    } else {
      _selectedDates.add(date);
    }
    widget.onDatesSelected?.call(_selectedDates);
  }

  void _handleRangeSelection(DateTime date) {
    if (_selectedDates.isEmpty || _selectedDates.length >= 2) {
      _selectedDates
        ..clear()
        ..add(date);
    } else if (_selectedDates.first.ext.compare.isSameDay(date)) {
      _selectedDates.clear();
    } else {
      final firstDate = _selectedDates.first;
      final lastDate = date.isBefore(firstDate) ? firstDate : date;
      final startDate = date.isBefore(firstDate) ? date : firstDate;

      _selectedDates
        ..clear()
        ..addAll(_generateDateRange(startDate, lastDate));

      widget.onDatesSelected?.call(_selectedDates);
    }
  }

  List<DateTime> _generateDateRange(DateTime start, DateTime end) {
    final difference = end.difference(start).inDays;
    return [
      start,
      for (var i = 1; i < difference; i++)
        DateTime(start.year, start.month, start.day + i),
      end,
    ];
  }

  void _prevMonth() {
    _dates.clear();
    _onChangeMounth(DateTime(_currentYear, _currentMonth - 1));
    setState(() {});
  }

  void _nextMonth() {
    _dates.clear();
    _onChangeMounth(DateTime(_currentYear, _currentMonth + 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _dates.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        final date = _dates[index];
        final isSelected = _selectedDates.contains(date);
        final isSameMonth = date.month == _currentMonth;
        final isBeforeMin =
            widget.minDate != null && date.isBefore(widget.minDate!);
        final isAfterMax =
            widget.maxDate != null && date.isAfter(widget.maxDate!);
        final isNotMinOrMax = isBeforeMin || isAfterMax;
        final isNow = date.day == DateTime.now().day &&
            date.month == DateTime.now().month &&
            date.year == DateTime.now().year;
        return GestureDetector(
          onTap: isNotMinOrMax ? null : () => _onDateSelected(date),
          child: Container(
            decoration: BoxDecoration(
              color: isNow
                  ? widget.decoration.nowColor.background
                  : isNotMinOrMax
                      ? widget.decoration.disabledColor.background
                      : isSelected
                          ? widget.decoration.selectedColor.background
                          : !isSameMonth
                              ? widget.decoration.otherMonthColor.background
                              : widget.decoration.unselectedColor.background,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isNow
                    ? widget.decoration.nowColor.border
                    : isNotMinOrMax
                        ? widget.decoration.disabledColor.border
                        : isSelected
                            ? widget.decoration.selectedColor.border
                            : !isSameMonth
                                ? widget.decoration.otherMonthColor.border
                                : widget.decoration.unselectedColor.border,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Center(
              child: Text(
                date.day.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isNow
                      ? widget.decoration.nowColor.text
                      : isNotMinOrMax
                          ? widget.decoration.disabledColor.text
                          : isSelected
                              ? widget.decoration.selectedColor.text
                              : !isSameMonth
                                  ? widget.decoration.otherMonthColor.text
                                  : widget.decoration.unselectedColor.text,
                  fontWeight: isSelected ? FontWeight.bold : null,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
