import 'package:flutter/material.dart';

import '../../common/theme/colors.dart';
import '../config/app_config.dart';

class Event {
  String imgUrl;
  String content;

  Event(this.imgUrl, this.content);
}

List<Event> getEventsForDay(day) {
  return events[day] ?? [];
}

Map<DateTime, List<Event>> events = {
  DateTime.utc(2025,2,19) : [Event('assets/images/test_img_one.png', '저녁은 춥다.'),Event('assets/images/test_img_two.png', '아침은 덥다'),],
};

TextStyle calendarTextStyle(Color color) {
  return TextStyle(
    fontSize: AppConfig.w(14),
    fontWeight: FontWeight.w400,
    color: color,
  );
}

BoxDecoration boxDeco(Color color) {
  return BoxDecoration(
    color: color,
    shape: BoxShape.circle,
  );
}

// AnimatedContainer buildCalendarDayMarker() {
//   return AnimatedContainer(
//     duration: const Duration(milliseconds: 300),
//     decoration: const BoxDecoration(
//       shape: BoxShape.rectangle,
//       color: SUB_COLOR_1,
//     ),
//     width: AppConfig.w(52),
//     height: AppConfig.h(5),
//   );
// }
//
// // 날짜가 특정 날짜와 일치하는지 확인하는 함수
// bool isEventForSpecificDate(DateTime date) {
//   return events.containsKey(DateTime.utc(date.year, date.month, date.day));
// }