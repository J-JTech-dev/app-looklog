import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/utils/calendar_utils.dart';

class CalendarState {
  final ValueNotifier<List<Event>> selectedEvents;

  CalendarState({
    required this.selectedEvents,
  });

  CalendarState copyWith({
    ValueNotifier<List<Event>>? selectedEvents,
  }) {
    return CalendarState(selectedEvents: selectedEvents ?? this.selectedEvents,);
  }
}

class CalendarController extends StateNotifier<CalendarState> {
  CalendarController() : super(CalendarState(selectedEvents: ValueNotifier([])),);

  void daySelected(DateTime selectedDay, DateTime focusedDay, DateTime _selectedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      state = state.copyWith(selectedEvents: ValueNotifier(getEventsForDay(selectedDay)));
    }
  }
}

final calendarProvider = StateNotifierProvider<CalendarController, CalendarState>((ref) {
  return CalendarController();
});
