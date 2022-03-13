import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

DateTime _focusedDay = DateTime.now();
DateTime kFirstDay = DateTime.now();
DateTime kLastDay = DateTime(2025, 12, 31, 23, 59, 59);
CalendarFormat _calendarFormat = CalendarFormat.month;
DateTime? _selectedDay;

@override
Widget customCalender() {
  return StatefulBuilder(
    builder: (context, setState) => SizedBox(
      width: 300,
      height: 380,
      child: TableCalendar(
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        currentDay: DateTime.now(),
        calendarFormat: _calendarFormat,
        headerStyle: const HeaderStyle(
          titleTextStyle: TextStyle(fontSize: 14, color: Colors.red),
          headerPadding: EdgeInsets.only(bottom: 20),
          titleCentered: true,
          leftChevronPadding: EdgeInsets.all(0),
          rightChevronPadding: EdgeInsets.all(0),
        ),
        calendarStyle: const CalendarStyle(
          defaultTextStyle: TextStyle(fontSize: 14),
          outsideTextStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: const TextStyle(fontSize: 12),
          weekendStyle: TextStyle(fontSize: 12, color: Colors.grey.shade700),
        ),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    ),
  );
}
