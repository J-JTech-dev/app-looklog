import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/utils/calendar_utils.dart';

class CalendarState {
  final DateTime selectedDay;
  final ValueNotifier<List<Event>> selectedEvents;

  CalendarState({
    required this.selectedDay,
    required this.selectedEvents,
  });

  CalendarState copyWith({
    DateTime? selectedDay,
    ValueNotifier<List<Event>>? selectedEvents,
  }) {
    return CalendarState(
      selectedDay: selectedDay ?? this.selectedDay,
      selectedEvents: selectedEvents ?? this.selectedEvents,
    );
  }
}

class CalendarController extends StateNotifier<CalendarState> {
  CalendarController() : super(CalendarState(selectedDay:DateTime.now(), selectedEvents: ValueNotifier([])),);

  void daySelected(DateTime selectedDay, DateTime focusedDay, DateTime _selectedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      state = state.copyWith(
          selectedDay: selectedDay,
          selectedEvents: ValueNotifier(getEventsForDay(selectedDay)));
    }
  }

  String getSelectedDay() {
    //선택한 날짜 반환
    return DateFormat('yyyy년 MM월 dd일').format(state.selectedDay);
  }
}

final calendarProvider = StateNotifierProvider<CalendarController, CalendarState>((ref) {
  return CalendarController();
});
