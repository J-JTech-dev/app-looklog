import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/theme/colors.dart';
import '../../../../core/utils/calendar_utils.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime selectDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  List<Event> _getEventsForDay(day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.now().subtract(const Duration(days: 365*10)),
      lastDay: DateTime.now().add(const Duration(days:365*10)),
      locale: 'ko-KR',
      daysOfWeekHeight: 20,
      rowHeight: AppConfig.h(42), // 각 날짜 셀의 높이 줄이기
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          fontSize: AppConfig.w(20),
          fontWeight: FontWeight.w700,
          color: BRACK_1,
        ),
        leftChevronIcon: const Icon(Icons.chevron_left_rounded),
        rightChevronIcon: const Icon(Icons.chevron_right_rounded),
      ),
      calendarStyle: CalendarStyle(
        defaultTextStyle: calendarTextStyle(BRACK_1),
        weekendTextStyle: calendarTextStyle(RED_1),
        selectedTextStyle: calendarTextStyle(WHITE),
        selectedDecoration: boxDeco(BLUE_3.withOpacity(AppConfig.r(0.6))),
        todayDecoration: boxDeco(BLUE_3),
        markerDecoration: boxDeco(SUB_COLOR_1),
      ),
      // calendarBuilders: CalendarBuilders(
      //   markerBuilder: (context, date, events) {
      //     Map<DateTime, List<Event>> events = {
      //       DateTime.utc(2025,2,19) : [Event('title3')],
      //     };
      //     if (events.isNotEmpty) { // && isEventForSpecificDate(date)
      //       return Stack(
      //         children: [
      //           Positioned(
      //             bottom: 1, // 밑줄의 위치
      //             child: buildCalendarDayMarker(), // 밑줄 마커
      //           ),
      //         ],
      //       );
      //     }
      //     return SizedBox.shrink(); // 이벤트가 없으면 빈 위젯을 반환
      //   },
      // ),
      onDaySelected: (selectDay, focusedDay) {
        //선택된 날짜 상태 갱신
        setState(() {
          this.selectDay = selectDay;
          this.focusedDay = focusedDay;
        });
      },
      selectedDayPredicate: (day) {
        return isSameDay(selectDay, day);
      },
      eventLoader: _getEventsForDay,
    );
  }
}
