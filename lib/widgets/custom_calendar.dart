// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarFormat _calendarFormat = CalendarFormat.month;
DateTime _focusedDay = DateTime.now();
DateTime? _selectedDay;
DateTime kFirstDay = DateTime.now();
DateTime kLastDay = DateTime(2025, 12, 31, 23, 59, 59);

@override
Widget customCalender() {
  return StatefulBuilder(
    builder: (context, setState) => SizedBox(
      width: 300,
      height: 360,
      child: TableCalendar(
        calendarStyle: const CalendarStyle(
            defaultTextStyle: TextStyle(
          fontSize: 14,
        )),
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
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
