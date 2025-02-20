import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/theme/colors.dart';
import '../../../../core/utils/calendar_utils.dart';
import '../controller/calendar_controller.dart';

class CalendarWidget extends ConsumerStatefulWidget {
  final double rowHeight;
  const CalendarWidget({super.key, required this.rowHeight});

  @override
  ConsumerState<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends ConsumerState<CalendarWidget> {
  late final ValueNotifier<List<Event>> _selectedEvents;

  DateTime _selectDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();

    _selectDay = _focusedDay;
    _selectedEvents = ValueNotifier(getEventsForDay(_selectDay));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.now().subtract(const Duration(days: 365*10)),
      lastDay: DateTime.now().add(const Duration(days:365*10)),
      locale: 'ko-KR',
      daysOfWeekHeight: 20,
      rowHeight: AppConfig.h(widget.rowHeight), // 각 날짜 셀의 높이 줄이기
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
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, events) {
          // Map<DateTime, List<Event>> events = {
          //   DateTime.utc(2025,2,19) : [Event('title3')],
          // };
          // if (events.isNotEmpty) { // && isEventForSpecificDate(date)
          //   return Stack(
          //     children: [
          //       Positioned(
          //         bottom: 1, // 밑줄의 위치
          //         child: buildCalendarDayMarker(), // 밑줄 마커
          //       ),
          //     ],
          //   );
          // }
          // return SizedBox.shrink(); // 이벤트가 없으면 빈 위젯을 반환

            if (events.isNotEmpty) {
              return Stack(
                children: [
                  Positioned(
                    right: 1,
                    bottom: 1,
                    child: _buildEventsMarker(date, events),
                  ),
                ]
              );
            }
            return const SizedBox.shrink();
        },
      ),
      onDaySelected: (selectDay, focusedDay) {
        //선택된 날짜 상태 갱신
        ref.read(calendarProvider.notifier).daySelected(selectDay, focusedDay, _selectDay);

        setState(() {
          _selectDay = selectDay;
          _focusedDay = focusedDay;
        });
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectDay, day);
      },
      eventLoader: getEventsForDay,
    );
  }

  //마커
  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: MAIN_COLOR,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
